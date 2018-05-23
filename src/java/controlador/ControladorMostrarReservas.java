/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import BD.ReservasBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Plaza;
import modelo.Reserva;

/**
 *
 * @author sergiosanzferrero
 */
@WebServlet(name = "ControladorMostrarReservas", urlPatterns = {"/MostrarReservas"})
public class ControladorMostrarReservas extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
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
        
        ArrayList<Reserva> reservas = null;
        String url="";

        url = "listareservas.jsp"; 

        reservas = ReservasBD.selectReservas();

        HttpSession session = request.getSession(); 

        
        session.setAttribute("reservas", reservas);   
        
        //RequestDispatcher dispatcher =getServletContext().getRequestDispatcher(url); 
        //dispatcher.forward(request, response);
        request.getRequestDispatcher(url).forward(request, response);
      
    }


}
