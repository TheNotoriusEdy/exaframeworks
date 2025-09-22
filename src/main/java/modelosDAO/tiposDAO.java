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
        String sql = "SELECT * FROM tiposmascota WHERE id_tipo="+id;
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                t.setId_tipo(rs.getInt("id_tipo"));
                t.setId_tipo(rs.getInt("tipo"));
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return t;
    }
}
