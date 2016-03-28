<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
if ((request.getParameter("nama") != null) && (request.getParameter("npm") != null)){
  session.setAttribute(request.getParameter("npm"), request.getParameter("nama"));
}
if ((request.getParameter("pert3") != null) && (request.getParameter("pert4") != null)){
  session.setAttribute("medsos", request.getParameter("pert3"));
  session.setAttribute("medsosAlasan", request.getParameter("pert4"));
}
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Page 1</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css" media="screen,projection">
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col s10 offset-s1">
          <div class="card">
            <form action="part2.jsp" method="post">
              <div class="card-content">
                <span class="card-title center-align"><h3>Pertanyaan 1 & 2</h3></span>
                <% if ((session.getAttribute("messenger") == null) &&  (session.getAttribute("messengerAlasan") == null)){ %>
                <div class="row">
                  <div class="input-field col s8 offset-s2">
                    <select name="pert1">
                      <option value="" disabled selected>Pilih Messenger</option>
                      <option value="WhatsApp">WhatsApp</option>
                      <option value="Line">Line</option>
                      <option value="Telegram">Telegram</option>
                      <option value="KakaoTalk">KakaoTalk</option>
                    </select>
                    <label>Messenger apa yang paling sering kamu gunakan?</label>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="input-field col s8 offset-s2">
                    <input id="pert2" type="text" class="validate" name="pert2" required>
                    <label for="pert2">Apa alasan anda memilih messenger tersebut?</label>
                  </div>
                </div>
                <% } else { %>
                <div class="row">
                  <div class="input-field col s8 offset-s2">
                    <select name="pert1">
                      <option value="" disabled>Pilih Messenger</option>
                      <% 
                      if ((session.getAttribute("messenger")).equals("WhatsApp")){
                        out.print("<option value='WhatsApp' selected>WhatsApp</option>");
                      } else {
                        out.print("<option value='WhatsApp'>WhatsApp</option>");
                      } 
                      if ((session.getAttribute("messenger")).equals("Line")){
                        out.print("<option value='Line' selected>Line</option>");
                      } else {
                        out.print("<option value='Line'>Line</option>");
                      } 
                      if ((session.getAttribute("messenger")).equals("Telegram")){
                        out.print("<option value='Telegram' selected>Telegram</option>");
                      } else {
                        out.print("<option value='Telegram'>Telegram</option>");
                      }
                      if ((session.getAttribute("messenger")).equals("KakaoTalk")){
                        out.print("<option value='KakaoTalk' selected>KakaoTalk</option>");
                      } else {
                        out.print("<option value='KakaoTalk'>KakaoTalk</option>");
                      } 
                      %>
                    </select>
                    <label>Messenger apa yang paling sering kamu gunakan?</label>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="input-field col s8 offset-s2">
                    <input id="pert2" type="text" class="validate" name="pert2" required value="<%= session.getAttribute("messengerAlasan") %>">
                    <label for="pert2">Apa alasan anda memilih messenger tersebut?</label>
                  </div>
                </div>
                <% } %>
              </div>
              <div class="card-action right-align grey lighten-3">
                <button class="btn-large waves-effect waves-default blue accent-4" type="submit" name="action">Next</button>
              </div>
            </form>
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
