<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Add New Contact</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cover.min.css" >
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-XdYbMnZ/QjLh6iI4ogqCTaIjrFk87ip+ekIjefZch0Y+PvJ8CDYtEs1ipDmPorQ+" crossorigin="anonymous">
    </head>
    <body>
        <div class="site-wrapper">
          <div class="site-wrapper-inner">
              <div class="cover-container">
                  <div class="masthead clearfix">
                      <div class="inner">
                          <h3 class="masthead-brand">Tutorial 3</h3>
                          <nav class="nav nav-masthead">
                              <a class="nav-link" href="index.jsp">Home</a>
                              <a class="nav-link active" href="new.jsp">Add Contact</a>
                          </nav>
                      </div>
                  </div>
                  <div class="inner cover">
                      <h2 class="cover-heading">Add New Contact</h2>
                      <table class="table">
                          <form action="AddContact.jsp" method="post">
                            <tbody>
                                <tr>
                                    <td>Nama</td>
                                    <td><input type="text" class="form-control" name="nama" required></td>
                                    <td>Provinsi</td>
                                    <td><input type="text" class="form-control" name="provinsi" required></td>
                                </tr>
                                <tr>
                                    <td>Telepon</td>
                                    <td><input type="text" class="form-control" name="telepon" required></td>
                                    <td>Kode Pos</td>
                                    <td><input type="text" class="form-control" name="kode_pos" required></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><input type="email" class="form-control" name="email" required></td>
                                    <td>Negara</td>
                                    <td><input type="text" class="form-control" name="negara" required></td>
                                </tr>
                                <tr>
                                    <td>Alamat</td>
                                    <td><input type="text" class="form-control" name="alamat" required></td>
                                    <td>
                                        <select class="form-control" name="jenis_medsos_1">
                                            <option>Media Social 1</option>
                                            <option>Facebook</option>
                                            <option>Twitter</option>
                                        </select>
                                    </td>
                                    <td><input type="text" class="form-control" name="nama_medsos_1"></td>
                                </tr>
                                <tr>
                                    <td>Kota</td>
                                    <td><input type="text" class="form-control" name="kota" required></td>
                                    <td>
                                        <select class="form-control" name="jenis_medsos_2">
                                            <option>Media Social 2</option>
                                            <option>Facebook</option>
                                            <option>Twitter</option>
                                        </select>
                                    </td>
                                    <td><input type="text" class="form-control" name="nama_medsos_2"></td>
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