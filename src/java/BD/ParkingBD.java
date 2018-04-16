/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.Parking;

/**
 *
 * @author sergiosanzferrero
 */
public class ParkingBD {
    
    public static int insert(Parking parking) {   
    ConnectionPool pool = ConnectionPool.getInstance(); 
    Connection connection = pool.getConnection();
    String query="INSERT INTO parking (id,ciudad,calle,tipo,descripcion,img) VALUES (?, ?, ?, ?, ?, ?)";
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
    
    
    
}
