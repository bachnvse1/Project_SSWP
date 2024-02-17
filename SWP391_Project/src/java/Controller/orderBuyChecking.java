/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Product;
import Entity.ProductOrderPair;
import Entity.User;
import Entity.intermediateOrders;
import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class orderBuyChecking extends HttpServlet {

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
            out.println("<title>Servlet orderBuyChecking</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet orderBuyChecking at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        List<intermediateOrders> listOrderBuy = dao.getOrderBuy(u.getId());
        List<ProductOrderPair> productOrderPairs = new ArrayList<>();
        for (intermediateOrders o : listOrderBuy) {
            Product product = dao.getProductByID(o.getProductId());
            productOrderPairs.add(new ProductOrderPair(product, o));

        }
        String s = "";
        for (ProductOrderPair o : productOrderPairs) {
            if (o.getOrder().getStatus().equals("Checking")) {
                if (o.getProduct().isTransaction_fee() == true) {
                    s = "Seller";
                } else {
                    s = "Buyer";
                }
                out.print("\n"
                        + "<tr class=\"cell-1\">\n"
                        + "                                                    <td>" + o.getOrder().getCode() + "</td>\n"
                        + "                                                    <td>" + o.getOrder().getStatus() + "</td>\n"
                        + "                                                    <td>" + dao.getUserById(o.getProduct().getCreate_by()).getDisplay_name() + "</td>\n"
                        + "                                                    <td>" + dao.getCategoryById(o.getProduct().getCategoryID()).getName() + "</td>\n"
                        + "                                                    <td>" + o.getProduct().getContact_Method() + "</td>\n"
                        + "                                                    <td>" + o.getProduct().price + " VND" + "</td>\n"
                        + "                                                    <td>" + o.getOrder().getIntermediary_fee() + " VND" + "</td>\n"
                        + "                                                    <td><span class=\"badge badge-success\">" + s + "</span></td>\n"
                        + "                                                    <td>" + o.getOrder().getTotal_paid_amount() + " VND" + "</td>\n"
                        + "                                                    <td>\n"
                        + "  <div class=\"buttonContainer\">\n"
                        + "    <a class=\"reportButton\" href=\"report?id=" + o.getOrder().getId() + "\">\n"
                        + "      <i class=\"fa fa-exclamation\"></i>\n"
                        + "    </a>\n"
                        + "    <a class=\"reportButton\"  href=\"verifyOrder?id=" + o.getOrder().getId() + "\">\n"
                        + "  <i class=\"fa fa-check\"></i>\n"
                        + "</a>\n"
                        + "  </div>\n"
                        + "</td>\n"
                        + " </tr>");
            }
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
