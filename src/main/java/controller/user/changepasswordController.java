/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import DAL.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.user;

/**
 *
 * @author Asus
 */
public class changepasswordController extends HttpServlet {

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
        String user_id = request.getParameter("user_id");
        String old_passwordInput = request.getParameter("old_passwordInput");
        String new_password = request.getParameter("new_password");
        String re_new_password = request.getParameter("re_new_password");

        UserDAO dao = new UserDAO();
        user user = dao.getUser(Integer.parseInt(user_id));
        String old_password = user.getPassword();
        if (old_password.equals(old_passwordInput)) {
            if (new_password.equals(re_new_password)) {
                dao.changePassword(Integer.parseInt(user_id), new_password);
                String errorMessage = "Cập nhật thành công!";
                request.getSession().setAttribute("errorMessage", errorMessage);
                response.sendRedirect("user_detail");
            } else {
                String errorMessage = "Mật khẩu nhập lại không khớp!";
                request.getSession().setAttribute("errorMessage", errorMessage);
                response.sendRedirect("user_detail");
            }
        } else {
            String errorMessage = "Sai mật khẩu cũ";
            request.getSession().setAttribute("errorMessage", errorMessage);
            response.sendRedirect("user_detail");
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
