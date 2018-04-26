/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import BD.PlazasBD;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Plaza;

@WebServlet(name = "ControladorPlazas", urlPatterns = {"/mapa", "/publicar"})
public class ControladorPlazas extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String path = request.getRequestURL().toString() + "?" + request.getQueryString();
        String url = "";

        /*Cuando envia formulario de busqueda de plazas*/
        if(path.contains("mapa"))
        {
            url = "mapa.jsp";
            
            ArrayList<Plaza> plazas = PlazasBD.selectAllPlazas();
            HttpSession session = request.getSession(); 
            session.setAttribute("plazas", plazas);   
        }
        
        /*Cuando envia formulario de publicacion de plaza*/
        else if(path.contains("publicar"))
        {
            url = "publicar.jsp"; 
            
            //String id = request.getParameter("id");
            String direccion = request.getParameter("direccion");
            Double latitud = Double.parseDouble(request.getParameter("latitud"));
            Double longitud = Double.parseDouble(request.getParameter("latitud"));
            String tipo = request.getParameter("tipo");
            String descripcion = request.getParameter("descripcion");
            String img = request.getParameter("img");/* Recibe la imagen en multipart form data en array de bytes*/
            
            /*Pendiente de implementacion*/
            String dni = request.getParameter("dni");
            Float precioDia = Float.parseFloat(request.getParameter("precioDia"));
            /*Pendiente de implementación*/
            
            Plaza plaza=new Plaza(dni,direccion,tipo,latitud,longitud,descripcion,precioDia,img);
            PlazasBD.insert(plaza);
            HttpSession session = request.getSession(); 
            session.setAttribute("parking", plaza);   
        }
        
        //RequestDispatcher dispatcher =getServletContext().getRequestDispatcher(url); 
        //dispatcher.forward(request, response);
        request.getRequestDispatcher(url).forward(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    { 
        String path = request.getRequestURL().toString() + "?" + request.getQueryString();
        String url = "";
        
        /*jsps sin modelo, cuando esten las cookies habrá que tenerlas en cuenta*/
        
        if(path.contains("mapa"))
        {
            url = "mapa.jsp"; 
            
        }
        else if(path.contains("publicar"))
        {
            url = "publicar.jsp"; 
        }
        
        request.getRequestDispatcher(url).forward(request, response);
    }
  

}
