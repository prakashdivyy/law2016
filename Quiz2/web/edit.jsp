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
        <title>Edit Contact</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cover.min.css" >
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-XdYbMnZ/QjLh6iI4ogqCTaIjrFk87ip+ekIjefZch0Y+PvJ8CDYtEs1ipDmPorQ+" crossorigin="anonymous">
    </head>
    <%
        int myid = Integer.parseInt(request.getParameter("id"));
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Quiz2PU");
        EntityManager em = emf.createEntityManager();
        User dataUser = em.find(User.class, myid);
        Negara dataNegara = em.find(Negara.class, dataUser.getNegara());
        int id = dataUser.getId();
        String nama = dataUser.getNama();
        int telepon = dataUser.getTelepon();
        String email = dataUser.getEmail();
        String alamat = dataUser.getAlamat();
        String kota = dataUser.getKota();
        String provinsi = dataUser.getProvinsi();
        String kode_pos = dataUser.getKodepos();
        String negara = dataNegara.getNama();
        String [] medsos = new String [2];
        int [] medsos_sel = new int [2];
        Query q = em.createNamedQuery("UserMediaSosial.findByUserId").setParameter("userId", id);
        Collection<UserMediaSosial> list = q.getResultList();
        int num = 0;
        for(UserMediaSosial x : list){
            medsos[num] = x.getNama();
            medsos_sel[num] = x.getUserMediaSosialPK().getMediaSosialId();
            num++;
        }
        q = em.createNamedQuery("MediaSosial.findAll");
        Collection<MediaSosial> listMedsos = q.getResultList();
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
                              <a class="nav-link" href="index.jsp">Home</a>
                          </nav>
                      </div>
                  </div>
                  <div class="inner cover">
                      <h2 class="cover-heading">Edit Contact</h2>
                      <table class="table">
                          <form action="EditContact" method="post">
                            <input type="hidden" name="id" value="<% out.print(id); %>">
                            <tbody>
                                <tr>
                                    <td>Nama</td>
                                    <td><input type="text" class="form-control" name="nama" required value="<% out.print(nama); %>"></td>
                                    <td>Provinsi</td>
                                    <td><input type="text" class="form-control" name="provinsi" required value="<% out.print(provinsi); %>"></td>
                                </tr>
                                <tr>
                                    <td>Telepon</td>
                                    <td><input type="text" class="form-control" name="telepon" required value="<% out.print(telepon); %>"></td>
                                    <td>Kode Pos</td>
                                    <td><input type="text" class="form-control" name="kode_pos" required value="<% out.print(kode_pos); %>"></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><input type="email" class="form-control" name="email" required value="<% out.print(email); %>"></td>
                                    <td>Negara</td>
                                    <td><input type="text" class="form-control" name="negara" required value="<% out.print(negara); %>"></td>
                                </tr>
                                <tr>
                                    <td>Alamat</td>
                                    <td><input type="text" class="form-control" name="alamat" required value="<% out.print(alamat); %>"></td>
                                    <td>
                                        <select class="form-control" name="jenis_medsos_1">
                                            <%for(MediaSosial a: listMedsos) {%>
                                             <option value="<% out.print(a.getId()); %>"<% if(medsos_sel[0] == a.getId()) { %>selected<% } %>><% out.print(a.getNama()); %></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input type="text" class="form-control" name="nama_medsos_1" value="<% out.print(medsos[0]);%>"></td>
                                </tr>
                                <tr>
                                    <td>Kota</td>
                                    <td><input type="text" class="form-control" name="kota" required value="<% out.print(kota); %>"></td>
                                    <td>
                                        <select class="form-control" name="jenis_medsos_2">
                                            <%for(MediaSosial a: listMedsos) {%>
                                             <option value="<% out.print(a.getId());%>"<% if(medsos_sel[1] == a.getId()) { %>selected<% } %>><% out.print(a.getNama()); %></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input type="text" class="form-control" name="nama_medsos_2" value="<% out.print(medsos[1]);%>"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><button type="submit" class="btn btn-primary">Submit</button></td>
                                </tr>
                            </tbody>
                          </form>
                      </table>
                  </div>
              </div>
          </div>
      </div>
      <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    </body>
</html>