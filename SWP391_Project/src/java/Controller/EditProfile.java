/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

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

/**
 *
 * @author acer
 */
@WebServlet(name = "EditProfile", urlPatterns = {"/EditProfile"})
public class EditProfile extends HttpServlet {

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
            out.println("<title>Servlet EditProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfile at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("editprofile.jsp").forward(request, response);
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
        Integer id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        // String password = request.getParameter("password"); 
        String displayName = request.getParameter("display");
        String email = request.getParameter("email");
        //   Integer isAdmin =  Integer.parseInt(request.getParameter("Admin"));

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        
        if (username == null || username.trim().isEmpty()) {
            request.setAttribute("errorMsg1", "Username is required.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("editprofile.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Validate Password
//    if (password == null || password.trim().isEmpty()) {
//        request.setAttribute("errorMsg2", "Password is required.");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("editprofile.jsp");
//        dispatcher.forward(request, response);
//        return;
//    }
        //Validate Display Name
        if (displayName == null || displayName.trim().isEmpty()) {
            request.setAttribute("errorMsg3", "Display Name is required.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("editprofile.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Validate Email
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("errorMsg4", "Invalid or empty email address.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("editprofile.jsp");
            dispatcher.forward(request, response);
            return;
        }

        DAO d = new DAO();
        
        d.updateProfile(id, username, email, displayName);
            String mess = "Edit profile success";
            u.setDisplay_name(displayName);
            u.setEmail(email);
            request.setAttribute("done", mess);
            request.getRequestDispatcher("editprofile.jsp").forward(request, response);
          
    }

    private boolean isValidEmail(String email) {
        // Implement your email validation logic here
        // For a simple example, you can use a regular expression
        // Replace this with a more robust email validation if needed
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        return email.matches(emailRegex);
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
