<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Tutorial 2</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cover.min.css" >
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-XdYbMnZ/QjLh6iI4ogqCTaIjrFk87ip+ekIjefZch0Y+PvJ8CDYtEs1ipDmPorQ+" crossorigin="anonymous">
    </head>
    <%
        String query = "SELECT id, nama, telepon, email FROM tutorial_2";
        Class.forName("com.mysql.jdbc.Driver");
        String userName = "law2016";
        String password = "zH4E6Dxdw5cuJ7ex";
        String url = "jdbc:mysql://localhost/law2016";
        Connection connection = DriverManager.getConnection(url, userName, password);
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();
        int numberOfColumns = metaData.getColumnCount();
    %>
    <body>
        <div class="site-wrapper">
          <div class="site-wrapper-inner">
              <div class="cover-container">
                  <div class="masthead clearfix">
                      <div class="inner">
                          <h3 class="masthead-brand">Tutorial 2</h3>
                          <nav class="nav nav-masthead">
                              <a class="nav-link active" href="index.jsp">Home</a>
                              <a class="nav-link" href="new.jsp">Add Contact</a>
                          </nav>
                      </div>
                  </div>
                  <div class="inner cover">
                      <h1 class="cover-heading">Tutorial 2</h1>
                      <p class="lead">By <b>M Prakash Divy I - 1306409513</b></p>
                      <table class="table">
                          <thead class="thead-default">
                              <tr>
                                  <th>Nama</th>
                                  <th>Telepon</th>
                                  <th>Email</th>
                                  <th>Edit</th>
                            </tr>
                          </thead>
                          <tbody>
                              <% while (resultSet.next()) { String tmp = ""; %><tr>
                              <% for (int i = 2; i <= numberOfColumns; i++) { %>            
                              <td> <% if(i==2) {%><a href="show.jsp?id=<% tmp += resultSet.getObject(1); out.print(tmp); %>"><%out.print(resultSet.getObject(i));%></a><%} else {out.print(resultSet.getObject(i));} %> </td>
                              <% } %><td><a href="edit.jsp?id=<% out.print(tmp); %>"><i class="fa fa-pencil"></i></a></td></tr><% } %>
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>
      <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    </body>
</html>
