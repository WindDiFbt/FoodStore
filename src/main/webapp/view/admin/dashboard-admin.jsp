<%-- 
    Document   : dashboard-admin
    Created on : Mar 2, 2024, 9:01:01 PM
    Author     : Asus
--%>
<%@page import="model.chart" %>
<%@page import="DAL.*" %>
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
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {packages: ['corechart', 'line']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'X');
                data.addColumn('number', 'Orders');
                data.addRows([
            <% 
                OrderDAO dao = new OrderDAO();
                for(chart c: dao.getdata()){
            %>
                    ['<%=c.getDay()%>', <%=c.getAmount()%>],
            <%}%>
                ]);
                var options = {
                    hAxis: {
                        title: 'Orders per day'
                    },
                    vAxis: {
                        title: ''
                    }
                };
                var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div class="main">
                    <nav class="navbar navbar-expand px-4 py-3">
                    </nav>
                    <main class="content px-3 py-4">
                        <div class="container-fluid">
                            <div class="mb-3">
                                <h2 class=" fw-bold ">Admin Dashboard</h2>
                                <div class="row">
                                    <div class="col-12 col-md-4 ">
                                        <div class="card border-1">
                                            <div class="card-body py-4">
                                                <h6 class="mb-2">
                                                    Number of new customers
                                                </h6>
                                                <span style="color: green" class="mb-2">
                                                <%
                                                    UserDAO udao = new UserDAO();
                                                    out.print(udao.countNewUserPerWeek());
                                                %></span>
                                            <span class="mb-2">
                                                this week
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-4 ">
                                    <div class="card border-1">
                                        <div class="card-body py-4">
                                            <h6 class="mb-2">
                                                Number of orders being processed
                                            </h6>
                                            <span style="color: green" class="mb-2">
                                                <%
                                                    OrderDAO odao1 = new OrderDAO();
                                                    out.print(odao1.countOrdersInProcessing());
                                                %>
                                            </span>
                                        </div>
                                    </div>
                                </div>                               
                                <div class="col-12 col-md-4 ">
                                    <div class="card border-1">
                                        <div class="card-body py-4">
                                            <h6 class="mb-2">
                                                Number of new orders today
                                            </h6>
                                            <span style="color: green" class="mb-2">
                                                <%
                                                    OrderDAO odao2 = new OrderDAO();
                                                    out.print(odao2.countOrdersForToday());
                                                %></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h4 class=" fs-4 my-3">Line chart showing the number of daily orders for 10 days
                            </h4>
                            <div class="row">
                                <div class="col-12">
                                    <div id="curve_chart" style="width: 1300px; height: 450px"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="../../js/hamburger.js"></script>
    </body>

</html>
