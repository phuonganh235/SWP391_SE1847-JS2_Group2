<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add News</title>
        <style>
            body {
                background-color: #FFF5F7; /* Pastel pink background */
                font-family: Arial, sans-serif;
            }
            div {
                width: 50%;
                margin: auto;
                padding: 20px;
                border-radius: 10px;
                background-color: #FFFFFF; /* White background for the form */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #E91E63; /* Pastel pink text color */
            }
            label {
                font-weight: bold;
                color: #E91E63; /* Pastel pink text color */
            }
            input[type="text"], textarea, select {
                width: 100%;
                padding: 10px;
                margin: 8px 0;
                box-sizing: border-box;
                border: 2px solid #E91E63; /* Pastel pink border */
                border-radius: 5px;
                background-color: #FFF5F7; /* Pastel pink background */
            }
            input[type="submit"], input[type="reset"] {
                background-color: #E91E63; /* Pastel pink background */
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 10px;
            }
            input[type="submit"]:hover, input[type="reset"]:hover {
                background-color: #D81B60; /* Slightly darker pastel pink */
            }
            p {
                text-align: center;
                color: #E91E63; /* Pastel pink text color */
            }
        </style>
    </head>
    <body>
        <div>
            <h1>Add News Form</h1>
            <form method="post" action="addnews">
                <!-- Các trường nhập thông tin cho tin tức -->
                <label for="title">Title:</label><br>
                <input type="text" id="title" name="title" required><br>

                <label for="content">Content:</label><br>
                <textarea id="content" name="content" rows="4" cols="50" required></textarea><br>

                <label for="ImageURL">Image URL:</label><br>
                <input type="text" id="ImageURL" name="ImageURL"><br>

                <label for="CategoryID">Category:</label><br>
                <select name="CategoryID" id="CategoryID">
                    <% ResultSet rsCate = (ResultSet) request.getAttribute("rsCate");
                if (rsCate != null) { %>
                    <% while (rsCate.next()) {%>
                    <option value="<%= rsCate.getInt(1)%>"><%= rsCate.getString(2)%></option>
                    <% } %>
                    <% } else { %>
                    <option value="-1">No categories found</option>
                    <% }%>
                </select><br>

                <input type="submit" name="submit" value="Add News">
                <input type="reset" value="Reset">
                <input type="hidden" name="service" value="addnews">
            </form>

            <!-- Hiển thị thông báo thành công hoặc lỗi -->
            <c:if test="${not empty message}">
                <p>${message}</p>
            </c:if>
        </div>
    </body>
</html>
