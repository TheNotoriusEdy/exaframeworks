/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author loled
 */
public class cn {
    private Connection con;
    
    public cn () throws SQLException, ClassNotFoundException{
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        this.con=(Connection)DriverManager.getConnection(""
                + "jdbc:mysql://localhost:3306/mascontas_iniciales?useSSL=false&serverTimezone=UTC",
                "root","");
        System.out.println("Conexión Establecida");
    }
    catch(ClassNotFoundException e){
        System.err.println("Driver JDBC no encontrador:"+e.getMessage());
    }
    catch (SQLException e){
    System.err.println("Error al conectar a la BD: "+ e.getMessage());
    }
    }
    
    public Connection getConexion(){
    return this.con;
    }
}
