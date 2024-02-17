/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Category;
import Entity.Product;
import dao.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
        List<Product> listProduct = null;
        List<Product> listProductPage = null;
        List<Category> listCategory = dao.getAllCategory();
        String page = request.getParameter("page");
        int pageSize = 8;
        int Count = 0;

        if (page == null) {
            page = "1";
        }

        String pramCategoryId = request.getParameter("categoryId");
        String search = request.getParameter("searchproductname");
        if (pramCategoryId != null && !pramCategoryId.equals("all")) {
            listProduct = dao.getProductbyCategoryID(pramCategoryId);
        } else if (search != null && !search.isEmpty()) {
            listProduct = dao.getAllProductbyName(search);
        } else {
            listProduct = dao.getAllProduct();
        }
        int start = (Integer.parseInt(page) - 1) * pageSize;
        int end = Math.min(start + pageSize, listProduct.size());

        if ((listProduct.size() % pageSize) == 0) {
            Count = listProduct.size() / pageSize;
        } else {
            Count = listProduct.size() / pageSize + 1;
        }
        listProductPage = listProduct.subList(start, end);
        request.setAttribute("Count", Count);
        request.setAttribute("page", page);   
        request.setAttribute("listProductPage", listProductPage);
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
