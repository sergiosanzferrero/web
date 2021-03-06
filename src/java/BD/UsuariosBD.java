/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;
import java.sql.*;
import modelo.Usuario;




/**
 *
 * @author sergiosanzferrero
 */
public class UsuariosBD {

    
public static int insert(Usuario usuario) {   
    ConnectionPool pool = ConnectionPool.getInstance(); 
    Connection connection = pool.getConnection();
    String query="INSERT INTO usuarios (dni,nombre,apellidos,email,password,telefono) VALUES (?, ?, ?, ?, ?, ?)";
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
public static boolean existeUsuario(String email) { 
    ConnectionPool pool = ConnectionPool.getInstance();
    Connection connection = pool.getConnection(); 
    PreparedStatement ps = null;
    ResultSet rs = null;
    String query = "SELECT dni FROM usuarios WHERE email = ? ";
    
    try { 
        ps = connection.prepareStatement(query); 
        ps.setString(1, email);
        rs = ps.executeQuery();
        boolean res = rs.next();
        rs.close();
        ps.close(); 
        pool.freeConnection(connection); 
        return res;
    } catch (SQLException e) { 
        e.printStackTrace();
        return false; 
    }
}
public static Usuario seleccionaUsuario(String email) { 
    ConnectionPool pool = ConnectionPool.getInstance();
    Connection connection = pool.getConnection(); 
    PreparedStatement ps = null;
    ResultSet rs = null;
    String query = "SELECT * FROM usuarios WHERE email = ?";
    
    try { 
        ps = connection.prepareStatement(query); 
        ps.setString(1, email);
        rs = ps.executeQuery();
        Usuario usuario=null;
        if (rs.next()) {
            usuario = new Usuario(); 
            usuario.setDni(rs.getString("dni"));
            usuario.setNombre(rs.getString("nombre"));
            usuario.setApellidos(rs.getString("apellidos"));
            usuario.setEmail(rs.getString("email"));
            usuario.setPassword(rs.getString("password"));
            usuario.setTelefono(rs.getString("telefono"));
        }     
        rs.close();
        ps.close(); 
        pool.freeConnection(connection); 
        return usuario;
        
    } catch (SQLException e) { 
        e.printStackTrace();
        return null; 
    }
}
public static Usuario seleccionaUsuarioDni(String dni) { 
    ConnectionPool pool = ConnectionPool.getInstance();
    Connection connection = pool.getConnection(); 
    PreparedStatement ps = null;
    ResultSet rs = null;
    String query = "SELECT * FROM usuarios WHERE dni = ?";
    
    try { 
        ps = connection.prepareStatement(query); 
        ps.setString(1, dni);
        rs = ps.executeQuery();
        Usuario usuario=null;
        if (rs.next()) {
            usuario = new Usuario(); 
            usuario.setDni(rs.getString("dni"));
            usuario.setNombre(rs.getString("nombre"));
            usuario.setApellidos(rs.getString("apellidos"));
            usuario.setEmail(rs.getString("email"));
            usuario.setPassword(rs.getString("password"));
            usuario.setTelefono(rs.getString("telefono"));
        }     
        rs.close();
        ps.close(); 
        pool.freeConnection(connection); 
        return usuario;
        
    } catch (SQLException e) { 
        e.printStackTrace();
        return null; 
    }
}
public static boolean login(String dni, String password) { 
    ConnectionPool pool = ConnectionPool.getInstance();
    Connection connection = pool.getConnection(); 
    PreparedStatement ps = null;
    ResultSet rs = null;
    String query = "SELECT email,password FROM usuarios WHERE (email = ? and password=?) ";
    
    try { 
        ps = connection.prepareStatement(query); 
        ps.setString(1, dni);
        ps.setString(2,password);
        rs = ps.executeQuery();
        boolean res = rs.next();
        rs.close();
        ps.close(); 
        pool.freeConnection(connection); 
        return res;
    } catch (SQLException e) { 
        e.printStackTrace();
        return false; 
    }
}

public static void editaPerfil(Usuario usuario) { 
    ConnectionPool pool = ConnectionPool.getInstance();
    Connection connection = pool.getConnection(); 
    PreparedStatement ps = null;
    //ResultSet rs = null;
    String query = "UPDATE usuarios SET email=?,telefono=?,password=? WHERE dni=?";
    
    try { 
        ps = connection.prepareStatement(query); 
        ps.setString(1, usuario.getEmail());
        ps.setString(2,usuario.getTelefono());
        ps.setString(3,usuario.getPassword());
        ps.setString(4,usuario.getDni());
        ps.executeUpdate();
      
        //rs.close();
        ps.close(); 
        pool.freeConnection(connection); 
        
    } catch (SQLException e) { 
        e.printStackTrace();
       
    }
}


}


