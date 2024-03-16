/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.User;
import Entity.Wallet;
import Entity.Withdrawal;
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
 * @author tudo7
 */
@WebServlet(name = "WithdrawalServlet", urlPatterns = {"/withdrawal"})
public class WithdrawalServlet extends HttpServlet {

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
            out.println("<title>Servlet WithdrawalServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WithdrawalServlet at " + request.getContextPath() + "</h1>");
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
       // processRequest(request, response);
       DAO dao = new DAO();
       HttpSession session = request.getSession();
       User u = (User) session.getAttribute("user");
       List<Withdrawal> withdrawals = dao.getWitdrawalbyUser(u.getId());
        request.setAttribute("Listwithdrawal", withdrawals);
        for (Withdrawal withdrawal : withdrawals) {
            request.setAttribute("amountW", String.format("%,.0f",(double) withdrawal.getAmount()));
        }   
       
       
       request.getRequestDispatcher("withdrawal.jsp").forward(request, response);
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
        //  processRequest(request, response);
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        String amount = request.getParameter("amount");
        String accountNumber = request.getParameter("accountNumber");
        String accountHolder = request.getParameter("accountHolder");
        String bankName = request.getParameter("bankName");
        String bankBranch = request.getParameter("bankBranch");
        DAO dao = new DAO();
        try {                  
        Withdrawal withdrawal = new Withdrawal();
        Wallet walet = dao.getWallet(u.getId());
        withdrawal.setAmount(Double.parseDouble(amount));   
        if(withdrawal.getAmount()<100000){
            response.getWriter().write("less than 100000");
        }else if(accountNumber.equals("")||accountHolder.equals("")||bankName.equals("")){
            response.getWriter().write("blank");
        }else if(withdrawal.getAmount()>walet.getBalance()){
            response.getWriter().write("Insufficient balance");
        }else{
        walet.setBalance(walet.getBalance()-withdrawal.getAmount());
        withdrawal.setAccount_number(accountNumber);
        withdrawal.setAccount_holder(accountHolder);
        withdrawal.setBankname(bankName);
        withdrawal.setBankbranch(bankBranch);
        withdrawal.setCode("WDR2024000"+dao.getIdWithdrawal()+1);
        withdrawal.setStatus("Mới tạo");
        withdrawal.setCreated_by(u.getId());
        withdrawal.setUpdated_by(u.getId());
        withdrawal.setResponse("");
        dao.InsertWithdrawal(withdrawal);
        dao.updateAmount(walet.getBalance(), u.getId());
        session.removeAttribute("balance");
        session.setAttribute("balance", walet.getBalance());
        response.getWriter().write("success");      
        }
        }catch (IOException | NumberFormatException e) {
            response.getWriter().write("price"); 
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
