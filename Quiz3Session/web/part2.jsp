<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
if ((request.getParameter("pert1") != null) && (request.getParameter("pert2") != null)){
  session.setAttribute("messenger", request.getParameter("pert1"));
  session.setAttribute("messengerAlasan", request.getParameter("pert2"));
}
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Page 2</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css" media="screen,projection">
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col s10 offset-s1">
          <div class="card">
            <div class="card-content">
              <span class="card-title center-align"><h3>Pertanyaan 3 & 4</h3></span>
              <form action="part1.jsp" method="post">
                <% if ((session.getAttribute("medsos") == null) &&  (session.getAttribute("medsosAlasan") == null)){ %>
                <div class="row">
                  <div class="input-field col s8 offset-s2">
                    <select name="pert3">
                      <option value="" disabled selected>Pilih Medsos</option>
                      <option value="Facebook">Facebook</option>
                      <option value="Twitter">Twitter</option>
                      <option value="Instagram">Instagram</option>
                      <option value="Path">Path</option>
                    </select>
                    <label>Media sosial apa yang paling sering kamu gunakan?</label>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="input-field col s8 offset-s2">
                    <input id="pert4" type="text" class="validate" name="pert4" required>
                    <label for="pert4">Apa alasan anda memilih media sosial tersebut?</label>
                  </div>
                </div>
                <% } else { %>
                <div class="row">
                  <div class="input-field col s8 offset-s2">
                    <select name="pert3">
                      <option value="" disabled>Pilih Medsos</option>
                      <% 
                      if ((session.getAttribute("medsos")).equals("Facebook")){
                        out.print("<option value='Facebook' selected>Facebook</option>");
                      } else {
                        out.print("<option value='Facebook'>Facebook</option>");
                      } 
                      if ((session.getAttribute("medsos")).equals("Twiter")){
                        out.print("<option value='Twitter' selected>Twitter</option>");
                      } else {
                        out.print("<option value='Twitter'>Twitter</option>");
                      } 
                      if ((session.getAttribute("medsos")).equals("Instagram")){
                        out.print("<option value='Instagram' selected>Instagram</option>");
                      } else {
                        out.print("<option value='Instagram'>Instagram</option>");
                      } 
                      if ((session.getAttribute("medsos")).equals("Path")){
                        out.print("<option value='Path' selected>Path</option>");
                      } else {
                        out.print("<option value='Path'>Path</option>");
                      }
                      %>
                    </select>
                    <label>Media sosial apa yang paling sering kamu gunakan?</label>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="input-field col s8 offset-s2">
                    <input id="pert4" type="text" class="validate" name="pert4" required value="<%= session.getAttribute("medsosAlasan") %>">
                    <label for="pert4">Apa alasan anda memilih media sosial tersebut?</label>
                  </div>
                </div>
                <% } %>
                <div class="row">
                  <div class="input-field col s8 offset-s2 center-align">
                    <button class="btn-large waves-effect waves-default deep-orange accent-3" type="submit" name="action">Back</button>
                  </div>
                </div>
              </form>
              <div class="row">
                <div class="input-field col s8 offset-s2 center-align">
                  <form action="index.jsp" method="post">
                    <input type="hidden" name="done" value="1">
                    <button class="btn-large waves-effect waves-default blue accent-4" type="submit" name="action">Submit</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
    <script>
      $(document).ready(function() {
        $('select').material_select();
      });
    </script>
  </body>
</html>
