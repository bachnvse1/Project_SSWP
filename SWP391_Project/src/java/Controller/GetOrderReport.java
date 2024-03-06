/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Product;
import Entity.ProductOrderPair;
import Entity.intermediateOrders;
import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Nguyen Minh Khoa
 */
@WebServlet(name = "GetOrderReport", urlPatterns = {"/GetOrderReport"})
public class GetOrderReport extends HttpServlet {

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
            out.println("<title>Servlet GetOrderReport</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetOrderReport at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        String ido = request.getParameter("detailOrderId");
        int id = Integer.parseInt(ido);

        DAO dao = new DAO();
        intermediateOrders order = dao.getOrderByID(id);
        //int data = order.getProductId();
        //Product product = dao.getProductByID(order.getProductId());
        
        //ProductOrderPair productOrderPair = new ProductOrderPair(product, order);

        try (PrintWriter out = response.getWriter()) {
            out.println("<div class=\"modal-content3\">");
            //out.println("    <span class=\"close\">&times;</span>");
            out.println("<span class=\"close\" onclick=\"window.location.href='ReportServlet';\">&times;</span>");
            out.println("    <div class=\"container-complain\">");
            out.println("        <form id=\"detailOrderForm\">");
            out.println("            <h2 style=\"text-align: center;\">Detail Order Report</h2>");
            out.println("            <div class=\"form-row\">");
            out.println("                <label for=\"orderCode\">Order code:</label>");
            out.println("                <input type=\"text\" id=\"orderCode\" value=\"\" readonly><br>");
            //out.println("<input type=\"text\" id=\"productName\" value=\"" + order.getStatus() + "\" readonly><br>");
            out.println("            </div>");
// ... (similar lines for other elements)
            out.println("            <div class=\"form-row\">");
            out.println("                <label for=\"productName\">Product Name:</label>");
            out.println("                <input type=\"text\" id=\"productName\" value=\"\" readonly><br>");
            out.println("            </div>");

            out.println("            <div class=\"form-row\">");
            out.println("                <label for=\"price\">Price:</label>");
            out.println("                <input type=\"text\" id=\"price\" value=\"\" readonly><br>");
            out.println("            </div>");
            out.println("            <label for=\"productImage\">Product Image:</label>");
            out.println("            <img style=\"max-width: 150px; max-height: 150px\" id=\"img1\" src=\"\">");
            out.println("            <img style=\"max-width: 150px; max-height: 150px\" id=\"img2\" src=\"\">");
            out.println("            <img style=\"max-width: 150px; max-height: 150px\" id=\"img3\" src=\"\">");
            out.println("            <img style=\"max-width: 150px; max-height: 150px\" id=\"img4\" src=\"\"><br>");
            out.println("            <div class=\"form-row\">");
            out.println("                <label for=\"description\">Description:</label>");
            out.println("                <input id=\"description\" value=\"\" readonly></input><br>");
            out.println("            </div>");
// ... (continue with the rest of the code)
            out.println("            <div class=\"form-row\">");
            out.println("                <label for=\"hiddenContent\">Hidden Content:</label>");
            out.println("                <input type=\"text\" id=\"hiddenContent\" value=\"\"  readonly><br>");
            out.println("            </div>");

            out.println("            <div class=\"form-row\">");
            out.println("                <label for=\"partyBuyer\">Buyer:</label>");
            out.println("                <input type=\"text\" id=\"partyBuyer\" name=\"party\" value=\"\" readonly><br>");
            out.println("            </div>");

            out.println("            <div class=\"form-row\">");
            out.println("                <label for=\"partySeller\">Seller:</label>");
            out.println("                <input type=\"text\" id=\"partySeller\" name=\"party\" value=\"\" readonly><br>");
            out.println("            </div>");

            out.println("            <div class=\"form-row\">");
            out.println("                <label for=\"contactMethod\">Contact Method:</label><br>");
            out.println("                <input type=\"text\" id=\"contactMethod\" value=\"\"  readonly><br>");
            out.println("            </div>");
            out.println("        </form>");
            out.println("    </div>");
            out.println("</div>");

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
