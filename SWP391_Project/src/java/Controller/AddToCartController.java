/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Cart;
import Entity.Product;
import Entity.User;
import dao.DAO;
import jakarta.servlet.RequestDispatcher;
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
import org.apache.catalina.connector.Response;

/**
 *
 * @author Nguyen Minh Khoa
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

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
            out.println("<title>Servlet AddToCartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartController at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String deleteProductId = request.getParameter("deleteProductId");
        if (deleteProductId != null && !deleteProductId.isEmpty()) {
            int deleteId = Integer.parseInt(deleteProductId);
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null) {
                List<Product> listProduct = cart.getProduct();
                // Xóa sản phẩm có id tương ứng
                listProduct.removeIf(product -> product.getId() == deleteId);
                cart.setProduct(listProduct);
                session.setAttribute("cart", cart);
            }
        }
        // In trực tiếp HTML chứa danh sách sản phẩm mới
        try (PrintWriter out = response.getWriter()) {
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null) {
                for (Product product : cart.getProduct()) {
                    out.println("<tr>");
                    out.println("<td>" + product.getId() + "</td>");
                    //out.println("<td><img src='/finalweb10/download?image=" + product.getImage1() + "' width='100' /></td>");
                    out.println("<td><img src='" + product.getImage1() + "' alt='' style='height: 50px;'/></td>");
                    out.println("<td>" + product.getName() + "</td>");
                    out.println("<td>" + product.getPrice() + "</td>");
                    out.println("<td><span class='delete-icon' onclick='deleteProduct(" + product.getId() + ")'>&#128465;</span></td>");
                    out.println("<td><a href='xxx' class='buy-button'>Buy</a></td>");
                    out.println("</tr>");
                }
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String productId = request.getParameter("productId");
        int id = Integer.parseInt(productId);
        DAO dao = new DAO();
        //Product product = dao.getProductById(id);
        User user = (User) session.getAttribute("user");
        if (user != null) {
            if (session.getAttribute("cart") == null) {
                Cart cart = new Cart();
                List<Product> listProduct = new ArrayList<>();
                Product product = dao.getProductById(id);
                listProduct.add(product);
                cart.setProduct(listProduct);
                session.setAttribute("cart", cart);
            } else {
                // Giỏ hàng đã tồn tại
                Cart cart = (Cart) session.getAttribute("cart");
                List<Product> listProduct = cart.getProduct();

                // Kiểm tra xem sản phẩm có "id" đã tồn tại trong giỏ hàng hay không
                boolean productExists = false;
                for (Product p : listProduct) {
                    if (p.getId() == id) {
                        productExists = true;
                        break;
                    }
                }

                // Nếu sản phẩm chưa tồn tại, thêm vào list
                if (!productExists) {
                    Product product = dao.getProductById(id);
                    listProduct.add(product);
                    cart.setProduct(listProduct);
                    session.setAttribute("cart", cart);
                }
            }
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
        } else {
            //
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
