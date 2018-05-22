/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import BD.PlazasBD;
import BD.UsuariosBD;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modelo.Plaza;

@WebServlet(name = "ControladorPlazas", urlPatterns = {"/mapa", "/publicar","/plaza.jsp"})
@MultipartConfig
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
            String json = FillPlacesToJson(plazas);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            return;
        }
        
        /*Cuando envia formulario de publicacion de plaza*/
        else if(path.contains("publicar"))
        {
            url = "mapa.jsp";
            
            String direccion = request.getParameter("searcher");
            Double latitud = Double.parseDouble(request.getParameter("lat"));
            Double longitud = Double.parseDouble(request.getParameter("lon"));
            String tipo = request.getParameter("tipo");
            String descripcion = request.getParameter("descripcion");
            String horario = request.getParameter("horario");
            
            Part filePart = request.getPart("file-upload");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            InputStream fileContent = filePart.getInputStream();
            String img = "Imagenes/plazas/" + fileName;
            
            String pathFile = getServletContext().getRealPath("/");
            pathFile = pathFile.substring(0, pathFile.lastIndexOf("\\"));
            pathFile = pathFile.substring(0, pathFile.lastIndexOf("\\"));
            pathFile = pathFile.substring(0, pathFile.lastIndexOf("\\"));
            pathFile += "\\web\\Imagenes\\plazas\\" + fileName;
            
            OutputStream outFile = new FileOutputStream(new File(pathFile)); 
            int read = 0;
            byte[] bytes = new byte[1024];
            
            while ((read = fileContent.read(bytes)) != -1) 
            { 
                outFile.write(bytes, 0, read);
            }
            
            if (outFile != null)
                    outFile.close();
            
            if (fileContent != null)
                    fileContent.close();
            
            
            HttpSession session = request.getSession(); 
            String dni = (String)session.getAttribute("dni");
            if(dni == null){
                url = "login.html";
                request.getRequestDispatcher(url).forward(request, response);
                return;
            }
            Float precioDia = Float.parseFloat(request.getParameter("precio"));
            
            Plaza plaza=new Plaza(dni,direccion,tipo,latitud,longitud,descripcion,horario, precioDia,img);
            int id=PlazasBD.insert(plaza);
            plaza.setId(id);
            
            
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
        else if (path.contains("plaza"))
        {
           url = "local.jsp";
           System.out.println("PLAZAS");
          Integer id = Integer.parseInt(request.getParameter("id"));
          System.out.println("PLAZA CON ID="+id.toString());
          ArrayList<Plaza> plazas = PlazasBD.selectPlazaId(id);

                  request.setAttribute("plazas", plazas);
        }
        
        request.getRequestDispatcher(url).forward(request, response);
    }
  
    private String FillPlacesToJson(ArrayList<Plaza> plazas)
    {
        String json = "[";
        
        for(int i = 0; i < plazas.size(); i++)
        {
            String address = plazas.get(i).getDireccion();
            
            if(address.length() > 30 && address.split(",").length > 1)//Resume la información de la dirección
                address = address.split(",")[0] + ", " + address.split(",")[1];
            
            String desc = plazas.get(i).getDescripcion();
            
            if(desc.length() > 40)
                desc = desc.substring(0,40) + "...";
            
            if(i != 0)
                json += " , ";
            
            json += "{ \"link\": \"" + "plaza.jsp?id=" + plazas.get(i).getId()+ "\","+
                    "\"address\": \""+ address+"\","+
                    "\"type\": \""+ plazas.get(i).getTipo()+"\","+
                    "\"schedule\": \""+ plazas.get(i).getHorario()+"\","+
                    "\"latitude\": \""+ plazas.get(i).getLatitud()+"\","+
                    "\"longitude\": \""+ plazas.get(i).getLongitud()+"\","+
                    "\"price\": \""+ plazas.get(i).getPrecioDia()+"\","+
                    "\"contactName\": \"" + UsuariosBD.seleccionaUsuarioDni(plazas.get(i).getDni()).getNombre() +"\","+
                    "\"appreciationAverage\": \"3\","+
                    "\"imagePath\": \""+ plazas.get(i).getImg() +"\"}";
        }
        
        json += "]";

        return json;
    }
}
