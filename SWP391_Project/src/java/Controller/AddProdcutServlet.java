/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Product;
import Entity.User;
import Entity.Wallet;
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

/**
 *
 * @author tudo7
 */
@WebServlet(name = "AddProdcutServlet", urlPatterns = {"/addProduct"})
public class AddProdcutServlet extends HttpServlet {

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
            out.println("<title>Servlet AddProdcutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProdcutServlet at " + request.getContextPath() + "</h1>");
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
        // processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        Product product = new Product();
        product.setName(request.getParameter("nameProduct"));
        try {
              product.setPrice(Double.parseDouble(request.getParameter("priceProduct")));
        product.setCategoryID(Integer.parseInt(request.getParameter("categoryID")));
        product.setDescription(request.getParameter("Description"));
        product.setImage1(request.getParameter("image1"));
        product.setImage2(request.getParameter("image2"));
        product.setImage3(request.getParameter("image3"));
        product.setImage4(request.getParameter("image4"));
        if (request.getParameter("Transaction_fee").equals("seller")) {
            product.setTransaction_fee(true);
        } else {
            product.setTransaction_fee(false);
        }
        product.setContact_Method(request.getParameter("Contact_Method"));
        product.setHidden_content(request.getParameter("hidden_content"));
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        product.setCreate_by(u.getId());
        DAO dal = new DAO();
        Wallet walet =  dal.getWallet(u.getId());
        if(walet.getBalance() > 500){
            walet.setBalance(walet.getBalance()-500);
        dal.insertProduct(product);
        intermediateOrders order = new intermediateOrders();
        order.setCode("SP00" + dal.getIdProduct());
        order.setProductId(dal.getIdProduct());
        if (product.isTransaction_fee() == true) {
            order.setTotal_paid_amount(product.getPrice());
            order.setTotal_received_amount((product.getPrice() * 95) / 100);

        } else {
            order.setTotal_paid_amount(product.getPrice() * 105 / 100);
            order.setTotal_received_amount(product.getPrice());
        }
        order.setIntermediary_fee(product.getPrice() * 5 / 100);
        order.setStatus("Ready");
        order.setCreate_by(u.getId());
        order.setUpdate_by(u.getId());
        dal.insertOrder(order);
        dal.updateAmount(walet.getBalance(), u.getId());
        session.setAttribute("balance", dal.getWallet(u.getId()).getBalance());
        response.getWriter().write("success");
        }else{
            response.getWriter().write("Insufficient_balance");
        }
        } catch (NumberFormatException e) {
            response.getWriter().write("price");
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

}
