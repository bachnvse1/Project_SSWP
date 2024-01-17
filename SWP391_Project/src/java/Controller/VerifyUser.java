/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
        String user = request.getParameter("user");
        String password = request.getParameter("pass");
        String email = request.getParameter("email");
        PrintWriter out = response.getWriter();
        DAO dao = new DAO();
        int code = GenOTP();
        SendEmail sm = new SendEmail();
        sm.Send(email, code);

        HttpSession session = request.getSession();
        session.setAttribute("otp", code);
        session.setAttribute("user", user);
        session.setAttribute("pass", password);
        session.setAttribute("email", email);
        response.sendRedirect("verify.jsp");

    }

    public int GenOTP() {
        int min = 10_000; // Số nguyên tối thiểu (bao gồm)
        int max = 99_999; // Số nguyên tối đa (bao gồm)
        Random random = new Random();
        int randomNumber = random.nextInt(max - min + 1) + min;

        return randomNumber;
    }

    public String checkString(String input, String msg, int min, int max, String regex) {

        // Tạo Pattern từ regex
        Pattern pattern = Pattern.compile(regex);
        // Tạo Matcher
        Matcher matcher = pattern.matcher(input);
        if (matcher.matches() && input.length() >= min && input.length() < max) {
            return input;
        }
        return msg;
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

        // Lấy dữ liệu từ request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        // Xử lý dữ liệu nếu cần
        // Ví dụ: kiểm tra đăng nhập
        boolean isAuthenticated = checkInput(username, password, email);
        String mess = "";
        // Gửi kết quả về client
        PrintWriter out = response.getWriter();
        if (isAuthenticated) {
            DAO dao = new DAO();
            int code = GenOTP();
            SendEmail sm = new SendEmail();
            sm.Send(email, code);

            HttpSession session = request.getSession();
            session.setAttribute("otp", code);
            session.setAttribute("user", username);
            session.setAttribute("pass", password);
            session.setAttribute("email", email);
            response.sendRedirect("verify.jsp");
        } else {
            mess += "Fail to sign in";
            out.print("<h2>Create your Account</h2>\n" +
"                <label>\n" +
"                    <span>User</span>\n" +
"                    <input type=\"text\" id=\"username\" name=\"user\" required=\"\"/>\n" +
"                </label>\n" +
"                <label>\n" +
"                    <span>Password</span>\n" +
"                    <input type=\"password\" id=\"password\" name=\"pass\" required=\"\"/>\n" +
"                </label>\n" +
"                <label>\n" +
"                    <span>Email</span>\n" +
"                    <input type=\"text\" id=\"email\" name=\"email\" required=\"\"/>\n" +
"                </label>\n" +
"                    <button type=\"submit\" class=\"submit\">Sign Up</button>\n" +
"                  <label>\n" +
"                      <span style=\"color:red;\">"+mess+"</span>\n" +
"                </label>");
        }
    }

    // Phương thức kiểm tra đăng nhập đơn giản, bạn có thể thay thế bằng logic phức tạp hơn
    private boolean checkInput(String username, String password, String email) {
        // Logic kiểm tra đăng nhập
        // Đây chỉ là ví dụ đơn giản, bạn cần thay thế với logic thực tế
        if (username.length() >= 5) {
            return true;
        }
        return false;

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
