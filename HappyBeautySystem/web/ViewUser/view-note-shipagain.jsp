<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shipping Issue</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f0f0f0;
            }
            .container {
                background: #fff;
                padding: 100px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h2 {
                margin-bottom: 20px;
            }
            textarea {
                width: 100%;
                height: 250px;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
            }
            .buttons {
                display: flex;
                justify-content: space-between;
            }
            .button {
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .complete {
                background-color: #28a745;
                color: #fff;
            }
            .back {
                background-color: #ffc107;
                color: #fff;
                text-decoration: none;
                display: inline-block;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h2>Lý do ship hàng lại</h2>
            <form action="managerShipper?service=AddNoteShipAgain" method="post">
                <textarea id="reason" name="reason" placeholder="Điền lý do tại đây..."></textarea>
                <input type="hidden" id="orderID" name="orderID" value="${orderID}">
                <div class="buttons">
                    <button type="submit" class="button complete">Xác nhận</button>
                    <a href="/HappyBeautySystem/managerShipper?service=ListTask&option=3" class="button back">Quay lại</a>
                </div>
            </form>
        </div>

    </body>
</html>


