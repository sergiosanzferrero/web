/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import BD.PlazasBD;
import BD.UsuariosBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;
import modelo.Plaza;

/**
 *
 * @author sergiosanzferrero
 */
@WebServlet(name = "ControladorPlazasUsuario", urlPatterns = {"/ControladorPlazasUsuario"})
public class ControladorPlazasUsuario extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

// get parameters from the request
        HttpSession session=request.getSession();
        
        Usuario usuario=(Usuario)session.getAttribute("login");

        String url="plazasUsuario.jsp";
        ArrayList<Plaza>plazas=PlazasBD.selectPlaza(usuario);
        session.setAttribute("plazasUsuario", plazas);   
        
        //RequestDispatcher dispatcher =getServletContext().getRequestDispatcher(url); 
        //dispatcher.forward(request, response);
        request.getRequestDispatcher(url).forward(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        doPost(request, response);
    }
  

}