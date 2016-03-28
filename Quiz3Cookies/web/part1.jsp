<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Cookie cookie = null;
Cookie[] cookies = null;
cookies = request.getCookies();
if ((request.getParameter("nama") != null) && (request.getParameter("npm") != null)){
  Cookie auth = new Cookie(request.getParameter("npm"), request.getParameter("nama"));
  response.addCookie(auth);
}
if ((request.getParameter("pert3") != null) && (request.getParameter("pert4") != null)){
  int count = 0;
  if( cookies != null ){
    for (int i = 0; i < cookies.length; i++){
      cookie = cookies[i];
      if((cookie.getName()).equals("medsos")){
        cookie.setValue(request.getParameter("pert3"));
        count++;
        response.addCookie(cookie);
      }
      if((cookie.getName()).equals("medsosAlasan")){
        cookie.setValue(request.getParameter("pert4"));
        count++;
        response.addCookie(cookie);
      }
    }
  } if(count == 0){
    Cookie pert3 = new Cookie("medsos", request.getParameter("pert3"));
    Cookie pert4 = new Cookie("medsosAlasan", request.getParameter("pert4"));
    response.addCookie(pert3);
    response.addCookie(pert4);
  }
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
    <%
    String messenger = "";
    String messengerAlasan = "";
    if(cookies != null){
      for (int i = 0; i < cookies.length; i++){
        cookie = cookies[i];
        if((cookie.getName()).equals("messenger")){
          messenger = cookie.getValue();
        }
        if((cookie.getName()).equals("messengerAlasan")){
          messengerAlasan = cookie.getValue();
        }
      }
    }
    %>
    <div class="container">
      <div class="row">
        <div class="col s10 offset-s1">
          <div class="card">
            <form action="part2.jsp" method="post">
              <div class="card-content">
                <span class="card-title center-align"><h3>Pertanyaan 1 & 2</h3></span>
                <% if (messenger.equals("") && messengerAlasan.equals("")){ %>
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
                      if (messenger.equals("WhatsApp")){
                        out.print("<option value='WhatsApp' selected>WhatsApp</option>");
                      } else {
                        out.print("<option value='WhatsApp'>WhatsApp</option>");
                      } 
                      if (messenger.equals("Line")){
                        out.print("<option value='Line' selected>Line</option>");
                      } else {
                        out.print("<option value='Line'>Line</option>");
                      } 
                      if (messenger.equals("Telegram")){
                        out.print("<option value='Telegram' selected>Telegram</option>");
                      } else {
                        out.print("<option value='Telegram'>Telegram</option>");
                      }
                      if (messenger.equals("KakaoTalk")){
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
                    <input id="pert2" type="text" class="validate" name="pert2" required value="<% out.print(messengerAlasan); %>">
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
