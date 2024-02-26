/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Category;
import Entity.Product;
import Entity.User;
import dao.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class homeServ extends HttpServlet {

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
            out.println("<title>Servlet Searchproduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Searchproduct at " + request.getContextPath() + "</h1>");
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
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        if (u != null) {
            session.setAttribute("balance", dao.getWallet(u.getId()).getBalance());
        }

        List<Category> listCategory = dao.getAllCategory();
        List<Product> listProduct;
        String pageStr = request.getParameter("page");
        String categoryId = request.getParameter("categoryId");
        String searchQuery = request.getParameter("searchproductname");
        int pageSize = 8, page = 1, totalCount, pageCount;

        // Default response content type
        response.setContentType("text/html;charset=UTF-8");

        try {
            if (pageStr != null && !pageStr.isEmpty()) {
                page = Integer.parseInt(pageStr);
            }

            // Fetch products based on categoryId or search query
            if (categoryId != null && !categoryId.equals("all")) {
                listProduct = dao.getProductbyCategoryID(categoryId);
            } else if (searchQuery != null && !searchQuery.isEmpty()) {
                listProduct = dao.getAllProductbyName(searchQuery);
            } else {
                listProduct = dao.getAllProduct();
            }

            // Pagination calculations
            totalCount = listProduct.size();
            pageCount = (int) Math.ceil((double) totalCount / pageSize);
            int start = (page - 1) * pageSize;
            int end = Math.min(start + pageSize, totalCount);
            List<Product> listProductPage = listProduct.subList(start, end);

            // Set attributes for the JSP page
            // Check if the request is from AJAX
            boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
            if (isAjax) {
                response.setContentType("application/html");

                PrintWriter out = response.getWriter();
                // Dynamically generate the product listing for AJAX response
                for (Product p : listProductPage) {
                    out.print("  <div class=\"col-md-3\">\n" +
"                                            <!-- product -->\n" +
"\n" +
"                                            <div class=\"product\">\n" +
"                                                <div class=\"product-img\">\n" +
"                                                    <img src=\""+p.image1+"\" alt=\"\" style=\"height: 150px;\">\n" +
"\n" +
"                                                </div>\n" +
"                                                <div class=\"product-body\">\n" +
"\n" +
"                                                    <p class=\"product-category\">Category</p>\n" +
"                                                    <h3 class=\"product-name\"><a href=\"ProductDetail?id="+p.id+"\">"+p.name+"</a></h3>\n" +
"                                                    <h4 class=\"product-price\">"+p.price+"<del\n" +
"                                                            class=\"product-old-price\">$990.00</del></h4>\n" +
"                                                    <div class=\"product-btns\">\n" +
"                                                        <button class=\"add-to-wishlist\"><i class=\"fa fa-heart-o\"></i><span\n" +
"                                                                class=\"tooltipp\">add to wishlist</span></button>\n" +
"                                                        <button class=\"add-to-compare\"><i class=\"fa fa-exchange\"></i><span\n" +
"                                                                class=\"tooltipp\">add to compare</span></button>\n" +
"                                                        <button class=\"quick-view\"><i class=\"fa fa-eye\"></i><span\n" +
"                                                                class=\"tooltipp\">quick view</span></button>\n" +
"                                                    </div>\n" +
"                                                </div>\n" +
"                                                <div class=\"add-to-cart\">\n" +
"                                                    <!-- Thêm một ID động cho nút \"Thêm vào giỏ hàng\" -->\n" +
"                                                    <button class=\"add-to-cart-btn\" id=\"buyButton_${loop.index}\" data-target=\"cookiesPopup_${loop.index}\">\n" +
"                                                        <i class=\"fa fa-shopping-cart\"></i>BUY\n" +
"                                                    </button>\n" +
"                                                    <!-- Thêm nút \"Buy\" -->\n" +
"                                                    <button class=\"add-to-cart-btn\" onclick=\"addToCart("+p.id+")\">\n" +
"                                                        <i class=\"fa fa-shopping-cart\"></i>CART\n" +
"                                                    </button>\n" +
"                                                </div>\n" +
"                                            </div>\n" +
"                                            <div class=\"container-2\">\n" +
"                                                <div class=\"cookiesContent\" id=\"cookiesPopup_${loop.index}\">\n" +
"                                                    <button class=\"close\">✖</button>\n" +
"                                                    <img src=\"https://dichthuatmientrung.com.vn/wp-content/uploads/2022/06/important-sticky-note.jpg\" alt=\"cookies-img\" style=\"width: 50%;\"/>\n" +
"                                                    <p style=\"color:red; margin-top: 5%;\">We will hold your intermediary funds and wait until you confirm the transaction is completely successful</p>\n" +
"                                                    <button class=\"button-buy\" data-id=\""+p.id+"\">BUY</button>\n" +
"                                                </div>\n" +
"                                            </div>               \n" +
"                                            <!-- /product -->\n" +
"                                        </div>");
                }

            } else {
                request.setAttribute("listCategory", listCategory);
                request.setAttribute("listProductPage", listProductPage);
                request.setAttribute("Count", pageCount);
                request.setAttribute("Page", page);
                // For normal requests, forward to the JSP page
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace(); // For simplicity, just print the stack trace. Consider logging and more user-friendly error handling.
            // Optionally, redirect to an error page or display an error message directly.
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
