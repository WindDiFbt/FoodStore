/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import DAL.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.order_Details;
import model.orders;
import model.product;

/**
 *
 * @author Asus
 */
public class updateQuantityController extends HttpServlet {

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
        if (request.getParameter("quantity") == null) {
            cart(request, response, product_id, "1");
        } else {
            cart(request, response, product_id, request.getParameter("quantity"));
        }
    }

    private void cart(HttpServletRequest request, HttpServletResponse response, String product_id, String amount)
            throws ServletException, IOException {
        ProductDAO pdao = new ProductDAO();
        product product = pdao.getProductByID(product_id);

        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            orders order = new orders();
            List<order_Details> list_items = new ArrayList<>();
            order_Details item = new order_Details();
            item.setProduct(product);
            item.setAmount(Integer.parseInt(amount));
            if (product.getDiscount() != 0) {
                item.setPrice(product.getPrice() - (product.getPrice() * product.getDiscount()) / 100);
            } else {
                item.setPrice(product.getPrice());
            }
            list_items.add(item);
            order.setList(list_items);
            session.setAttribute("cart", order);
        } else {
            orders order = (orders) session.getAttribute("cart");
            List<order_Details> list_items = order.getList();
            boolean check = false;
            for (order_Details item : list_items) {
                if (item.getProduct().getProduct_id() == Integer.parseInt(product_id)) {
                    item.setAmount(Integer.parseInt(amount));
                    check = true;
                }
            }

            if (check == false) {
                order_Details item = new order_Details();
                item.setProduct(product);
                item.setAmount(Integer.parseInt(amount));
                if (product.getDiscount() != 0) {
                    item.setPrice(product.getPrice() - (product.getPrice() * product.getDiscount()) / 100);
                } else {
                    item.setPrice(product.getPrice());
                }
                list_items.add(item);
            }
            session.setAttribute("cart", order);
        }
        count(request, response);
        response.sendRedirect("cart");

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
        session.setAttribute("cart", order);
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
