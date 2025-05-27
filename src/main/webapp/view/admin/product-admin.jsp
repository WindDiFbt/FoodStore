<%-- 
    Document   : product-admin
    Created on : Mar 4, 2024, 10:59:37 AM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin</title>
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="../../css/admin_style.css">
        <link rel="stylesheet" href="../../css/manager.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <style>
            .datatable-table td, th {
                padding: 8px; /* Adjust the value to set the desired spacing */
            }

            .modal-add {
                font-size: 12px;
            }

            .form-group input,
            .form-group textarea {
                font-size: 11px; /* You can adjust the font size as needed */
            }

            .scrollable-table {
                max-height: 580px; /* Đặt chiều cao tối đa của bảng */
                overflow: auto; /* Tạo thanh cuộn nếu bảng vượt quá kích thước tối đa */
            }
        </style>
        <script src="../../js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div class="main" id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <div style=" display: flex; justify-content: space-between">
                            <h1 class="mt-4">List Product</h1>
                            <div>
                                <div class="input-group rounded">
                                    <form action="searchproductAdmin" method="post">
                                        <div style=" display: flex; justify-content: space-between">
                                            <div>
                                                <input style="padding-right: 100px" type="search" id="search-form" class="mt-4 form-control rounded search-field" placeholder="Search by name" value="" name="txt" />
                                            </div>
                                            <div>
                                                <button type="submit"  class="input-group-text border-0 mt-4 search-submit"><i class="lni lni-search-alt"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="add-action mb-2">
                            <a  class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addProductModal"><span>Add New Product</span></a>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Product Table
                            </div>
                            <div class="card-body scrollable-table">
                                <table id="datatablesSimple" class="datatable-table" >
                                    <thead>
                                        <tr style="font-size: 13px">
                                            <th>Product ID</th>
                                            <th>Category ID</th>
                                            <th style="width: 20%">Image</th>
                                            <th style="width: 25%">Name</th>
                                            <th style="width: 7%">Weight</th>
                                            <th style="width: 7%">Price</th>
                                            <th style="width: 7%">Discount</th>
                                            <th>Created at</th>
                                            <th>Updated at</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listProduct}" var = "product">
                                        <tr style="font-size: 13px">
                                            <td>${product.product_id}</td>
                                            <td>${product.category_id}</td>
                                            <td>
                                                <img style="width: 50%" src="../../${product.image}">
                                            </td>
                                            <td>${product.name}</td>
                                            <td>${product.weight}</td>
                                            <td>${product.price}</td>
                                            <td>${product.discount}</td>
                                            <td>${product.created_at}</td>
                                            <td>${product.updated_at}</td>
                                            <td>
                                                <a onclick="editProductInfo('${product.product_id}', '${product.name}', '${product.category_id}', '${product.image}', '${product.weight}',
                                                                '${product.price}', '${product.discount}', '${product.ingredient}', '${product.user_manual}', '${product.more_info}')" style=" font-size: 15px; color: green" 
                                                   data-bs-toggle="modal" data-bs-target="#editProductModal" title="Edit"> <i class="lni lni-pencil"></i></a>
                                                <a onclick="ProductInfo('${product.product_id}', '${product.name}')" style=" font-size: 15px; color: red"
                                                   data-bs-toggle="modal" data-bs-target="#deleteProductModal" title="Delete"> <i class="lni lni-trash-can"></i></a>
                                            </td>
                                        </tr>   
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Add product modal-->
        <div id="addProductModal" class="modal fade">
            <div class="modal-dialog" style="margin-left: 450px;">
                <div class="modal-content modal-add" style="width: 150%;">
                    <form action="addProductAdmin" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Category:</label>
                                <select name="category_id">
                                    <c:forEach items="${listCategory}" var="category">
                                        <option value="${category.category_id}">${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Weight</label>
                                <input name="weight" type="text" class="form-control" placeholder="g" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" placeholder="VND" required>
                            </div>
                            <div class="form-group">
                                <label>Discount</label>
                                <input name="discount" type="text" class="form-control" placeholder="%" required>
                            </div>
                            <div class="form-group">
                                <label>Ingredient</label>
                                <textarea name="ingredient" type="text" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>User manual</label>
                                <textarea rows="8" name="user_manual" type="text" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>More information</label>
                                <textarea name="more_info" type="text" class="form-control" required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Delete Product modal -->
        <div id="deleteProductModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="deleteProductAdmin" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <input type="hidden" name="product_id" id="product_idInput"/>
                                <span>Confirm deletion of product <span style="color: blue" id="product_nameInput"></span>?</span>
                                <p class="text-warning"><small>This action cannot be undone.</small></p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Confirm">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Edit product modal-->
        <div id="editProductModal" class="modal fade">
            <div class="modal-dialog" style="margin-left: 450px;">
                <div class="modal-content modal-add" style="width: 150%;">
                    <form action="editProductAdmin" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Product</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <input type="hidden" name="product_id" id="product_idInput2"/>
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" id="nameInput2" required>
                            </div>
                            <div class="form-group">
                                <label>Category:</label>
                                <select name="category_id" id="category_idInput2">
                                    <c:forEach items="${listCategory}" var="category">
                                        <option value="${category.category_id}">${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" id="imageInput2" required>
                            </div>
                            <div class="form-group">
                                <label>Weight</label>
                                <input name="weight" type="text" class="form-control" id="weightInput2" placeholder="g" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" id="priceInput2" placeholder="VND" required>
                            </div>
                            <div class="form-group">
                                <label>Discount</label>
                                <input name="discount" type="text" class="form-control" id="discountInput2" placeholder="%" required>
                            </div>
                            <div class="form-group">
                                <label>Ingredient</label>
                                <textarea name="ingredient" type="text" class="form-control" id="ingredientInput2" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>User manual</label>
                                <textarea rows="8" name="user_manual" type="text" class="form-control" id="user_manualInput2" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>More information</label>
                                <textarea name="more_info" type="text" class="form-control" id="more_infoInput2" required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="reset" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Edit">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function ProductInfo(product_id, name) {
                document.getElementById('product_idInput').value = product_id;
                document.getElementById('product_nameInput').textContent = name;
            }

            function editProductInfo(product_id, name, category_id, image, weight, price, discount, ingredient, user_manual, more_info) {
                document.getElementById('product_idInput2').value = product_id;
                document.getElementById('nameInput2').value = name;
                document.getElementById('category_idInput2').value = category_id;
                document.getElementById('imageInput2').value = image;
                document.getElementById('weightInput2').value = weight;
                document.getElementById('priceInput2').value = price;
                document.getElementById('discountInput2').value = discount;
                document.getElementById('ingredientInput2').value = ingredient;
                document.getElementById('user_manualInput2').value = user_manual;
                document.getElementById('more_infoInput2').value = more_info;
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="../../js/hamburger.js"></script>
        <script type="text/javascript" src="../../js/admin/modal.js"></script>
    </body>
</html>
