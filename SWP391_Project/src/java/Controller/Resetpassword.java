/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.User;
import Validate.validate;
import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author My pc
 */
@WebServlet(name = "Resetpassword", urlPatterns = {"/reset"})
public class Resetpassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet forgotEmail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet forgotEmail at " + request.getContextPath() + "</h1>");
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
        String msg = "";
        HttpSession session = request.getSession();

        try {
            String otp = request.getParameter("otp");
            int otp_1 = Integer.parseInt(otp);

            int code = (int) session.getAttribute("code");

            if (otp_1 == code) {
                // Remove the session attribute
                session.removeAttribute("code");

                // Set attributes for successful OTP verification
                request.setAttribute("flag", 3);
                request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
            } else {
                throw new NumberFormatException();
            }
        } catch (NumberFormatException e) {
            // Handle NumberFormatException by setting error message
            msg = "OTP not same";
            request.setAttribute("msg", msg);
            request.setAttribute("flag", 2);
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
        } finally {
            // This block will be executed regardless of whether an exception is thrown or not.

            // Check if the email is not provided and display a message:
            String email = request.getParameter("email"); // Assuming "email" is the parameter name
            if (email == null || email.isEmpty()) {
                msg = "Please input email!";
                request.setAttribute("msg", msg);
                request.setAttribute("flag", 2);
                request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
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

        String msg = "";
        String error = "";
        validate val = new validate();
        String userEnteredCaptcha = request.getParameter("capchaRespone");
        String sessionCaptcha = (String) request.getSession().getAttribute("captcha");
        HttpSession session = request.getSession();
          String pas = request.getParameter("password");
            String cpass = request.getParameter("cpassword");
        if (userEnteredCaptcha != null && userEnteredCaptcha.equalsIgnoreCase(sessionCaptcha)) {
          
            // CAPTCHA is correct
            // Proceed with the rest of form processing
            if (val.checkInput(pas, "^(?=.*[!@#$%^&*(),.?\\\":{}|<>]).*$", 6, 16)
                    && val.checkInput(cpass, "^(?=.*[!@#$%^&*(),.?\\\":{}|<>]).*$", 6, 16)) {
                if (pas.equals(cpass)) {

                    String Email = (String) session.getAttribute("email1");
                    DAO dao = new DAO();
                    User user = dao.isEmail(Email);
                    dao.updatePassword(pas, user.id);
                    msg += "Reset password Success";
                    request.setAttribute("msg", msg);
                    session.removeAttribute("email1");
                    request.getRequestDispatcher("signin.jsp").forward(request, response);

                } else {
                    error += "Password not same";
                    request.setAttribute("error", error); // Change from msg to error here
                    request.setAttribute("flag", 3);
                    request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
                }

            } else {
                error += "The length of Password should be 6-16 characters and 1 charater special!";
                request.setAttribute("error", error);
                request.setAttribute("flag", 3);
                request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("password", pas);
             request.setAttribute("password", cpass);

            request.setAttribute("error", "Invalid CAPTCHA. Please try again.");
            request.setAttribute("flag", 3);
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
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
