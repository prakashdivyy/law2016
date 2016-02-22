<%-- 
    Document   : aplikasi
    Created on : Feb 23, 2016, 12:28:37 AM
    Author     : prakash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aplikasi</title>
    </head>
    <body>
        <h1>Odd or Even</h1>
        <form action="aplikasi.jsp" method="post">
            <input type="text" name="angka">
            <input type="submit" value="Submit">
        </form>
        <% if(request.getParameter("angka") != null){
            try{
                int num = Integer.parseInt(request.getParameter("angka"));
                if(num % 2  == 0){ %>
            <h1><% out.print(num); %> is Even</h1>
        <% } else { %>
            <h1><% out.print(num); %> is Odd</h1>
        <% } } catch(NumberFormatException ex){ %>
            <h1>Input is not number.</h1>
        <% } } %>
    </body>
</html>
