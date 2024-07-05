/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.ListIterator;
import model.order_Details;
import model.orders;

/**
 *
 * @author Asus
 */
public class decreaseQuantityController extends HttpServlet {

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
        String product_id = request.getParameter("product_id");
        decrease(request, response, product_id);
    }

    private void decrease(HttpServletRequest request, HttpServletResponse response, String product_id)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        orders order = (orders) session.getAttribute("cart");
        List<order_Details> list_items = order.getList();
        for (int i = 0; i < list_items.size(); i++) {
            if (list_items.get(i).getProduct().getProduct_id() == Integer.parseInt(product_id)) {
                if (list_items.get(i).getAmount() < 2) {
                    deleteWhen0Quantity(request, response, product_id);
                    break;
                } else if (list_items.get(i).getAmount() >= 2) {
                    list_items.get(i).setAmount(list_items.get(i).getAmount() - 1);
                }
                session.setAttribute("cart", order);
                count(request, response);
                response.sendRedirect("cart");
            }
        }
    }

    public void count(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int total = 0;
        HttpSession session = request.getSession();
        orders order = (orders) session.getAttribute("cart");
        List<order_Details> list_items = order.getList();

        for (order_Details item : list_items) {
            total += item.getAmount() * item.getPrice();
        }
        order.setTotal_money(total);
    }

    public void deleteWhen0Quantity(HttpServletRequest request, HttpServletResponse response, String product_id)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        orders order = (orders) session.getAttribute("cart");
        ListIterator<order_Details> litr = order.getList().listIterator();
        while (litr.hasNext()) {
            order_Details item = litr.next();
            if (item.getProduct().getProduct_id() == Integer.parseInt(product_id)) {
                litr.remove();
            }
        }
        orders new_order = new orders();
        new_order.setList(order.getList());
        session.setAttribute("cart", new_order);
        count(request, response);
        response.sendRedirect("cart");
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
