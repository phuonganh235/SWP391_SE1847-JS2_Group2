
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HappyBeauty</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="ViewAdmin/css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img {
                width: 120px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Update <b>Category</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editProductModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="managercategory?service=edit" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Update Category</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>

                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="categoryId">Category ID</label>
                                    <input type="number" class="form-control" id="categoryId" name="categoryId" value="${cat.categoryId}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="categoryName">Category Name</label>
                                    <input type="text" class="form-control" id="categoryName" name="categoryName" value="${cat.categoryName}" required>
                                </div>
                                <div class="form-group">
                                    <label for="categoryImageUrl">Category Img</label>
                                    <input type="text" class="form-control" id="categoryImageUrl" name="categoryImageUrl" value="${cat.categoryImageUrl}" required>
                                </div>

                                <div class="form-group">
                                    <label for="isActive">Is Active</label>
                                    <input type="checkbox" class="form-check-input" id="isActive" name="isActive" <c:if test="${cat.isActive}">checked</c:if>>
                                    </div>
                                    <div class="form-group">
                                        <label for="createDate">Create Date</label>
                                        <input type="text" class="form-control" id="createDate" name="createDate" value="${cat.createDate}" >
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Update">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="ViewAdmin/js/manager.js" type="text/javascript"></script>
    </body>
</html>

