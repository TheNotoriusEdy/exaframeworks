/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelosDAO;

import bd.cn;
import modelos.mascotas;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
/**
 *
 * @author loled
 */
public class mascotasDAO {
    private cn cn;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public mascotasDAO() throws ClassNotFoundException, SQLException{
    cn = new cn();
    }
    
    //Consulta General
    public List listar(){
        ArrayList<mascotas> list = new ArrayList<>();
        String sql = "SELECT m.id_mascota, m.id_tipo, m.nombre, m.foto, t.nombre as tipo_nombre " +
                     "FROM mascotas m " +
                     "LEFT JOIN tiposmascota t ON m.id_tipo = t.id_tipo";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                mascotas m = new mascotas();
                m.setId_mascota(rs.getInt("id_mascota"));
                m.setId_tipo(rs.getInt("id_tipo"));
                m.setNombre(rs.getString("nombre"));
                m.setFoto(rs.getString("foto"));
                m.setTipoNombre(rs.getString("tipo_nombre"));
                list.add(m);
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return list;
    }

    //Insertar Registro
    public boolean insertar(mascotas m){
        String sql = "INSERT INTO mascotas(id_tipo, nombre, foto) VALUES(?,?,?)";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, m.getId_tipo());
            ps.setString(2, m.getNombre());
            ps.setString(3, m.getFoto());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }

    //Actualizar Registro
    public boolean actualizar(mascotas m){
        String sql = "UPDATE mascotas SET id_tipo=?, nombre=?, foto=? WHERE id_mascota=?";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, m.getId_tipo());
            ps.setString(2, m.getNombre());
            ps.setString(3, m.getFoto());
            ps.setInt(4, m.getId_mascota());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }

    //Eliminar Registro
    public boolean eliminar(int id){
        String sql = "DELETE FROM mascotas WHERE id_mascota=?";
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

    //Obtener mascota por ID
    public mascotas getMascotaById(int id){
        mascotas m = new mascotas();
        String sql = "SELECT * FROM mascotas WHERE id_mascota=?";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                m.setId_mascota(rs.getInt("id_mascota"));
                m.setId_tipo(rs.getInt("id_tipo"));
                m.setNombre(rs.getString("nombre"));
                m.setFoto(rs.getString("foto"));
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return m;
    }
    
    //Buscar mascotas con filtros
    public List buscarConFiltros(String nombreBusqueda, Integer tipoFiltro){
        ArrayList<mascotas> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT m.id_mascota, m.id_tipo, m.nombre, m.foto, t.nombre as tipo_nombre ");
        sql.append("FROM mascotas m ");
        sql.append("LEFT JOIN tiposmascota t ON m.id_tipo = t.id_tipo ");
        sql.append("WHERE 1=1 ");
        
        // Filtro por nombre
        if (nombreBusqueda != null && !nombreBusqueda.trim().isEmpty()) {
            sql.append("AND m.nombre LIKE ? ");
        }
        
        // Filtro por tipo
        if (tipoFiltro != null && tipoFiltro > 0) {
            sql.append("AND m.id_tipo = ? ");
        }
        
        sql.append("ORDER BY m.nombre ASC");
        
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql.toString());
            
            int paramIndex = 1;
            if (nombreBusqueda != null && !nombreBusqueda.trim().isEmpty()) {
                ps.setString(paramIndex++, "%" + nombreBusqueda.trim() + "%");
            }
            if (tipoFiltro != null && tipoFiltro > 0) {
                ps.setInt(paramIndex, tipoFiltro);
            }
            
            rs = ps.executeQuery();
            
            while (rs.next()) {
                mascotas m = new mascotas();
                m.setId_mascota(rs.getInt("id_mascota"));
                m.setId_tipo(rs.getInt("id_tipo"));
                m.setNombre(rs.getString("nombre"));
                m.setFoto(rs.getString("foto"));
                m.setTipoNombre(rs.getString("tipo_nombre"));
                list.add(m);
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return list;
    }
    
    //Contar total de mascotas (para paginación futura)
    public int contarTotal(){
        int total = 0;
        String sql = "SELECT COUNT(*) as total FROM mascotas";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return total;
    }
    
}
