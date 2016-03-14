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
 * @author m.prakash
 */
@WebServlet(name = "Delete", urlPatterns = {"/Delete"})
public class Delete extends HttpServlet {

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
           EntityManagerFactory emf = Persistence.createEntityManagerFactory("Quiz2PU");
           EntityManager em = emf.createEntityManager();
           EntityTransaction tx = em.getTransaction();
           tx.begin();
           User user = em.find(User.class, id);
           Query q = em.createNamedQuery("UserMediaSosial.findByUserId").setParameter("userId", id);
           Collection<UserMediaSosial> list = q.getResultList();
           for(UserMediaSosial x : list){
               int temp = x.getUserMediaSosialPK().getMediaSosialId();
               UserMediaSosial medsos = em.find(UserMediaSosial.class, new UserMediaSosialPK(id, temp));
               em.remove(medsos);
           }
           em.remove(user);
           Negara negara = em.find(Negara.class, id);
           em.remove(negara);
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
