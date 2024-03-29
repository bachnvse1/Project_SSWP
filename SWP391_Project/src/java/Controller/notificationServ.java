/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Report;
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
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "notificationServ", urlPatterns = {"/notification"})
public class notificationServ extends HttpServlet {

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
            out.println("<title>Servlet notificationServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet notificationServ at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String amount = request.getParameter("exists");
        int iamount = Integer.parseInt(amount);
        User u = (User) session.getAttribute("user");
        List<Report> listReport = dao.getTopNext3Report(u.getId(), iamount);

        for (Report r : listReport) {
            if (r.getType_report() == 1) {
                out.println("<tr class=\"abc\">\n"
                        + "                                    <td class=\"failure notification\">\n"
                        + "                                        <h1><span class=\"icon\">&times;</span>Khiếu nại đơn hàng</h1>\n"
                        + "                                        <p class=\"small\">" + r.getDescription() + "</p>\n"
                       
                        + "                                    </td>\n"
                        + "                                </tr>");
            }
            if (r.getType_report() == 2) {
                out.println("<tr class=\"abc\">\n"
                        + "                                    <td class=\"warning notification\">\n"
                        + "                                        <h1><span class=\"icon\">&times;</span>Đang kiểm tra đơn hàng</h1>\n"
                        + "                                        <p class=\"small\">" + r.getDescription() + "</p>\n"
                       
                        + "                                    </td>\n"
                        + "                                </tr>");
            }
            if (r.getType_report() == 3) {
                out.println("<tr class=\"abc\">\n"
                        + "                                    <td class=\"healthy notification\">\n"
                        + "                                        <h1><span class=\"icon\">&times;</span>Sẵn sàng giao dịch</h1>\n"
                        + "                                        <p class=\"small\">" + r.getDescription() + "</p>\n"
                       
                        + "                                    </td>\n"
                        + "                                </tr>");
            }
            if (r.getType_report() == 4) {
                out.println("<tr class=\"abc\">\n"
                        + "                                    <td class=\"healthy notification\">\n"
                        + "                                        <h1><span class=\"icon\">&times;</span>Đơn hàng đã hoàn tất</h1>\n"
                        + "                                        <p class=\"small\">" + r.getDescription() + "</p>\n"

                        + "                                    </td>\n"
                        + "                                </tr>");
            }

            if (r.getType_report() == 5) {
                out.println("<tr class=\"abc\">\n"
                        + "                                    <td class=\"warning notification\">\n"
                        + "                                        <h1><span class=\"icon\">&times;</span>Thông báo nạp tiền</h1>\n"
                        + "                                        <p class=\"small\">" + r.getDescription() + "</p>\n"
                       
                        + "                                    </td>\n"
                        + "                                </tr>");
            }
            if (r.getType_report() == 6) {
                out.println("<tr class=\"abc\">\n"
                        + "                                    <td class=\"warning notification\">\n"
                        + "                                        <h1><span class=\"icon\">&times;</span>Thông báo rút tiền tiền</h1>\n"
                        + "                                        <p class=\"small\">" + r.getDescription() + "</p>\n"
                       
                        + "                                    </td>\n"
                        + "                                </tr>");
            }
            
            if (r.getType_report() == 7) {
                out.println("<tr class=\"abc\">\n"
                        + "                                    <td class=\"information notification\">\n"
                        + "                                        <h1><span class=\"icon\">&times;</span>Yêu cầu admin giải quyết</h1>\n"
                        + "                                        <p class=\"small\">" + r.getDescription() + "</p>\n"
                       
                        + "                                    </td>\n"
                        + "                                </tr>");
            }
            if (r.getType_report() == 8) {
                out.println("<tr class=\"abc\">\n"
                        + "                                    <td class=\"warning notification\">\n"
                        + "                                        <h1><span class=\"icon\">&times;</span>Người bán huỷ đơn</h1>\n"
                        + "                                        <p class=\"small\">" + r.getDescription() + "</p>\n"
                       
                        + "                                    </td>\n"
                        + "                                </tr>");
            }
            if (r.getType_report() == 9) {
                out.println("<tr class=\"abc\">\n"
                        + "                                    <td class=\"warning notification\">\n"
                        + "                                        <h1><span class=\"icon\">&times;</span>Chờ người mua xác nhận</h1>\n"
                        + "                                        <p class=\"small\">" + r.getDescription() + "</p>\n"
                       
                        + "                                    </td>\n"
                        + "                                </tr>");
            }
            if (r.getType_report() == 10) {
                out.println("<tr class=\"abc\">\n"
                        + "                                    <td class=\"healthy notification\">\n"
                        + "                                        <h1><span class=\"icon\">&times;</span>Hoàn tiền từ admin</h1>\n"
                        + "                                        <p class=\"small\">" + r.getDescription() + "</p>\n"
                       
                        + "                                    </td>\n"
                        + "                                </tr>");
            }
            out.println("<tr><!-- Thêm dòng trống trước button Load More -->\n"
                    + "                                        <td style=\"height: 20px;\"></td>\n"
                    + "                                    </tr>");
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
        //processRequest(request, response);

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
