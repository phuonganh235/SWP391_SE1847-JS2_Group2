<%-- 
    Document   : videoCall
    Created on : Jul 10, 2024, 3:35:33 PM
    Author     : phuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Video Call</title>
        <style>

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            #videos{
                display: grid;
                grid-template-columns: 1fr;
                height: 100vh;
                overflow:hidden;
            }

            .video-player{
                background-color: black;
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            #user-2{
                display: none;
            }

            .smallFrame{
                position: fixed;
                top: 20px;
                left: 20px;
                height: 170px;
                width: 300px;
                border-radius: 5px;
                border:2px solid #b366f9;
                -webkit-box-shadow: 3px 3px 15px -1px rgba(0,0,0,0.77);
                box-shadow: 3px 3px 15px -1px rgba(0,0,0,0.77);
                z-index: 999;
            }


            #controls{
                position: fixed;
                bottom: 20px;
                left: 50%;
                transform:translateX(-50%);
                display: flex;
                gap: 1em;
            }


            .control-container{
                background-color: rgb(179, 102, 249, .9);
                padding: 20px;
                border-radius: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
                cursor: pointer;
            }

            .control-container img{
                height: 30px;
                width: 30px;
            }

            #leave-btn{
                background-color: rgb(255,80,80, 1);
            }

            @media screen and (max-width:600px) {
                .smallFrame{
                    height: 80px;
                    width: 120px;
                }

                .control-container img{
                    height: 20px;
                    width: 20px;
                }
            }

        </style>
    </head>
    <body>
        <div id="videoContainer">
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
        </div>
        <script src="ViewUser/js/agora-rtm-sdk-1.4.4.js" type="text/javascript"></script>
        <script>

                    let roomId = '<%= request.getAttribute("roomId")%>';
                    let APP_ID = "cbc563eeef5a4712a25e4e4b15437e98";
                    let token = null;
                    let uid = String(Math.floor(Math.random() * 10000));

                    let client;
                    let channel;

                    let localStream;
                    let remoteStream;
                    let peerConnection;

                    const servers = {
                        iceServers: [
                            {
                                urls: ['stun:stun1.l.google.com:19302', 'stun:stun2.l.google.com:19302']
                            }
                        ]
                    };

                    let constraints = {
                        video: {
                            width: {min: 640, ideal: 1920, max: 1920},
                            height: {min: 480, ideal: 1080, max: 1080},
                        },
                        audio: true
                    };

                    let init = async () => {
                        try {
                            client = await AgoraRTM.createInstance(APP_ID);
                            await client.login({uid, token});

                            channel = client.createChannel(roomId);
                            await channel.join();

                            channel.on('MemberJoined', handleUserJoined);
                            channel.on('MemberLeft', handleUserLeft);

                            client.on('MessageFromPeer', handleMessageFromPeer);

                            localStream = await navigator.mediaDevices.getUserMedia(constraints);
                            document.getElementById('user-1').srcObject = localStream;
                        } catch (error) {
                            console.error('Error during initialization:', error);
                            alert(`An error occurred: ${error.message}`);
                        }
                    };

                    let handleUserLeft = (MemberId) => {
                        document.getElementById('user-2').style.display = 'none';
                        document.getElementById('user-1').classList.remove('smallFrame');
                    };

                    let handleMessageFromPeer = async (message, MemberId) => {
                        try {
                            message = JSON.parse(message.text);

                            if (message.type === 'offer') {
                                await createAnswer(MemberId, message.offer);
                            }

                            if (message.type === 'answer') {
                                await addAnswer(message.answer);
                            }

                            if (message.type === 'candidate') {
                                if (peerConnection) {
                                    await peerConnection.addIceCandidate(message.candidate);
                                }
                            }
                        } catch (error) {
                            console.error('Error handling message from peer:', error);
                        }
                    };

                    let handleUserJoined = async (MemberId) => {
                        console.log('A new user joined the channel:', MemberId);
                        await createOffer(MemberId);
                    };

                    let createPeerConnection = async (MemberId) => {
                        peerConnection = new RTCPeerConnection(servers);

                        remoteStream = new MediaStream();
                        document.getElementById('user-2').srcObject = remoteStream;
                        document.getElementById('user-2').style.display = 'block';

                        document.getElementById('user-1').classList.add('smallFrame');

                        if (!localStream) {
                            localStream = await navigator.mediaDevices.getUserMedia({video: true, audio: true});
                            document.getElementById('user-1').srcObject = localStream;
                        }

                        localStream.getTracks().forEach((track) => {
                            peerConnection.addTrack(track, localStream);
                        });

                        peerConnection.ontrack = (event) => {
                            event.streams[0].getTracks().forEach((track) => {
                                remoteStream.addTrack(track);
                            });
                        };

                        peerConnection.onicecandidate = async (event) => {
                            if (event.candidate) {
                                await client.sendMessageToPeer({text: JSON.stringify({'type': 'candidate', 'candidate': event.candidate})}, MemberId);
                            }
                        };

                        peerConnection.onnegotiationneeded = async () => {
                            try {
                                await peerConnection.setLocalDescription(await peerConnection.createOffer());
                                await client.sendMessageToPeer({text: JSON.stringify({'type': 'offer', 'offer': peerConnection.localDescription})}, MemberId);
                            } catch (err) {
                                console.error('Error during negotiation:', err);
                            }
                        };
                    };

                    let createOffer = async (MemberId) => {
                        await createPeerConnection(MemberId);

                        let offer = await peerConnection.createOffer();
                        await peerConnection.setLocalDescription(offer);

                        await client.sendMessageToPeer({text: JSON.stringify({'type': 'offer', 'offer': offer})}, MemberId);
                    };

                    let createAnswer = async (MemberId, offer) => {
                        await createPeerConnection(MemberId);

                        await peerConnection.setRemoteDescription(offer);

                        let answer = await peerConnection.createAnswer();
                        await peerConnection.setLocalDescription(answer);

                        await client.sendMessageToPeer({text: JSON.stringify({'type': 'answer', 'answer': answer})}, MemberId);
                    };

                    let addAnswer = async (answer) => {
                        if (!peerConnection.currentRemoteDescription) {
                            await peerConnection.setRemoteDescription(answer);
                        }
                    };

                    let leaveChannel = async () => {
                        await channel.leave();
                        await client.logout();
                        window.close();
                    };

                    let toggleCamera = async () => {
                        let videoTrack = localStream.getTracks().find(track => track.kind === 'video');

                        if (videoTrack.enabled) {
                            videoTrack.enabled = false;
                            document.getElementById('camera-btn').style.backgroundColor = 'rgb(255, 80, 80)';
                        } else {
                            videoTrack.enabled = true;
                            document.getElementById('camera-btn').style.backgroundColor = 'rgba(179, 102, 249, 0.9)';
                        }
                    };

                    let toggleMic = async () => {
                        let audioTrack = localStream.getTracks().find(track => track.kind === 'audio');

                        if (audioTrack.enabled) {
                            audioTrack.enabled = false;
                            document.getElementById('mic-btn').style.backgroundColor = 'rgb(255, 80, 80)';
                        } else {
                            audioTrack.enabled = true;
                            document.getElementById('mic-btn').style.backgroundColor = 'rgba(179, 102, 249, 0.9)';
                        }
                    };

                    window.addEventListener('beforeunload', leaveChannel);
                    document.getElementById('camera-btn').addEventListener('click', toggleCamera);
                    document.getElementById('mic-btn').addEventListener('click', toggleMic);

                    init();
        </script>
    </body>
</html>