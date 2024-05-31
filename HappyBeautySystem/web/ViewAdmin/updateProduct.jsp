
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
                            <h2>Update <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editProductModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="manager?service=edit" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Update Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label for="productId">Product ID</label>
                                    <input type="number" class="form-control" id="productId" name="productId" value="${product.productId}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="productName">Product Name</label>
                                    <input type="text" class="form-control" id="productName" name="productName" value="${product.productName}" required>
                                </div>
                                <div class="form-group">
                                    <label for="shortDes">Short Description</label>
                                    <textarea class="form-control" id="shortDes" name="shortDes" required>${product.shortDes}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="longDes">Long Description</label>
                                    <textarea class="form-control" id="longDes" name="longDes" required>${product.longDes}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="addDes">Add Description</label>
                                    <input type="text" class="form-control" id="addDes" name="addDes" value="${product.addDes}" required>
                                </div>
                                <div class="form-group">
                                    <label for="price">Price</label>
                                    <input type="number" class="form-control" id="price" name="price" value="${product.price}" required>
                                </div>
                                <div class="form-group">
                                    <label for="quantity">Quantity</label>
                                    <input type="number" class="form-control" id="quantity" name="quantity" value="${product.quantity}" required>
                                </div>
                                <div class="form-group">
                                    <label for="size">Size</label>
                                    <input type="text" class="form-control" id="size" name="size" value="${product.size}" required>
                                </div>
                                <div class="form-group">
                                    <label for="color">Color</label>
                                    <input type="text" class="form-control" id="color" name="color" value="${product.color}" required>
                                </div>
                                <div class="form-group">
                                    <label for="companyName">Company Name</label>
                                    <input type="text" class="form-control" id="companyName" name="companyName" value="${product.companyName}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="cateId" class="form-label">Category</label>
                                    <select class="form-select" id="cateId" name="cateId" required>
                                        <c:forEach items="${listCat}" var="cat">
                                            <option value="${cat.categoryId}" ${cat.categoryId == product.cateId ? 'selected' : ''}>${cat.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="subCateId">SubCategory</label>
                                    <input type="number" class="form-control" id="subCateId" name="subCateId" value="${product.subCateId}" required>
                                </div>
                                <div class="form-group">
                                    <label for="sold">Sold</label>
                                    <input type="number" class="form-control" id="sold" name="sold" value="${product.sold}" required>
                                </div>
                                <div class="form-group">
                                    <label for="isCustomized">Is Customized</label>
                                    <input type="checkbox" class="form-check-input" id="isCustomized" name="isCustomized" <c:if test="${product.isCustomized}">checked</c:if>>
                                    </div>
                                    <div class="form-group">
                                        <label for="isActive">Is Active</label>
                                        <input type="checkbox" class="form-check-input" id="isActive" name="isActive" <c:if test="${product.isActive}">checked</c:if>>
                                    </div>
                                    <div class="form-group">
                                        <label for="createDate">Create Date</label>
                                        <input type="text" class="form-control" id="createDate" name="createDate" value="${product.createDate}" required>
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

