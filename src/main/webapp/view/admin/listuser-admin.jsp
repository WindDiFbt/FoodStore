<%-- 
    Document   : listuser-admin
    Created on : Mar 4, 2024, 12:56:54 AM
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
            .datatable-table td, th, p {
                padding: 7px; /* Adjust the value to set the desired spacing */
            }
            .scrollable-table {
                max-height: 600px; /* Đặt chiều cao tối đa của bảng */
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
                            <h1 class="mt-4">List User</h1>
                            <div>
                                <div class="input-group rounded">
                                    <form action="searchubynameAdmin" method="post">
                                        <div style=" display: flex; justify-content: space-between">
                                            <div>
                                                <input style="padding-right: 100px" type="search" id="search-form" class="mt-4 form-control rounded search-field" placeholder="Search user by name" value="" name="txt" />
                                            </div>
                                            <div>
                                                <button type="submit"  class="input-group-text border-0 mt-4 search-submit"><i class="lni lni-search-alt"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                User Table
                            </div>
                            <div class="card-body scrollable-table">
                                <table id="datatablesSimple" class="datatable-table" >
                                    <thead>
                                        <tr style="font-size: 12px">
                                            <th>ID</th>
                                            <th style="width: 15%">Full Name</th>
                                            <th>Gender</th>
                                            <th style="width: 15%">Email</th>
                                            <th>Phone number</th>
                                            <th style="width: 15%">Address</th>
                                            <th style="width: 10%">Date of birth</th>
                                            <th>Account_name</th>
                                            <th>Password</th>
                                            <th>Created at</th>
                                            <th>Updated at</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listUser}" var = "user">
                                        <c:set var="gender" value="1" />
                                        <tr style="font-size: 11px">
                                            <td>${user.user_id}</td>
                                            <td>${user.fullname}</td>
                                            <td><c:choose>
                                                    <c:when test="${user.gender eq 1}">
                                                        <span> Male</span>
                                                    </c:when>
                                                    <c:when test="${user.gender eq 0}">
                                                        <span>Female</span>
                                                    </c:when>
                                                </c:choose></td>
                                            <td>${user.email}</td>
                                            <td>${user.phone_number}</td>
                                            <td>${user.address}</td>
                                            <td>${user.date_of_birth}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${user.deleted eq 1}">
                                                        <span style="color: red"> ${user.account_name}</span>
                                                    </c:when>
                                                    <c:when test="${user.deleted eq 0}">
                                                        <span style="color: green"> ${user.account_name}</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td>${user.password}</td>
                                            <td>${user.created_at}</td>
                                            <td>${user.updated_at}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${user.deleted eq 0}">
                                                        <a onclick="UserInfo('${user.user_id}', '${user.deleted}', '${user.account_name}')" style=" font-size: 15px; display: flex; justify-content: center; color: green" data-bs-toggle="modal" data-bs-target="#lockUserModal" title="Lock"> 
                                                            <i class="lni lni-lock"></i>
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a onclick="UserInfo('${user.user_id}', '${user.deleted}', '${user.account_name}')" style=" font-size: 15px; display: flex; justify-content: center; color: red" data-bs-toggle="modal" data-bs-target="#unlockUserModal" title="Unlock"> 
                                                            <i class="lni lni-unlock"></i>
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
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

        <!-- lock user modal -->
        <div id="lockUserModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editUserAdmin" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Lock account</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <input type="hidden" name="user_id" id="user_idInput"/>
                                <input type="hidden" name="deleted" id="deletedInput"/>
                                <span>Confirm locking account name:<span style="color: blue" id="account_nameInput"></span>?</span>
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

        <!-- unlock user modal -->
        <div id="unlockUserModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editUserAdmin" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Unlock account</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <input type="hidden" name="user_id" id="user_idInput2"/>
                                <input type="hidden" name="deleted" id="deletedInput2"/>
                                <span>Confirm unlocking account name: <span style="color: blue" id="account_nameInput2"></span>?</span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Xác nhận">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function UserInfo(user_id, deleted, account_name) {
                document.getElementById('user_idInput').value = user_id;
                document.getElementById('deletedInput').value = deleted;
                document.getElementById('account_nameInput').textContent = account_name;

                document.getElementById('user_idInput2').value = user_id;
                document.getElementById('deletedInput2').value = deleted;
                document.getElementById('account_nameInput2').textContent = account_name;
            }

        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="../../js/hamburger.js"></script>
        <script type="text/javascript" src="../../js/admin/modal.js"></script>
    </body>
</html>
