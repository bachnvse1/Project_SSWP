/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Category;
import Entity.Product;
import Entity.User;
import Entity.intermediateOrders;
import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "buyServ", urlPatterns = {"/buy"})
public class buyServ extends HttpServlet {

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
            out.println("<title>Servlet buyServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet buyServ at " + request.getContextPath() + "</h1>");
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
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        String id = request.getParameter("id");
        int idx = Integer.parseInt(id);
        Product p = dao.getProductByID(idx);
        if(dao.getWallet(u.getId()).getBalance() < p.getPrice()) {
            response.getWriter().print("Your balance is not enough to purchase the product!");
            return;
        }
        if (p.getCreate_by() != u.getId()) {
            if (p.isIs_delete() == true) {
                response.getWriter().print("The product has been sold and is being traded!");
            } else {
                dao.updateOrder(u.id, "Checking", u.id, idx);
                dao.deleteProduct(idx, true);
                double balance = dao.getWallet(u.getId()).getBalance();
                double moneyBuy = dao.getOrderByProductID(idx).getTotal_paid_amount();
                dao.updateAmount(balance - moneyBuy, u.getId());
                dao.updateAmount(dao.getWallet(1).getBalance() + moneyBuy, 1);
                
                dao.insertReport(2, dao.getOrderByProductID(idx).getId(), true, "You have just purchased an order, the code is: " + dao.getOrderByProductID(idx).getCode() + " and checking this order please!", u.getId(), false);
                response.getWriter().print("You just buy product, please checking order!");
            }
        } else {
            response.getWriter().print("Can not buy product yourself!");
        }

//        if(p.isTransaction_fee() == true) {
//            order.setTotal_paid_amount(p.getPrice());
//        } 
//        order.setTotal_paid_amount(p.getPrice() + p.getPrice() * 0.05);
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
