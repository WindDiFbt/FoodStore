/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAL.ProductDAO;
import java.io.PrintWriter;
import java.util.List;
import model.product;

/**
 *
 * @author Asus
 */
public class loadMoreController extends HttpServlet {

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
       
//        response.setContentType("text/html;charset=UTF-8");
//        String amount = request.getParameter("existed");
//        int int_amount = Integer.parseInt(amount);
//        ProductDAO dao = new ProductDAO();
//        List<product> list = dao.getNext20ProductNext(int_amount);
//        PrintWriter out = response.getWriter();
//
//        for (product object : list) {
//            out.println("<div class=\"col-sm-3\">\n"
//                    + "                                <div class=\"product product-card position-relative\">\n"
//                    + "                                    <div class=\"image-holder\">\n"
//                    + "                                        <img src=\"" + object.getImage() + "\" class=\"img-thumbnail\" style=\"height: 212px; width: 300px\" alt=\"product-item\">\n"
//                    + "                                    </div>\n"
//                    + "                                    <div class=\"cart-concern position-absolute\">\n"
//                    + "                                        <div class=\"cart-button d-flex\">\n"
//                    + "                                            <a href=\"#\" class=\"btn btn-md btn-black\">Add to Cart<svg class=\"cart-outline\"><use xlink:href=\"#cart-outline\"></use></svg></a>\n"
//                    + "                                        </div>\n"
//                    + "                                    </div>\n"
//                    + "                                    <div class=\"card-detail d-flex justify-content-between align-items-baseline pt-3\">\n"
//                    + "                                        <p class=\"card-title\">\n"
//                    + "                                            <a href=\"detail?pid=" + object.getProduct_id() + "\">" + object.getName() + "</a>\n"
//                    + "                                        </p>\n"
//                    + "\n"
//                    + "                                        <!-- price -->\n"
//                    + "                                    </div>\n"
//                    + "                                </div>\n"
//                    + "                            </div>");
//        }
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
