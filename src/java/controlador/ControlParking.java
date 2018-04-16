/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import BD.ParkingBD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Parking;

/**
 *
 * @author sergiosanzferrero
 */
@WebServlet(name = "ControlUsuario", urlPatterns = {"/ControlUsuario"})
public class ControlParking extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// get parameters from the request
        String id = request.getParameter("id");
        String ciudad = request.getParameter("ciudad");
        String calle = request.getParameter("calle");
        String tipo = request.getParameter("tipo");
        String descripcion = request.getParameter("descripcion");
        String img = request.getParameter("img");
        
        Parking parking=new Parking(id,ciudad,calle,tipo,descripcion,img);

        String url="";

        url = "rmapa.html"; 
        ParkingBD.insert(parking);
        HttpSession session = request.getSession(); 
        session.setAttribute("parking", parking);   
        
        //RequestDispatcher dispatcher =getServletContext().getRequestDispatcher(url); 
        //dispatcher.forward(request, response);
        request.getRequestDispatcher(url).forward(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        doPost(request, response);
    }
  

}
