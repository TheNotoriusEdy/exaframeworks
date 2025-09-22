/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

/**
 *
 * @author loled
 */
public class mascotas {
    private int id_mascota;
    private int id_tipo;
    private String nombre;
    private String foto;

    public mascotas() {
    }

    public mascotas(int id_mascota, int id_tipo, String nombre, String foto) {
        this.id_mascota = id_mascota;
        this.id_tipo = id_tipo;
        this.nombre = nombre;
        this.foto = foto;
    }
    

    public int getId_mascota() {
        return id_mascota;
    }

    public void setId_mascota(int id_mascota) {
        this.id_mascota = id_mascota;
    }

    public int getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
    
    
    
}
