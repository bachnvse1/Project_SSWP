/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Validate.validate;
import Entity.User;
import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "VerifyUser", urlPatterns = {"/VerifyUser"})
public class VerifyUser extends HttpServlet {

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

    }

    public int GenOTP() {
        int min = 10_000; // Số nguyên tối thiểu (bao gồm)
        int max = 99_999; // Số nguyên tối đa (bao gồm)
        Random random = new Random();
        int randomNumber = random.nextInt(max - min + 1) + min;

        return randomNumber;
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
        //processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        validate validate = new validate();
        // Lấy dữ liệu từ request
        DAO dao = new DAO();
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String email = request.getParameter("email");
        try {
            if (validate.checkInput(username, "^[^@,!#$%&*]*$", 5, 20)
                && validate.checkInput(email, "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", 0, 50)
                && validate.checkInput(password, "^(?=.*[!@#$%^&*(),.?\":{}|<>]).*$", 6, 15) 
                && dao.getUsername(username) == null
                && dao.getEmail(email) == null) {
                int code = GenOTP();
                SendEmail sm = new SendEmail();
                sm.Send(email, code);
                HttpSession session = request.getSession();
                session.setAttribute("otp", code);
                session.setAttribute("user", username);
                session.setAttribute("pass", password);
                session.setAttribute("email", email);
                response.getWriter().write("success");
            } else {
                response.getWriter().write("error");
            }

        } catch (Exception e) {
            System.out.println("Error");
        }
    }

    // Phương thức kiểm tra đăng nhập đơn giản, bạn có thể thay thế bằng logic phức tạp hơn
    

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
