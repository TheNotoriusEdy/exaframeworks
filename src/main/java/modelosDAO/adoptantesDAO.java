/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelosDAO;

import bd.cn;
import modelos.adoptantes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 *
 * @author loled
 */
public class adoptantesDAO {
    private cn cn;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public adoptantesDAO() throws ClassNotFoundException, SQLException{
        cn = new cn();
    }
    
    //Consulta General
    public List listar(){
        ArrayList<adoptantes> list = new ArrayList<>();
        String sql = "SELECT * FROM adoptantes";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                adoptantes a = new adoptantes();
                a.setId_adoptante(rs.getInt("id_adoptante"));
                a.setNombre(rs.getString("nombre"));
                a.setTelefono(rs.getString("telefono"));
                a.setId_mascota(rs.getInt("id_mascota"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return list;
    }

    //Insertar Registro
    public boolean insertar(adoptantes a){
        String sql = "INSERT INTO adoptantes(nombre, telefono, id_mascota) VALUES(?,?,?)";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, a.getNombre());
            ps.setString(2, a.getTelefono());
            ps.setInt(3, a.getId_mascota());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }

    //Actualizar Registro
    public boolean actualizar(adoptantes a){
        String sql = "UPDATE adoptantes SET nombre=?, telefono=?, id_mascota=? WHERE id_adoptante=?";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, a.getNombre());
            ps.setString(2, a.getTelefono());
            ps.setInt(3, a.getId_mascota());
            ps.setInt(4, a.getId_adoptante());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }

    //Eliminar Registro
    public boolean eliminar(int id){
        String sql = "DELETE FROM adoptantes WHERE id_adoptante=?";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }

    //Obtener adoptante por ID
    public adoptantes getAdoptanteById(int id){
        adoptantes a = new adoptantes();
        String sql = "SELECT * FROM adoptantes WHERE id_adoptante=?";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                a.setId_adoptante(rs.getInt("id_adoptante"));
                a.setNombre(rs.getString("nombre"));
                a.setTelefono(rs.getString("telefono"));
                a.setId_mascota(rs.getInt("id_mascota"));
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return a;
    }

    //Obtener adoptantes por mascota
    public List listarPorMascota(int id_mascota){
        ArrayList<adoptantes> list = new ArrayList<>();
        String sql = "SELECT * FROM adoptantes WHERE id_mascota=?";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id_mascota);
            rs = ps.executeQuery();

            while (rs.next()) {
                adoptantes a = new adoptantes();
                a.setId_adoptante(rs.getInt("id_adoptante"));
                a.setNombre(rs.getString("nombre"));
                a.setTelefono(rs.getString("telefono"));
                a.setId_mascota(rs.getInt("id_mascota"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return list;
    }
}
