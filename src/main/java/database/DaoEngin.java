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
import model.Engin;

public class DaoEngin {
    
    public static ArrayList<Engin> getLesEnginsByCaserne(Connection cnx, int idCaserne) {
        ArrayList<Engin> lesEngins = new ArrayList<>();
        try {
            PreparedStatement requeteSql = cnx.prepareStatement("select * from engin where id_caserne = ?");
            requeteSql.setInt(1, idCaserne);
            ResultSet resultatRequete = requeteSql.executeQuery();
            
            while (resultatRequete.next()) {
                Engin e = new Engin();
                e.setId(resultatRequete.getInt("id_engin"));
                e.setLibelle(resultatRequete.getString("libelle"));
                e.setNumeroOrdre(resultatRequete.getInt("numeroordre"));
                lesEngins.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lesEngins;
    }
}