<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
if ((request.getParameter("done") != null)){
  session.invalidate();
}
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home Page</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css" media="screen,projection">
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col s10 offset-s1">
          <div class="card">
            <form action="part1.jsp" method="post">
              <div class="card-content">
                <span class="card-title center-align"><h3>Quiz 3 - Session</h3><h6>M Prakash Divy I - 1306409513</h6></span>
                <div class="row">
                  <div class="input-field col s8 offset-s2">
                    <input id="npm" type="text" class="validate" name="npm" required>
                    <label for="npm">NPM</label>
                  </div>
                  <div class="input-field col s8 offset-s2">
                    <input id="nama" type="text" class="validate" name="nama" required>
                    <label for="nama">Nama</label>
                  </div>
                </div>
              </div>
              <div class="card-action right-align grey lighten-3">
                <button class="btn-large waves-effect waves-default blue accent-4" type="submit" name="action">Submit</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
  </body>
</html>