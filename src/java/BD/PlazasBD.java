
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package BD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.Plaza;

public class PlazasBD 
{
    
    public static int insert(Plaza plaza) 
    {   
        ConnectionPool pool = ConnectionPool.getInstance(); 
        Connection connection = pool.getConnection();
        String query="INSERT INTO plazas (dni,direccion,tipo,latitud, longitud, descripcion,precioDia,img) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = null;
        
        try 
        {
            ps = connection.prepareStatement(query); 
            //ps.setString(1, plaza.getId()); 
            ps.setString(1, plaza.getDni());
            ps.setString(2, plaza.getDireccion()); 
            ps.setString(3, plaza.getTipo()); 
            ps.setString(4, plaza.getLatitud().toString());  
            ps.setString(5, plaza.getLongitud().toString());  
            ps.setString(6, plaza.getDescripcion()); 
            ps.setString(7, plaza.getPrecioDia().toString()); 
            ps.setString(8, plaza.getImg()); 
            int res = ps.executeUpdate();
            ps.close(); 
            pool.freeConnection(connection);
            return res;

        } 
        catch (SQLException e) 
        { 
            e.printStackTrace(); 
            return 0;          
        }
    }
    
    
    public static ArrayList<Plaza> selectAllPlazas() 
    {
        ArrayList<Plaza> plazas = new ArrayList<Plaza>();
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection(); 
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM plazas";
        
        try 
        {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            Plaza plaza = null;

            while (rs.next()) 
            {
                plaza = new Plaza(); 
                //plaza.setId(rs.getString("id"));
                plaza.setDni(rs.getString("dni"));
                plaza.setDireccion(rs.getString("direccion"));
                plaza.setLatitud(rs.getDouble("latitud"));
                plaza.setLongitud(rs.getDouble("longitud"));
                plaza.setDescripcion(rs.getString("descripcion"));
                plaza.setTipo(rs.getString("tipo"));
                plaza.setPrecioDia(rs.getFloat("precioDia"));
                plaza.setImg(rs.getString("img"));
                plazas.add(plaza);
            }

            rs.close();
            ps.close(); 
            pool.freeConnection(connection);                 
        } 
        
        catch (SQLException e) 
        { 
            e.printStackTrace();
            return null;
        }
        
        return plazas;
    }  
    
}
