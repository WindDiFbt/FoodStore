/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.web;

import DAL.UserDAO;
import model.user;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
public class loginController extends HttpServlet {

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
        Cookie ar[] = request.getCookies();
        for (Cookie o : ar) {
            if (o.getName().equals("accCookie")) {
                request.setAttribute("account_name", o.getValue());
            }
            if (o.getName().equals("passCookie")) {
                request.setAttribute("password", o.getValue());
            }
            if (o.getName().equals("rem")) {
                request.setAttribute("remember", o.getValue());
            }
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String account_name = request.getParameter("account_name");
        String password = request.getParameter("password");
        String rem = request.getParameter("remember");

        UserDAO dao = new UserDAO();
        user u = dao.login(account_name, password);
        if (u == null) {
            request.setAttribute("errorMessage", "Sai mật khẩu hoặc tài khoản!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (u.getRoleNo() == 1 || u.getDeleted() == 1) {
                request.setAttribute("errorMessage", "Sai mật khẩu hoặc tài khoản!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (u.getRoleNo() == 0) {
                if (rem != null && rem.equals("1")) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", u);
                    session.setMaxInactiveInterval(60 * 60 * 24);

                    Cookie accCookie = new Cookie("accCookie", account_name);
                    Cookie passCookie = new Cookie("passCookie", password);
                    Cookie remC = new Cookie("rem", rem);

                    accCookie.setMaxAge(60 * 5);
                    passCookie.setMaxAge(60 * 5);
                    remC.setMaxAge(60 * 5);

                    response.addCookie(accCookie);
                    response.addCookie(passCookie);
                    response.addCookie(remC);
                } else {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", u);
                    session.setMaxInactiveInterval(60 * 60 * 24);
                }
                response.sendRedirect("/assignment/home");
            }
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
