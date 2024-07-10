<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Video Call</title>
        <script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-database.js"></script>
        <style>
            #videos {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 2em;
                height: 100vh;
                padding: 1em;
            }
            .video-player {
                background-color: black;
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            #controls {
                position: fixed;
                bottom: 20px;
                left: 50%;
                transform: translateX(-50%);
                display: flex;
                gap: 1em;
            }
            .control-container {
                background-color: rgba(179, 102, 249, .9);
                padding: 20px;
                border-radius: 50%;
                cursor: pointer;
            }
            .control-container img {
                width: 30px;
                height: 30px;
            }
            #leave-btn {
                background-color: rgb(255,80,80);
            }
        </style>
    </head>
    <body>
        <div id="videos">
            <video class="video-player" id="user-1" autoplay playsinline></video>
            <video class="video-player" id="user-2" autoplay playsinline></video>
        </div>
        <div id="controls">
            <div class="control-container" id="camera-btn" onclick="toggleCamera()">
                <img src="ViewUser/img/camera.png" alt="Camera" />
            </div>
            <div class="control-container" id="mic-btn" onclick="toggleMic()">
                <img src="ViewUser/img/mic.png" alt="Microphone" />
            </div>
            <div class="control-container" id="leave-btn" onclick="leaveChannel()">
                <img src="ViewUser/img/phone.png" alt="End Call" />
            </div>
        </div>

        <script>
            const firebaseConfig = {
                apiKey: "AIzaSyBTbwB5YBnfmJKA5U1_1IqZJgjlXQFlYZY",
                authDomain: "happybeautysystem.firebaseapp.com",
                databaseURL: "https://happybeautysystem-default-rtdb.firebaseio.com",
                projectId: "happybeautysystem",
                storageBucket: "happybeautysystem.appspot.com",
                messagingSenderId: "1079459372067"
            };
            firebase.initializeApp(firebaseConfig);

            let roomId = '<%= request.getParameter("roomId")%>';
            let localStream;
            let remoteStream;
            let peerConnection;

            const servers = {
                iceServers: [
                    {
                        urls: [
                            'stun:stun1.l.google.com:19302',
                            'stun:stun2.l.google.com:19302',
                        ]
                    }
                ]
            };

            async function init() {
                try {
                    localStream = await navigator.mediaDevices.getUserMedia({video: true, audio: true});
                    document.getElementById('user-1').srcObject = localStream;
                    console.log("Local stream set up successfully");
                    await createOrJoinRoom();
                } catch (error) {
                    console.error("Error in init:", error);
                }
            }

            async function createOrJoinRoom() {
                try {
                    const roomRef = firebase.database().ref(roomId);
                    const roomSnapshot = await roomRef.once('value');
                    console.log("Room exists:", roomSnapshot.exists());

                    if (!roomSnapshot.exists()) {
                        await roomRef.set({created: true});
                        console.log("Created new room");
                        await waitForOtherUser();
                    } else {
                        console.log("Joining existing room");
                        await joinRoom();
                    }
                } catch (error) {
                    console.error("Error in createOrJoinRoom:", error);
                }
            }

            function waitForOtherUser() {
                const roomRef = firebase.database().ref(roomId);
                console.log("Waiting for other user...");
                return new Promise((resolve) => {
                    roomRef.on('value', async (snapshot) => {
                        console.log("Room value changed:", snapshot.val());
                        if (snapshot.val() && snapshot.val().offer) {
                            console.log("Offer received, joining room");
                            roomRef.off();
                            await joinRoom();
                            resolve();
                        }
                    });
                });
            }

            async function createPeerConnection() {
                peerConnection = new RTCPeerConnection(servers);

                remoteStream = new MediaStream();
                document.getElementById('user-2').srcObject = remoteStream;

                localStream.getTracks().forEach((track) => {
                    peerConnection.addTrack(track, localStream);
                    console.log("Added local track:", track.kind);
                });

                peerConnection.ontrack = (event) => {
                    console.log("Received remote track:", event.track.kind);
                    event.streams[0].getTracks().forEach((track) => {
                        remoteStream.addTrack(track);
                    });
                }

                peerConnection.onicecandidate = async (event) => {
                    if (event.candidate) {
                        console.log("New ICE candidate:", event.candidate);
                        await firebase.database().ref(roomId).child('candidates').push(event.candidate.toJSON());
                    }
                }

                peerConnection.oniceconnectionstatechange = () => {
                    console.log("ICE connection state:", peerConnection.iceConnectionState);
                };

                peerConnection.onsignalingstatechange = () => {
                    console.log("Signaling state:", peerConnection.signalingState);
                };
            }

            async function joinRoom() {
                try {
                    await createPeerConnection();

                    const roomRef = firebase.database().ref(roomId);
                    const offerSnapshot = await roomRef.child('offer').once('value');
                    console.log("Offer snapshot exists:", offerSnapshot.exists());

                    if (offerSnapshot.exists()) {
                        console.log("Setting remote description from offer");
                        const offer = offerSnapshot.val();
                        await peerConnection.setRemoteDescription(new RTCSessionDescription(offer));

                        const answer = await peerConnection.createAnswer();
                        await peerConnection.setLocalDescription(answer);

                        console.log("Created answer:", answer);
                        await roomRef.child('answer').set(answer);
                    } else {
                        console.log("Creating offer");
                        const offer = await peerConnection.createOffer();
                        await peerConnection.setLocalDescription(offer);

                        console.log("Created offer:", offer);
                        await roomRef.child('offer').set(offer);
                    }

                    roomRef.child('candidates').on('child_added', async (snapshot) => {
                        console.log("New remote ICE candidate received");
                        const candidate = new RTCIceCandidate(snapshot.val());
                        await peerConnection.addIceCandidate(candidate);
                    });

                    roomRef.child('answer').on('value', async (snapshot) => {
                        const answer = snapshot.val();
                        if (answer && !peerConnection.currentRemoteDescription) {
                            console.log("Setting remote description from answer");
                            await peerConnection.setRemoteDescription(new RTCSessionDescription(answer));
                        }
                    });
                } catch (error) {
                    console.error("Error in joinRoom:", error);
                }
            }

            function toggleCamera() {
                const videoTrack = localStream.getTracks().find(track => track.kind === 'video');
                videoTrack.enabled = !videoTrack.enabled;
                document.getElementById('camera-btn').style.backgroundColor =
                        videoTrack.enabled ? 'rgba(179, 102, 249, .9)' : 'rgb(255, 80, 80)';
            }

            function toggleMic() {
                const audioTrack = localStream.getTracks().find(track => track.kind === 'audio');
                audioTrack.enabled = !audioTrack.enabled;
                document.getElementById('mic-btn').style.backgroundColor =
                        audioTrack.enabled ? 'rgba(179, 102, 249, .9)' : 'rgb(255, 80, 80)';
            }

            async function leaveChannel() {
                if (peerConnection) {
                    peerConnection.close();
                }
                if (localStream) {
                    localStream.getTracks().forEach(track => track.stop());
                }
                await firebase.database().ref(roomId).remove();
                window.close();
            }

            window.addEventListener('beforeunload', leaveChannel);
            init();
        </script>
    </body>
</html>