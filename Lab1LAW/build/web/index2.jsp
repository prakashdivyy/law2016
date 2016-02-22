<%-- 
    Document   : index2
    Created on : Feb 22, 2016, 5:09:04 PM
    Author     : m.prakash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    </head>
    <body>
        <h1>Hello World!</h1>
        <% String tmp = request.getParameter("input"); %>
        <h2>Input : <% out.print(tmp); %></h2>
    </body>
</html>
