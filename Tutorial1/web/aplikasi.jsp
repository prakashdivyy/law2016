<%-- 
    Document   : aplikasi
    Created on : Feb 23, 2016, 12:28:37 AM
    Author     : prakash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Aplikasi</title>
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
                              <a class="nav-link" href="cv.jsp">CV</a>
                              <a class="nav-link active" href="aplikasi.jsp">Aplikasi</a>
                          </nav>
                      </div>
                  </div>
                  <div class="inner cover">
                      <h1 class="cover-heading">Odd or Even</h1>
                      <div class="myform">
                          <form action="aplikasi.jsp" method="post">
                              <div class="input-group">
                                  <input type="text" class="form-control" placeholder="Input an Integer" name="angka">
                                  <span class="input-group-btn">
                                      <button class="btn btn-secondary" type="submit">Submit</button>
                                  </span>
                              </div>
                          </form>
                      </div>
                      <% if(request.getParameter("angka") != null){ try{ int num = Integer.parseInt(request.getParameter("angka")); if(num % 2  == 0){ %>
                      <p class="lead"><% out.print(num); %> is Even</p>
                      <% } else { %>
                      <p class="lead"><% out.print(num); %> is Odd</p>
                      <% } } catch(NumberFormatException ex){ %>
                      <p class="lead">Not an Integer</p>
                      <% } } %>
                  </div>
              </div>
          </div>
      </div>
      <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
  </body>
</html>
