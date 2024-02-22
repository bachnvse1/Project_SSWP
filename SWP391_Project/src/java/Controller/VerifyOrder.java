/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.User;
import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "VerifyOrder", urlPatterns = {"/verifyOrder"})
public class VerifyOrder extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerifyOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyOrder at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String xid = request.getParameter("id").trim();
        String xproid = request.getParameter("pro_id").trim();
        int proid = Integer.parseInt(xproid);
        int id = Integer.parseInt(xid);
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        DAO dao = new DAO();
        
        double balanceSeller = dao.getWallet(dao.getOrderByID(id).getCreate_by()).getBalance();
        double moneyRecive = dao.getOrderByProductID(proid).getTotal_received_amount();
        dao.updateAmount(balanceSeller + moneyRecive, dao.getOrderByID(id).getCreate_by());
        dao.updateAmount(dao.getWallet(1).getBalance() - moneyRecive, 1);
        
        dao.updateOrder(u.getId(), "Complete", u.getId(), proid);
        dao.insertReport(4, id, true, "You have completed your purchase with order code is: " + dao.getOrderByID(id).getCode(), u.getId(), false);
        
        response.getWriter().write("success");

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
