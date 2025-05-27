/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import DAL.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.orders;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import model.order_Details;

/**
 *
 * @author Asus
 */
public class orderController extends HttpServlet {

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
        String fullname = request.getParameter("fullname");
        String phone_number = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String total_money = request.getParameter("total_money");
        String note = request.getParameter("note");

        orders order = new orders(Integer.parseInt(user_id), fullname, email, phone_number, address, note,
                Timestamp.valueOf(LocalDateTime.now()), 0, Integer.parseInt(total_money));

        OrderDAO dao = new OrderDAO();
        dao.insertOrder(order);

        HttpSession session = request.getSession();
        orders session_order = (orders) session.getAttribute("cart");
        List<order_Details> list_items = session_order.getList();
        for (order_Details item : list_items) {
            dao.insertOrderDetail(dao.getLastestOrderID(), item.getProduct().getProduct_id(), item.getPrice(), item.getAmount());
        }
        session.removeAttribute("cart");
        response.sendRedirect("listorder");
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
