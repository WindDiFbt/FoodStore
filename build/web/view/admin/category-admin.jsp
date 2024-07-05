<%-- 
    Document   : category-admin
    Created on : Mar 3, 2024, 10:06:59 AM
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
            .datatable-table td {
                padding: 8px; /* Adjust the value to set the desired spacing */
            }
        </style>
        <script src="../../js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div class="main" id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">List Category</h1>
                        <div class="add-action mb-2">
                            <a  class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addCategoryModal"><span>Add New Category</span></a>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Category Table
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" class="datatable-table" >
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listCategory}" var = "category">
                                        <tr>
                                            <td>${category.category_id}</td>
                                            <td>${category.name}</td>
                                            <td >
                                                <a onclick="CategoryInfo('${category.category_id}', '${category.name}')" data-bs-toggle="modal" data-bs-target="#editCategoryModal" title="Edit"> 
                                                    <i style="color: green" class="lni lni-pencil"></i></a>
                                                <a onclick="CategoryInfo('${category.category_id}', '${category.name}')" data-bs-toggle="modal" data-bs-target="#deleteCategoryModal" title="Delete">
                                                    <i style="color: red" class="lni lni-trash-can"></i></a>
                                            </td>
                                        </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Add category modal-->
        <div id="addCategoryModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addCategoryAdmin" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Category</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
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

        <!-- Edit category modal-->
        <div id="editCategoryModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editCategoryAdmin" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Category</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <input type="hidden" name="category_id" id="CategoryIdInput"/>
                                <label>Name</label>
                                <input name="re_name" type="text" class="form-control" id="CategoryNameInput" required>
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

        <!-- Delete category modal -->
        <div id="deleteCategoryModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="deleteCategoryAdmin" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Category</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <input type="hidden" name="category_id" id="CategoryIdInput2"/>
                                <span>Confirm deletion of <span style="color: blue" id="CategoryNameInput2"></span> category?</span>
                                <p class="text-warning"><small>This action cannot be undone.</small></p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function CategoryInfo(categoryId, categoryName) {
                document.getElementById('CategoryIdInput').value = categoryId;
                document.getElementById('CategoryIdInput2').value = categoryId;
                document.getElementById('CategoryNameInput').value = categoryName;
                document.getElementById('CategoryNameInput2').textContent = categoryName;
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="../../js/hamburger.js"></script>
        <script type="text/javascript" src="../../js/admin/modal.js"></script>
    </body>
</html>
