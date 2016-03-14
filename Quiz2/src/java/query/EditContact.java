/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package query;

import javax.persistence.*;
import quiz2.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Prakash Divy
 */
@WebServlet(name = "EditContact", urlPatterns = {"/EditContact"})
public class EditContact extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String nama = request.getParameter("nama");
            int telepon = Integer.parseInt(request.getParameter("telepon"));
            String email = request.getParameter("email");
            String alamat = request.getParameter("alamat");
            String kota = request.getParameter("kota");
            String provinsi = request.getParameter("provinsi");
            String kode_pos = request.getParameter("kode_pos");
            String negara = request.getParameter("negara");
            int [] jenis_medsos = new int [2]; 
            jenis_medsos[0] = Integer.parseInt(request.getParameter("jenis_medsos_1"));
            jenis_medsos[1] = Integer.parseInt(request.getParameter("jenis_medsos_2"));
            String [] nama_medsos = new String [2];
            nama_medsos[0] = request.getParameter("nama_medsos_1");
            nama_medsos[1] = request.getParameter("nama_medsos_2");
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("Quiz2PU");
            EntityManager em = emf.createEntityManager();
            EntityTransaction tx = em.getTransaction();
            User user = em.find(User.class, id);
            user.setNama(nama);
            user.setTelepon(telepon);
            user.setEmail(email);
            user.setAlamat(alamat);
            user.setKota(kota);
            user.setProvinsi(provinsi);
            user.setKodepos(kode_pos);
            Negara mynegara = em.find(Negara.class, user.getNegara());
            if(!(mynegara.getNama().equals(negara))){
                Negara baru = new Negara(0, negara);
                tx.begin();
                em.persist(baru);
                tx.commit();
                Query q = em.createNamedQuery("Negara.findByNama").setParameter("nama", negara);
                Collection<Negara> list = q.getResultList();
                for(Negara x : list){
                    user.setNegara(x.getId());
                }
            }
            Query q = em.createNamedQuery("UserMediaSosial.findByUserId").setParameter("userId", id);
            Collection<UserMediaSosial> list = q.getResultList();
            for(UserMediaSosial x : list){
                int temp = x.getUserMediaSosialPK().getMediaSosialId();
                UserMediaSosial medsos = em.find(UserMediaSosial.class, new UserMediaSosialPK(id, temp));
                tx.begin();
                em.remove(medsos);
                tx.commit();
            }
            UserMediaSosialPK userpk1 = new UserMediaSosialPK(id, jenis_medsos[0]);
            UserMediaSosial usermedsos1 = new UserMediaSosial(userpk1, nama_medsos[0]);
            UserMediaSosialPK userpk2 = new UserMediaSosialPK(id, jenis_medsos[1]);
            UserMediaSosial usermedsos2 = new UserMediaSosial(userpk2, nama_medsos[1]);
            tx.begin();
            em.persist(usermedsos1);
            em.persist(usermedsos2);
            tx.commit();
            em.close();
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
        processRequest(request, response);
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
        processRequest(request, response);
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

}
