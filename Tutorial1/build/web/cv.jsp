<%-- 
    Document   : cv
    Created on : Feb 23, 2016, 12:28:15 AM
    Author     : prakash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>CV</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cover.min.css" >
  </head>
  <body>
      <div class="site-wrapper">
          <div class="site-wrapper-inner">
              <div class="cover-container">
                  <div class="masthead clearfix">
                      <div class="inner">
                          <h3 class="masthead-brand">Tutorial 1</h3>
                          <nav class="nav nav-masthead">
                              <a class="nav-link" href="index.jsp">Home</a>
                              <a class="nav-link active" href="cv.jsp">CV</a>
                              <a class="nav-link" href="aplikasi.jsp">Aplikasi</a>
                          </nav>
                      </div>
                  </div>
                  <div class="inner cover">
                      <img src="${pageContext.request.contextPath}/assets/img/foto.jpg" alt="YEAH" class="img-circle">
                      <h1>M Prakash Divy I</h1>
                      <p>prakashdivyy@gmail.com</p>
                      <p>Fakultas Ilmu Komputer Universitas Indonesia<br>SMA Kolese Kanisius Jakarta<br>SMP Kolese Kanisius Jakarta<br>SDNP Kompleks IKIP Jakarta</p>
                  </div>
              </div>
          </div>
      </div>
      <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
  </body>
</html>
