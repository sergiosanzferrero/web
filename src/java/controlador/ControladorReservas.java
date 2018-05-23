/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import BD.ReservasBD;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Reserva;

/**
 *
 * @author 
 */
@WebServlet(name = "ControlReserva", urlPatterns = {"/ControlReserva", "/Reservar"})
public class ControladorReservas extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            //doGet(request, response);
            String url="index.jsp";
            
            String id = request.getParameter("id");
            String dni = request.getParameter("dni");
            String fechaInicio = request.getParameter("fecha_llegada");
            String fechaFin = request.getParameter("fecha_salida");
            Integer valoracion = Integer.parseInt(request.getParameter("valoracion"));
            Boolean activa = Boolean.parseBoolean(request.getParameter("activa"));
                 Reserva reserva=new Reserva(id,dni,fechaInicio,fechaFin,valoracion,activa);
                 ReservasBD.insert(reserva);
                 
                      request.getRequestDispatcher(url).forward(request, response);
                 
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        
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