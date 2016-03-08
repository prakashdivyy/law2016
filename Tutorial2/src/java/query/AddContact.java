/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package query;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author prakash
 */
@WebServlet(name = "AddContact", urlPatterns = {"/AddContact"})
public class AddContact extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        String userName = "law2016";
        String password = "zH4E6Dxdw5cuJ7ex";
        String url = "jdbc:mysql://localhost/law2016";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, userName, password);
            String nama = checkNull(request.getParameter("nama"));
            String telepon = checkNull(request.getParameter("telepon"));
            String email = checkNull(request.getParameter("email"));
            String alamat = checkNull(request.getParameter("alamat"));
            String kota = checkNull(request.getParameter("kota"));
            String provinsi = checkNull(request.getParameter("provinsi"));
            String kode_pos = checkNull(request.getParameter("kode_pos"));
            String negara = checkNull(request.getParameter("negara"));
            String jenis_medsos_1 = checkMedsos(request.getParameter("jenis_medsos_1"));
            String nama_medsos_1 = null;
            if(jenis_medsos_1 != null){
                nama_medsos_1 = checkNull(request.getParameter("nama_medsos_1"));
            }
            String jenis_medsos_2 = checkMedsos(request.getParameter("jenis_medsos_2"));
            String nama_medsos_2 = null;
            if(jenis_medsos_2 != null){
                nama_medsos_2 = checkNull(request.getParameter("nama_medsos_2"));
            }
            String query = "INSERT INTO tutorial_2(nama,telepon,email,alamat,kota,provinsi,kode_pos,negara,jenis_medsos_1,nama_medsos_1,jenis_medsos_2,nama_medsos_2) values(?,?,?,?,?,?,?,?,?,?,?,?)";
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
            ps.executeUpdate();
            ps.close();
            response.sendRedirect("index.jsp");
        } finally {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddContact.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddContact.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddContact.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddContact.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

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

}
