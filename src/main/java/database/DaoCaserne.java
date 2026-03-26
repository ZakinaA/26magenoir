/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Caserne;

/**
 *
 * @author zakina
 */
public class DaoCaserne {
    
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;

    
    public static ArrayList<Caserne> getLesCasernes(Connection cnx){
        ArrayList<Caserne> lesCasernes= new ArrayList<Caserne>();
        try{
            requeteSql = cnx.prepareStatement("SELECT * FROM CASERNE");
            resultatRequete = requeteSql.executeQuery();
            
            while (resultatRequete.next()){
                Caserne c = new Caserne();
                c.setId(resultatRequete.getInt("ID_CASERNE"));
                c.setNom(resultatRequete.getString("NOM"));
                c.setVille(resultatRequete.getString("VILLE"));
                lesCasernes.add(c);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return lesCasernes;
    }
    
    public static Caserne getCaserneById(Connection cnx, int idCaserne){
        Caserne c = null;
        try{
            requeteSql = cnx.prepareStatement("SELECT * FROM CASERNE WHERE ID_CASERNE = ?");
            requeteSql.setInt(1, idCaserne);
            resultatRequete = requeteSql.executeQuery();
            
            if (resultatRequete.next()){
                c = new Caserne();
                c.setId(resultatRequete.getInt("ID_CASERNE"));
                c.setNom(resultatRequete.getString("NOM"));
                c.setRue(resultatRequete.getString("RUE"));
                c.setCopos(resultatRequete.getString("COPOS"));
                c.setVille(resultatRequete.getString("VILLE"));
            }
        } catch (SQLException e){ e.printStackTrace(); }
        return c;
    }
}
