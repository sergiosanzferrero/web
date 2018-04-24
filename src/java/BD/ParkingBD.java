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
import modelo.Parking;

/**
 *
 * @author sergiosanzferrero
 */
public class ParkingBD {
    
    public static int insert(Parking parking) {   
        ConnectionPool pool = ConnectionPool.getInstance(); 
        Connection connection = pool.getConnection();
        String query="INSERT INTO plaza (id,ciudad,calle,tipo,descripcion,img) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(query); 
            ps.setString(1, parking.getId()); 
            ps.setString(2, parking.getCiudad()); 
            ps.setString(3, parking.getCalle()); 
            ps.setString(4, parking.getTipo()); 
            ps.setString(5, parking.getDescripcion()); 
            ps.setString(6, parking.getImg()); 
            int res = ps.executeUpdate();
            ps.close(); 
            pool.freeConnection(connection);
            return res;

        } catch (SQLException e) { 
                e.printStackTrace(); 
                return 0;          
        }
    
    }
    
  
    
      public static ArrayList<Parking> selectParkings() {
        ArrayList<Parking> parkings = new ArrayList<Parking>();
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection(); 
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM plaza"; 
        try {
                ps = connection.prepareStatement(query);
                rs = ps.executeQuery();
                Parking parking=null;
                while (rs.next()) {
                    parking = new Parking(); 
                    parking.setId(rs.getString("id"));
                    parking.setCiudad(rs.getString("ciudad"));
                    parking.setCalle(rs.getString("calle"));
                    parking.setDescripcion(rs.getString("descripcion"));
                    parking.setTipo(rs.getString("tipo"));
                    parking.setImg(rs.getString("img"));
                    parkings.add(parking);


                }
                rs.close();
                ps.close(); 
                pool.freeConnection(connection); 
                return parkings;
            } catch (SQLException e) { 
                e.printStackTrace();
                return null;
            }
        
        }  
    
}
