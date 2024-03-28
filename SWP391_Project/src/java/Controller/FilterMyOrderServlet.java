/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Entity.Category;
import Entity.Product;
import Entity.ProductOrderPair;
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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tudo7
 */
@WebServlet(name="FilterMyOrderServlet", urlPatterns={"/filtermyorder"})
public class FilterMyOrderServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet FilterMyOrderServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterMyOrderServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
     //   processRequest(request, response);
          String name = request.getParameter("search_name");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
       DAO dao = new DAO();
         List<Category> category = dao.getAllCategory();
             List<ProductOrderPair> productOrderPairs = new ArrayList<>();
       if(name != null){
      List<Product> products = dao.getProductByName(name, u.getId());
       for (Product product : products) {
            intermediateOrders order = dao.getOrderByProductID(product.getId());
            productOrderPairs.add(new ProductOrderPair(product, order));
        }
       }else{
            List<Product> listProduct = dao.getProductByUserID(u.getId());
   
            for (Product product : listProduct) {
            intermediateOrders order = dao.getOrderByProductID(product.getId());
            productOrderPairs.add(new ProductOrderPair(product, order));
        }
       }
        request.setAttribute("category", category);
        request.setAttribute("productOrderPairs", productOrderPairs);
        request.getRequestDispatcher("MyOrder.jsp").forward(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}