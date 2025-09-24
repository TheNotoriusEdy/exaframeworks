/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelosDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import bd.cn;
import modelos.tipomascota;

/**
 *
 * @author loled
 */
public class tiposDAO {
    private cn cn;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public tiposDAO() throws ClassNotFoundException, SQLException{
    cn = new cn();
    }

    //Consulta General
    public List listar(){
        ArrayList<tipomascota> list = new ArrayList<>();
        String sql = "SELECT * FROM tiposmascota";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                tipomascota t = new tipomascota();
                t.setId_tipo(rs.getInt("id_tipo"));
                t.setNombre(rs.getString("nombre"));
                t.setDescripcion(rs.getString("descripcion"));
                list.add(t);
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return list;
    }

    //Consultar por ID
    public tipomascota listarId(int id){
        tipomascota t = new tipomascota();
        String sql = "SELECT * FROM tiposmascota WHERE id_tipo=?";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                t.setId_tipo(rs.getInt("id_tipo"));
                t.setNombre(rs.getString("nombre"));
                t.setDescripcion(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return t;
    }
    
    //Agregar nuevo tipo
    public boolean agregar(tipomascota t){
        String sql = "INSERT INTO tiposmascota (nombre, descripcion) VALUES (?, ?)";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, t.getNombre());
            ps.setString(2, t.getDescripcion());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
    
    //Actualizar tipo
    public boolean actualizar(tipomascota t){
        String sql = "UPDATE tiposmascota SET nombre=?, descripcion=? WHERE id_tipo=?";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, t.getNombre());
            ps.setString(2, t.getDescripcion());
            ps.setInt(3, t.getId_tipo());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
    
    //Eliminar tipo
    public boolean eliminar(int id){
        String sql = "DELETE FROM tiposmascota WHERE id_tipo=?";
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
    
    //Buscar tipos por nombre
    public List buscarPorNombre(String nombreBusqueda){
        ArrayList<tipomascota> list = new ArrayList<>();
        String sql = "SELECT * FROM tiposmascota WHERE nombre LIKE ? ORDER BY nombre ASC";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombreBusqueda.trim() + "%");
            rs = ps.executeQuery();
            
            while (rs.next()) {
                tipomascota t = new tipomascota();
                t.setId_tipo(rs.getInt("id_tipo"));
                t.setNombre(rs.getString("nombre"));
                t.setDescripcion(rs.getString("descripcion"));
                list.add(t);
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return list;
    }
}
