/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;
import java.sql.*;
import modelo.Reserva;




/**
 *
 * @author 
 */
public class ReservaBD {

    
public static int insert(Reserva reserva) {   
    ConnectionPool pool = ConnectionPool.getInstance(); 
    Connection connection = pool.getConnection();
    String query="INSERT INTO reserva (id,dni,fechaInicio,fechaFina) VALUES (?, ?, ?, ?)";
    PreparedStatement ps = null;
  try {
        ps = connection.prepareStatement(query); 
        ps.setString(1, reserva.getId()); 
        ps.setString(2, reserva.getDni()); 
        ps.setString(3, reserva.getFechaInicio()); 
        ps.setString(4, reserva.getFechaFin()); 
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