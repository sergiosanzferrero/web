/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author sergiosanzferrero
 */
public class Parking {
    private String id;
    private String ciudad;
    private String calle;
    private String tipo;
    private String descripcion;
    private String img;
    

    public Parking(){
        id="";
        ciudad="";
        calle="";
        tipo="";
        descripcion="";
        img="";

    }

    public Parking(String id, String ciudad, String calle, String tipo, String descripcion, String img) {
        this.id = id;
        this.ciudad = ciudad;
        this.calle = calle;
        this.tipo = tipo;
        this.descripcion = descripcion;
        this.img = img;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
    
    
    
    
}