<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<%Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
    System.out.print("hello world");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="Stylesheet" href="css/Style.css">
        <style>
            body {margin:0;}

            ul {
              list-style-type: none;
              margin: 0;
              padding: 0 15%;
              overflow: hidden;
              background-color: #f5f5f5;
              /* position: fixed; */
              top: 0;
              width: 100%;
            }

            li {
              float: left;
              
            }

            li a {
              display: block;
              color: #000;
              text-align: center;
              padding: 14px 16px;
              text-decoration: none;
              font-size: 2rem;
            }

            li a:hover:not(.active) {
              background-color: #70eeff;
            }

            .active {
              background-color: #70eeff;
              color: #fff;
              font-weight: bold;
            }
            
            .logout {
                float: right;
            }
            
            .sidenav {
                width: 130px;
                position: fixed;
                z-index: 1;
                top: 100px;
                left: 10px;
                background: #eee;
                overflow-x: hidden;
                padding: 8px 0;
              }

              .sidenav a {
                padding: 6px 8px 6px 16px;
                text-decoration: none;
                font-size: 25px;
                color: black;
                display: block;
              }

              .sidenav a:hover {
                color: #064579;
                background-color: #70eeff;
              }
              
              table {
                  width: 50%;
                  padding: 5px 5px;
                  border: 1px;
                  background-color: #fffff;
              }
              .center {
                  margin-left: auto;
                  margin-right: auto;
              }

              .tableHeading {
                  background-color: #f2f2f2;
                  text-align: center;
                  height: 20px;
              }
              
              .tableColor {
                  background-color: #ffffff;
              }
              
              .main {
                margin-left: 140px; /* Same width as the sidebar + left position in px */
                font-size: 28px; /* Increased text to enable scrolling */
                padding: 0px 10px;
              }

              @media screen and (max-height: 450px) {
                .sidenav {padding-top: 15px;}
                .sidenav a {font-size: 18px;}
              }
        </style>
    </head>
    <body>
        <div>
            <ul>
                <li><a class="active" href="adminProductList.jsp">Home</a></li>
                <li><a href="adminProductList.jsp">Products</a></li>
                <li class="order-dropdown">
                    </div>
                </li>
                <li class="float-right"><a href="logout.jsp">Logout</a></li>
                <li class="float-right"><a href="adminProfile.jsp">My Profile</a></li>
            </ul>
        </div>
        <div class="sidenav" id="staffControl">
  <a href="updateIndex.jsp">Update</a>
  <a href="addIndex.jsp">Add</a>
  <a href="deleteIndex.jsp">Delete</a>
</div>
    <center>
<form class="form-inline" method="post" action="adminSearch.jsp">
<table class="center" border="0">
    <tr> 
        <td><h1>Products</h1></td>
        <td><input type="text" name="search_product" class="form-control" placeholder="Search name or type">
            <button type="submit" name="save" class="btn btn-primary">Search</button></td>
    </tr>
</table>
</form>
    
<table border="1" class="mb-5 pb-5">
<tr class="tableHeading">
<td>Product ID</td>
<td>Product Name</td>
<td>Price Per Unit</td>
<td>Total Quantity</td>
<td>Product Type</td>
<td>Supplier ID</td>

</tr>
<%
                    try{
                    String sql ="select * from product";
//                    String sql = "select * from product p inner join supplier s on p.SUPPLIER_ID = s.SUPPLIER_ID";
                    ResultSet resultSet = st.executeQuery(sql);
                    while(resultSet.next()){
                %>
<tr class="tableColor">
<td><%=resultSet.getString("product_id") %></td>
<td><%=resultSet.getString("product_name") %></td>
<td><%=resultSet.getString("total_quantity") %></td>
<td><%=resultSet.getString("price_per_unit") %></td>
<td><%=resultSet.getString("product_type") %></td>
<td><%=resultSet.getString("supplier_id") %></td>
</tr>
 <% } con.close();} catch (Exception e) { e.printStackTrace(); } %></table>
    </center>
</body>
</html>