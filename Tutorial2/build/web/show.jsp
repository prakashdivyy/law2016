<%-- 
    Document   : show
    Created on : Mar 7, 2016, 5:01:51 PM
    Author     : m.prakash
--%>
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
    </head>
    <%      
            String id = request.getParameter("id");
            String query = "SELECT * FROM tutorial_2 WHERE id='" + id +"'";
            Class.forName("com.mysql.jdbc.Driver");
            String userName = "law2016";
            String password = "zH4E6Dxdw5cuJ7ex";
            String url = "jdbc:mysql://localhost/law2016";
            Connection connection = DriverManager.getConnection(url, userName, password);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            ResultSetMetaData metaData = resultSet.getMetaData();
            int numberOfColumns = metaData.getColumnCount();
            String [] header = new String [3];
            header[0] = "Nama";
            header[1] = "Telepon";
            header[2] = "Email";
            resultSet.next();
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
                          </nav>
                      </div>
                  </div>
                  <div class="inner cover">
                     <table class="table">
                          <tbody>
                            <% for(int i = 2; i <= 4; i++) { 
                                String tmp = "";
                                if(i==2){
                                    tmp = header[0];
                                } else if(i==3){
                                    tmp = header[1];
                                } else if(i==4){
                                    tmp = header[2];
                                }
                            %>
                            <tr>
                              <th scope="row"><% out.print(tmp);%></th>
                              <td><% out.print(resultSet.getObject(i));%></td>
                            </tr>
                            <% } %>
                            <tr>
                              <% String alamat = "" + resultSet.getObject(5) + ", " + resultSet.getObject(6) + ", " + resultSet.getObject(7) + ", " + resultSet.getObject(8) + ", " + resultSet.getObject(9); %>
                              <th scope="row">Alamat</th>
                              <td><% out.print(alamat);%></td>
                            </tr>
                            <% if(resultSet.getObject(10) != null){ %>
                            <tr>
                              <th scope="row"><% out.print(resultSet.getObject(11));%></th>
                              <td><% out.print(resultSet.getObject(10));%></td>
                            </tr>
                            <% } %>
                            <% if(resultSet.getObject(11) != null){ %>
                            <tr>
                              <th scope="row"><% out.print(resultSet.getObject(11));%></th>
                              <td><% out.print(resultSet.getObject(10));%></td>
                            </tr>
                            <% } %>
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>
      <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    </body>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>
