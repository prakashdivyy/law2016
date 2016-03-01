<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Exponentiation</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cover.min.css" >
  </head>
  <body>
      <div class="site-wrapper">
          <div class="site-wrapper-inner">
              <div class="cover-container">
                  <div class="masthead clearfix">
                      <div class="inner">
                          <h3 class="masthead-brand">Quiz 1</h3>
                          <nav class="nav nav-masthead">
                              <a class="nav-link" href="index.jsp">Home</a>
                              <a class="nav-link active" href="exp.jsp">Exponentiation</a>
                              <a class="nav-link" href="mod.jsp">Modulo</a>
                          </nav>
                      </div>
                  </div>
                  <div class="inner cover">
                      <h1 class="cover-heading">Exponentiation</h1>
                      <div class="myform">
                          <form action="exp.jsp" method="post">
                              <div class="col-xs-4">
                                  <input type="text" class="form-control" placeholder="Input Number 1" name="angka1">
                              </div>
                              <div class="col-xs-4">
                                  <input type="text" class="form-control" placeholder="Input Number 2" name="angka2">
                              </div>
                              <div class="col-xs-4">
                                  <button class="btn btn-secondary" type="submit">Submit</button>
                              </div>
                          </form>
                      </div>
                      <% 
                      if ((request.getParameter("angka1") != null) && (request.getParameter("angka2") != null)) {
                          try {
                              wees.WEBSERVICEQUIZ service = new wees.WEBSERVICEQUIZ();
                              wees.WSQ1 port = service.getWSQ1Port();
                              int parameter1 = Integer.parseInt(request.getParameter("angka1"));
                              int parameter2 = Integer.parseInt(request.getParameter("angka2"));
                              java.lang.Double result = port.mystery4(parameter1, parameter2);
                    %>          <p class="lead"><%out.print(parameter1);%> dipangkatkan <%out.print(parameter2);%> hasilnya <% out.print(result); %></p>
                    <% 
                            } catch (NumberFormatException ex) {
                                  %><p class="lead">Input Not an Integer</p><%
                            }
                        }
                    %>
                  </div>
              </div>
          </div>
      </div>
      <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
  </body>
</html>
