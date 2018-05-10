/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import BD.PlazasBD;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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

@WebServlet(name = "ControladorPlazas", urlPatterns = {"/mapa", "/publicar"})
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
            // MODIFICADA url de publiar.jsp a mapa.html
            url = "mapa.jsp";
            System.out.println("PLAZA PUBLICADA");
            //String id = request.getParameter("id");
            String direccion = request.getParameter("searcher");
            Double latitud = Double.parseDouble(request.getParameter("lat"));
            Double longitud = Double.parseDouble(request.getParameter("lon"));
            String tipo = request.getParameter("tipo");
            String descripcion = request.getParameter("descripcion");
            String horario = request.getParameter("horario");
           // String img = request.getParameter("img");/* Recibe la imagen en multipart form data en array de bytes*/
            
            
            String pathFile = getServletContext().getRealPath("/Imagenes/plazas");
            Part filePart = request.getPart("file-upload");
            String fileName=""; 
            
            int contador=0;
            for (String cd : filePart.getHeader("content-disposition").split(";")) {
                if (cd.trim().startsWith("filename")&& contador<1) {
                    String fileName2 = cd.substring(cd.indexOf('=') + 1).trim().replace("\"","");
                    fileName= fileName2.substring(fileName2.lastIndexOf('/')+1).substring(fileName2.lastIndexOf('\\')+1);
                }
            }
            String img="/Imagenes/plazas/"+fileName;
            
                   
            InputStream fileContent = filePart.getInputStream(); 
            OutputStream outFile = null;
            outFile = new FileOutputStream(new File(pathFile + File.separator + fileName)); 
            int read = 0;
            byte[] bytes = new byte[1024];
            while ((read = fileContent.read(bytes)) != -1) { 
                outFile.write(bytes, 0, read);
            }
            
            if (outFile != null) { 
                    outFile.close();
            }
            if (fileContent != null) { 
                    fileContent.close();
            }
            
            
            
            
            
            
            
            /*Pendiente de implementacion*/
            String dni = request.getParameter("dni");
            Float precioDia = Float.parseFloat(request.getParameter("precio"));
            /*Pendiente de implementación*/
            
            Plaza plaza=new Plaza(dni,direccion,tipo,latitud,longitud,descripcion,horario, precioDia,img);
            int id=PlazasBD.insert(plaza);
            plaza.setId(id);
            
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
            
            json += "{ \"description\": \""+ desc +"\","+
                    "\"address\": \""+ address+"\","+
                    "\"type\": \""+ plazas.get(i).getTipo()+"\","+
                    "\"schedule\": \""+ plazas.get(i).getHorario()+"\","+
                    "\"latitude\": \""+ plazas.get(i).getLatitud()+"\","+
                    "\"longitude\": \""+ plazas.get(i).getLongitud()+"\","+
                    "\"price\": \""+ plazas.get(i).getPrecioDia()+"\","+
                    "\"contactName\": \"getnamebydni\","+
                    "\"appreciationAverage\": \"3\","+
                    "\"imagePath\": \""+ "Imagenes/plazas/parking1.jpg" +"\"}";
        }
        
        json += "]";

        return json;
    }
}
