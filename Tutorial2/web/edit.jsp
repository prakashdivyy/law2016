<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Edit Contact</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cover.min.css" >
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-XdYbMnZ/QjLh6iI4ogqCTaIjrFk87ip+ekIjefZch0Y+PvJ8CDYtEs1ipDmPorQ+" crossorigin="anonymous">
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
                              <a class="nav-link" href="index.jsp">Home</a>
                              <a class="nav-link" href="new.jsp">Add Contact</a>
                          </nav>
                      </div>
                  </div>
                  <div class="inner cover">
                      <h2 class="cover-heading">Edit Contact</h2>
                      <table class="table">
                          <form action="EditContact" method="post">
                            <input type="hidden" name="id" value="<% out.print(resultSet.getObject(1)); %>">
                            <tbody>
                                <tr>
                                    <td>Nama</td>
                                    <td><input type="text" class="form-control" name="nama" required value="<% out.print(resultSet.getObject(2)); %>"></td>
                                    <td>Provinsi</td>
                                    <td><input type="text" class="form-control" name="provinsi" required value="<% out.print(resultSet.getObject(7)); %>"></td>
                                </tr>
                                <tr>
                                    <td>Telepon</td>
                                    <td><input type="text" class="form-control" name="telepon" required value="<% out.print(resultSet.getObject(3)); %>"></td>
                                    <td>Kode Pos</td>
                                    <td><input type="text" class="form-control" name="kode_pos" required value="<% out.print(resultSet.getObject(8)); %>"></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><input type="email" class="form-control" name="email" required value="<% out.print(resultSet.getObject(4)); %>"></td>
                                    <td>Negara</td>
                                    <td><input type="text" class="form-control" name="negara" required value="<% out.print(resultSet.getObject(9)); %>"></td>
                                </tr>
                                <tr>
                                    <td>Alamat</td>
                                    <td><input type="text" class="form-control" name="alamat" required value="<% out.print(resultSet.getObject(5)); %>"></td>
                                    <td>
                                        <select class="form-control" name="jenis_medsos_1">
                                            <option>Media Social 1</option>
                                            <option>Facebook</option>
                                            <option>Twitter</option>
                                        </select>
                                    </td>
                                    <td><input type="text" class="form-control" name="nama_medsos_1" value="<% if(resultSet.getObject(10) != null) out.print(resultSet.getObject(10));%>"></td>
                                </tr>
                                <tr>
                                    <td>Kota</td>
                                    <td><input type="text" class="form-control" name="kota" required value="<% out.print(resultSet.getObject(6)); %>"></td>
                                    <td>
                                        <select class="form-control" name="jenis_medsos_2">
                                            <option>Media Social 2</option>
                                            <option>Facebook</option>
                                            <option>Twitter</option>
                                        </select>
                                    </td>
                                    <td><input type="text" class="form-control" name="nama_medsos_2" value="<% if(resultSet.getObject(12) != null) out.print(resultSet.getObject(12));%>"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><button type="submit" class="btn btn-primary">Submit</button></td>
                                </tr>
                            </tbody>
                          </form>
                      </table>
                  </div>
              </div>
          </div>
      </div>
      <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    </body>
</html>