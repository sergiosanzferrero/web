/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;
import java.sql.*;
import modelo.Usuario;
import static org.apache.tomcat.jni.Socket.pool;



/**
 *
 * @author sergiosanzferrero
 */
public class UsuarioBD {

    
public static int insert(Usuario usuario) {   
    ConnectionPool pool = ConnectionPool.getInstance(); 
    Connection connection = pool.getConnection();
    String query="INSERT INTO usuario (dni,nombre,apellidos,email,password,telefono) VALUES (?, ?, ?, ?, ?, ?)";
    PreparedStatement ps = null;
  try {
        ps = connection.prepareStatement(query); 
        ps.setString(1, usuario.getDni()); 
        ps.setString(2, usuario.getNombre()); 
        ps.setString(3, usuario.getApellidos()); 
        ps.setString(4, usuario.getEmail()); 
        ps.setString(5, usuario.getPassword()); 
        ps.setString(6, usuario.getTelefono()); 
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
