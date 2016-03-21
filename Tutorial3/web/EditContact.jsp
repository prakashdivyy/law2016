<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="userinfo" class="Tutorial3.User"></jsp:useBean>
<jsp:setProperty property="*" name="userinfo"/>
<%! 
    private String checkNull(String text) {
        if(text.equals("")){
            return null;
        }
        else{
            return text;
        }
    }
    
    private String checkMedsos(String text) {
        if(text.equals("Media Social 1") || text.equals("Media Social 2")){
            return null;
        }
        else{
            return text;
        }
    }
%>
<% 
    String userName = "law2016";
    String password = "zH4E6Dxdw5cuJ7ex";
    String url = "jdbc:mysql://localhost/law2016";
        
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, userName, password);
        String id = checkNull(userinfo.getId());
        String nama = checkNull(userinfo.getNama());
        String telepon = checkNull(userinfo.getTelepon());
        String email = checkNull(userinfo.getEmail());
        String alamat = checkNull(userinfo.getAlamat());
        String kota = checkNull(userinfo.getKota());
        String provinsi = checkNull(userinfo.getProvinsi());
        String kode_pos = checkNull(userinfo.getKode_pos());
        String negara = checkNull(userinfo.getNegara());
        String jenis_medsos_1 = checkMedsos(userinfo.getJenis_medsos_1());
        String nama_medsos_1 = null;
        if(jenis_medsos_1 != null){
            nama_medsos_1 = checkNull(userinfo.getNama_medsos_1());
        }
        String jenis_medsos_2 = checkMedsos(userinfo.getJenis_medsos_2());
        String nama_medsos_2 = null;
        if(jenis_medsos_2 != null){
            nama_medsos_2 = checkNull(userinfo.getNama_medsos_2());
        }
        String query = "UPDATE tutorial_2 SET nama = ?, telepon = ?, email = ?, alamat = ?, kota = ?, provinsi = ?, kode_pos = ?, negara = ?, jenis_medsos_1 = ?, nama_medsos_1 = ?, jenis_medsos_2 = ?, nama_medsos_2 = ? WHERE id = ?";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, nama);
        ps.setString(2, telepon);
        ps.setString(3, email);
        ps.setString(4, alamat);
        ps.setString(5, kota);
        ps.setString(6, provinsi);
        ps.setString(7, kode_pos);
        ps.setString(8, negara);
        ps.setString(9, jenis_medsos_1);
        ps.setString(10, nama_medsos_1);
        ps.setString(11, jenis_medsos_2);
        ps.setString(12, nama_medsos_2);
        ps.setString(13, id);
        ps.executeUpdate();
        ps.close();
        response.sendRedirect("index.jsp");
    } finally {
    }
%>