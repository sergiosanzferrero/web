/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

import java.sql.*;
import java.util.ArrayList;
import modelo.Reserva;




/**
 *
 * @author 
 */
public class ReservasBD {

    
public static int insert(Reserva reserva) {   
    ConnectionPool pool = ConnectionPool.getInstance(); 
    Connection connection = pool.getConnection();
    String query="INSERT INTO reserva (id,dni,fechaInicio,fechaFin) VALUES (?, ?, ?, ?)";
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

    public static ArrayList<Reserva> selectReservas() {
        ArrayList<Reserva> reservas = new ArrayList<Reserva>();
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection(); 
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM reserva"; 
        try {
                ps = connection.prepareStatement(query);
                rs = ps.executeQuery();
                Reserva reserva=null;
                while (rs.next()) {
                    reserva = new Reserva(); 
                    reserva.setId(rs.getString("id"));
                    reserva.setDni(rs.getString("dni"));
                    reserva.setFechaInicio(rs.getString("fechaInicio"));
                    reserva.setFechaFin(rs.getString("fechaFin"));
                    reservas.add(reserva);


                }
                rs.close();
                ps.close(); 
                pool.freeConnection(connection); 
                return reservas;
            } catch (SQLException e) { 
                e.printStackTrace();
                return null;
            }
        
        }  


}