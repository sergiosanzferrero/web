/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.io.Serializable;

/**
 *
 * @author 
 */
public class Reserva implements Serializable{
    private String id;
    private String dni;
    private String fechaInicio;
    private String fechaFin;
    private Integer valoracion;
    
    public Reserva(){
        id="";
        dni="";
        fechaInicio="";
        fechaFin="";   
        valoracion=0;
    }

    public Reserva(String id, String dni, String fechaInicio, String fechaFin, Integer valoracion) {
        this.id = id;
        this.dni = dni;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.valoracion= valoracion;
    }

    
    
    
    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the fechaInicio
     */
    public String getFechaInicio() {
        return fechaInicio;
    }

    /**
     * @param fechaInicio the fechaInicio to set
     */
    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    /**
     * @return the fechaFin
     */
    public String getFechaFin() {
        return fechaFin;
    }

    /**
     * @param fechaFin the fechaFin to set
     */
    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

        public Integer getValoracion() {
        return valoracion;
    }

    public void setValoracion(Integer valoracion) {
        this.valoracion = valoracion;
    }
    
    
    
}
