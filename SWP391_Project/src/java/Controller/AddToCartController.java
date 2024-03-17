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
                int index = 0; // Khai báo một biến đếm hoặc index
                for (Product product : cart.getProduct()) {
                    if (!product.is_delete) {
                        out.print("<tr>\n"
                                + "                                <td>" + product.getId() + "</td>\n"
                                + "                                <td><img src=\"" + product.getImage1() + "\" alt=\"\" style=\"height: 50px;\"/></td>\n"
                                + "                                <td>" + product.getName() + "</td>\n"
                                + "                                <td>" + product.getPrice() + "</td>\n"
                                + "                                <td><span class=\"delete-icon\" onclick=\"deleteProduct(" + product.getId() + ")\">&#128465;</span></td>\n"
                                + "                                <td><button class=\"add-to-cart-btn\"  data-target=\"cookiesPopup_" + index + "\">\n"
                                + "                                        <i class=\"fa fa-shopping-cart\"></i>BUY\n"
                                + "                                    </button></td>\n"
                                + "                            </tr>\n"
                                + "                        <div class=\"container-2\">\n"
                                + "                            <div class=\"cookiesContent\" id=\"cookiesPopup_" + index + "\">\n"
                                + "                                <button class=\"close\">✖</button>\n"
                                + "                                <img src=\"https://dichthuatmientrung.com.vn/wp-content/uploads/2022/06/important-sticky-note.jpg\" alt=\"cookies-img\" style=\"width: 50%;\"/>\n"
                                + "                                <p style=\"color:red; margin-top: 5%;\">We will hold your intermediary funds and wait until you confirm the transaction is completely successful</p>\n"
                                + "                                <button class=\"button-buy\" data-id=\"" + product.getId() + "\">BUY</button>\n"
                                + "                            </div>\n"
                                + "                        </div>   ");
                        index++;
                    }

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
