/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;
import java.io.Serializable;

public class Plaza implements Serializable{
    private String id;
    private String dni;
    private String direccion;
    private String tipo;
    private Double latitud;
    private Double longitud;
    private String descripcion;
    private Float precioDia;
    private String img;
    

    public Plaza(){

    }

    public Plaza(String id, String dni, String direccion, String tipo, Double latitud, Double longitud,   String descripcion, Float precioDia, String img) {
        this.id = id;
        this.dni = dni;
        this.direccion = direccion;
        this.latitud = latitud;
        this.longitud = longitud;
        this.tipo = tipo;
        this.precioDia = precioDia;
        this.descripcion = descripcion;
        this.img = img;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

        public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

     public Double getLatitud() {
        return latitud;
    }

    public void setLatitud(Double latitud) {
        this.latitud = latitud;
    }
    
     public Double getLongitud() {
        return longitud;
    }

    public void setLongitud(Double longitud) {
        this.longitud = longitud;
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

    /**
     * @return the dni
     */
    public String getDni() {
        return dni;
    }

    /**
     * @param dni the dni to set
     */
    public void setDni(String dni) {
        this.dni = dni;
    }

    /**
     * @return the precioDia
     */
    public Float getPrecioDia() {
        return precioDia;
    }

    /**
     * @param precioDia the precioDia to set
     */
    public void setPrecioDia(Float precioDia) {
        this.precioDia = precioDia;
    }
    
}