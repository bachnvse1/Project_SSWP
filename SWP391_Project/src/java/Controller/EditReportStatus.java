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

/**
 *
 * @author Nguyen Minh Khoa
 */
@WebServlet(name = "EditReportStatus", urlPatterns = {"/EditReportStatus"})
public class EditReportStatus extends HttpServlet {

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
        String valuer = request.getParameter("selectedValue");
        
        // Phân tích giá trị để truy xuất các dữ liệu "code1", "c2", "c3"
        String[] value = valuer.split(",");
        String reportID = value[0]; 
        String userIDr = value[1]; // Dữ liệu "code1"
        String tmoneyr = value[2]; // Dữ liệu "c2"
        String checkuserX = value[3]; // Dữ liệu "c3"

        int checkuser = Integer.parseInt(checkuserX);

        int userID = Integer.parseInt(userIDr);

        double tmoney = Double.parseDouble(tmoneyr);
        int id = Integer.parseInt(reportID);
        DAO dao = new DAO();
        int oid = dao.getReportByID(id).getOrderID();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        
        if (checkuser == 1) {
            dao.updateAmount(tmoney + dao.getWallet(userID).getBalance(), userID);
            dao.insertReport(10, oid, userID, true, "Hoàn tiền từ admin số tiền là:" + tmoney, u.getId(), true);
        } else {
            dao.updateAmount(tmoney + dao.getWallet(userID).getBalance(), userID);
            dao.insertReport(10, oid, userID, true, "Hoàn tiền từ admin số tiền là:" + tmoney, u.getId(), true);
        }
        dao.editReportStatus(id, true);
        response.getWriter().write("Report.jsp");
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

