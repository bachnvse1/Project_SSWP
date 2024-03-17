/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Report;
import Entity.User;
import dao.DAO;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "reportServ", urlPatterns = {"/report"})
public class reportServ extends HttpServlet {

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
            out.println("<title>Servlet reportServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet reportServ at " + request.getContextPath() + "</h1>");
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
        String xid = request.getParameter("id").trim();
        int id = Integer.parseInt(xid);
        String xindex = request.getParameter("datax").trim();
        int index = Integer.parseInt(xindex);
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        DAO dao = new DAO();

        if (index == 1) {
            if (dao.getOrderByID(id).getStatus().equals("Người mua đang kiểm tra đơn hàng")) {
                dao.insertReport(1, id, dao.getOrderByID(id).getBuyer_id(), false, "Có khiếu nại từ người mua rằng đơn hàng " + dao.getOrderByID(id).getCode() + " không đúng mô tả ", u.getId(), false);
                dao.updateOrderStatus(u.getId(), "Người mua khiếu nại đơn hàng", id);
                dao.insertOrderHistory(id, "Bên mua khiếu nại", "Người mua khiếu nại sản phẩm không đúng miêu tả", dao.getOrderByID(id).getBuyer_id());
                response.getWriter().print("Bạn vừa khiếu nại đơn hàng. Chờ giải quyết nhé!");
            } else {
                response.getWriter().print("Bạn đã khiếu nại hoặc xác thực đơn hàng rồi. Chờ giải quyết!");
            }
        } else if (index == 2) {
<<<<<<< HEAD
            if (dao.getOrderByID(id).getStatus().equals("Đơn hàng đã hoàn thành")) {
                response.getWriter().print("Đơn hàng đã hoàn thành rồi nhé!");
            } else {
                dao.insertReport(4, id, u.getId(), true, "Bạn đã hoàn tất mua đơn hàng với mã sản code: " + dao.getOrderByID(id).getCode(), u.getId(), false);
                dao.updateOrderStatus(u.getId(), "Đơn hàng đã hoàn thành", id);
                
                response.getWriter().print("Bạn đã xác thực đơn hàng thành công. Xin cảm ơn!");
            }
=======
            dao.insertReport(4, id, u.getId(), true, "Bạn đã hoàn tất mua đơn hàng với mã sản code: " + dao.getOrderByID(id).getCode(), u.getId(), false);
            dao.updateOrderStatus(u.getId(), "Đơn hàng đã hoàn thành", id);
            dao.insertOrderHistory(id, "Hoàn thành giao dịch", "Người mua xác nhận hoàn thành đơn hàng", dao.getOrderByID(id).getBuyer_id());
            response.getWriter().print("Bạn đã xác thực đơn hàng thành công. Xin cảm ơn!");
>>>>>>> origin/branch-khoaiter3

        } else {
            if (dao.getWallet(u.getId()).getBalance() > 10000) {
                if (!dao.getOrderByID(id).getStatus().equals("Yêu cầu admin giải quyết")) {
<<<<<<< HEAD
                    if (!dao.getOrderByID(id).getStatus().equals("Đơn hàng đã hoàn thành")) {
                        dao.insertReport(7, id, 1, false, "2 bên không tự giải quyết được yêu cầu admin tham gia giải quyết đơn hàng mã code: " + dao.getOrderByID(id).getCode(), u.getId(), false);
                        dao.updateOrderStatus(u.getId(), "Yêu cầu admin giải quyết", id);
                        
                        response.getWriter().print("Yêu cầu admin giải quyết thành công. Chờ giải quyết nhé!");
                    } else {
                        response.getWriter().print("Đơn hàng đã hoàn thành không thể khiếu nại");
                    }

=======
                    dao.insertReport(7, id, 1, false, "2 bên không tự giải quyết được yêu cầu admin tham gia giải quyết đơn hàng mã code: " + dao.getOrderByID(id).getCode(), u.getId(), false);
                    dao.updateOrderStatus(u.getId(), "Yêu cầu admin giải quyết", id);
                    dao.insertOrderHistory(id, "Chờ Admin giải quyết", "Giao dịch được khiếu nại và chờ Admin giải quyết", dao.getOrderByID(id).getBuyer_id());
                    response.getWriter().print("Yêu cầu admin giải quyết thành công. Chờ giải quyết nhé!");
>>>>>>> origin/branch-khoaiter3
                } else {
                    response.getWriter().print("Bạn đã yêu cầu admin giải quyết rồi. Cùng chờ nhé!");
                }

            } else {
                response.getWriter().print("Không đủ số dư để yêu cầu admin giải quyết đơn hàng! Hãy nạp thêm tiền tối thiếu 10.000đ nhé.");
            }
        }

        //1 là Người mua khiếu nại đơn hàng
        //2 là Người mua đang kiểm tra đơn hàng
        //3 là Sẵn sàng giao dịch
        //4 là Đơn hàng đã hoàn tất
        //5 là nạp tiền
        //6 là rút tiền
        //7 yêu cầu admin giải quyết
        //8
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
