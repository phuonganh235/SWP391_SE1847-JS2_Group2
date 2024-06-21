<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit News</title>
</head>
<body>
    <div>
        <h1>Edit News</h1>
        <c:if test="${not empty message}">
            <p>${message}</p>
        </c:if>

        <form method="post" action="editnews">
            <input type="hidden" name="service" value="editNews">
            <input type="hidden" name="newsId" value="${news.newsId}">

            <label for="title">Title:</label><br>
            <input type="text" id="title" name="title" value="${news.title}" required><br>

            <label for="content">Content:</label><br>
            <textarea id="content" name="content" rows="4" cols="50" required>${news.content}</textarea><br>

            <label for="imgUrl">Image URL:</label><br>
            <input type="text" id="imgUrl" name="imgUrl" value="${news.imgUrl}"><br>

            <label for="categoryID">Category:</label><br>
            <select name="categoryID" id="categoryID">
                <c:forEach var="category" items="${rsCate}">
                    <option value="${category.categoryID}" ${category.categoryID == news.categoryID ? 'selected' : ''}>
                        ${category.categoryName}
                    </option>
                </c:forEach>
            </select><br>

            <input type="submit" name="submit" value="Update">
            <input type="reset" value="Reset">
        </form>

        <br>
        <a href="home">Back to Home</a>
    </div>
</body>
</html>
