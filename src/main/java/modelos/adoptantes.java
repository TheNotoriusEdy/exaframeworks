/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

/**
 *
 * @author loled
 */
public class adoptantes {
    private int id_adoptante;
    private String nombre;
    private String telefono;
    private int id_mascota;

    public adoptantes() {
    }

    public adoptantes(int id_adoptante, String nombre, String telefono, int id_mascota) {
        this.id_adoptante = id_adoptante;
        this.nombre = nombre;
        this.telefono = telefono;
        this.id_mascota = id_mascota;
    }

    public int getId_adoptante() {
        return id_adoptante;
    }

    public void setId_adoptante(int id_adoptante) {
        this.id_adoptante = id_adoptante;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getId_mascota() {
        return id_mascota;
    }

    public void setId_mascota(int id_mascota) {
        this.id_mascota = id_mascota;
    }
    
    
    
}
