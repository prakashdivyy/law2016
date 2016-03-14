<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.persistence.*" %>
<%@page import="quiz2.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Quiz 2</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cover.min.css" >
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-XdYbMnZ/QjLh6iI4ogqCTaIjrFk87ip+ekIjefZch0Y+PvJ8CDYtEs1ipDmPorQ+" crossorigin="anonymous">
    </head>
    <%
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Quiz2PU");
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        Query q = em.createNamedQuery("User.findAll");
        Collection<User> dataUser = q.getResultList();
        em.close();
    %>
    <body>
        <div class="site-wrapper">
          <div class="site-wrapper-inner">
              <div class="cover-container">
                  <div class="masthead clearfix">
                      <div class="inner">
                          <h3 class="masthead-brand">Quiz 2</h3>
                          <nav class="nav nav-masthead">
                              <a class="nav-link active" href="index.jsp">Home</a>
                          </nav>
                      </div>
                  </div>
                  <div class="inner cover">
                      <h1 class="cover-heading">Quiz 2</h1>
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
                              <%for(User a: dataUser) {%>
                              <tr>
                                <td><a href="show.jsp?id=<% out.print(a.getId()); %>"><% out.print(a.getNama()); %></a></td>
                                <td><% out.print(a.getTelepon()); %></td>
                                <td><% out.print(a.getEmail()); %></td>
                                <td><a href="edit.jsp?id=<% out.print(a.getId()); %>"><i class="fa fa-pencil"></i></a> <a href="Delete?id=<% out.print(a.getId()); %>"><i class="fa fa-remove"></i></a></td>
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
</html>