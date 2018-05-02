/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import BD.UsuariosBD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;

/**
 *
 * @author sergiosanzferrero
 */
@WebServlet(name = "ControladorInicioSesion", urlPatterns = {"/ControladorInicioSesion"})
public class ControladorInicioSesion extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

// get parameters from the request
        String email = request.getParameter("email");
        String password = request.getParameter("contrasena");
     
        
       // Usuario usuario=new Usuario(dni,nombre,apellidos,email,password,telefono);

        String url="";
        if(UsuariosBD.login(email,password)){
            url="mapa.jsp";
        }
        else{
        url = "errorLogin.html"; 
        }
        
        Usuario usuario=UsuariosBD.seleccionaUsuario(email);
        HttpSession session = request.getSession(); 
        session.setAttribute("login", usuario);
        //RequestDispatcher dispatcher =getServletContext().getRequestDispatcher(url); 
        //dispatcher.forward(request, response);
        request.getRequestDispatcher(url).forward(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        doPost(request, response);
    }
  

}
