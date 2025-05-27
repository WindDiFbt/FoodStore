/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAL.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import model.product;

/**
 *
 * @author Asus
 */
public class addProductAdmin extends HttpServlet {

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
        String category_id = request.getParameter("category_id");
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String weight = request.getParameter("weight");
        String price = request.getParameter("price");
        String discount = request.getParameter("discount");
        String ingredient = request.getParameter("ingredient");
        String user_manual = request.getParameter("user_manual");
        String more_info = request.getParameter("more_info");

        String img_path = "images/Food_img/" + image + ".jpg";
        product p = new product(Integer.parseInt(category_id), name, Integer.parseInt(discount), img_path, ingredient,
                user_manual, more_info, Timestamp.valueOf(LocalDateTime.now()), Timestamp.valueOf(LocalDateTime.now()),
                0, Integer.parseInt(price), Integer.parseInt(weight));
        ProductDAO dao = new ProductDAO();
        dao.insertProduct(p);
        response.sendRedirect("listProductAdmin");
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
