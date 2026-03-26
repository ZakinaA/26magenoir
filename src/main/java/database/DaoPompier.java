package database;

import java.sql.*;
import java.util.ArrayList;
import model.Caserne;
import model.Pompier;

public class DaoPompier {
    
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;

    public static ArrayList<Pompier> getLesPompiers(Connection cnx){
        ArrayList<Pompier> lesPompiers = new ArrayList<Pompier>();
        try{
            requeteSql = cnx.prepareStatement("SELECT p.MATRICULE as p_id, p.NOM as p_nom, p.PRENOM as p_prenom, c.ID_CASERNE as c_id, c.NOM as c_nom " +
                                 " FROM POMPIER p INNER JOIN CASERNE c ON p.ID_CASERNE = c.ID_CASERNE");
            resultatRequete = requeteSql.executeQuery();
            while (resultatRequete.next()){
                Pompier p = new Pompier();
                p.setId(resultatRequete.getInt("p_id"));
                p.setNom(resultatRequete.getString("p_nom"));
                p.setPrenom(resultatRequete.getString("p_prenom"));
                Caserne c = new Caserne();
                c.setId(resultatRequete.getInt("c_id"));
                c.setNom(resultatRequete.getString("c_nom"));
                p.setUneCaserne(c);
                lesPompiers.add(p);
            }
        } catch (SQLException e){ e.printStackTrace(); }
        return lesPompiers;
    }

    public static Pompier getPompierById(Connection cnx, int idPompier){
        Pompier p = null;
        try{
            requeteSql = cnx.prepareStatement("SELECT p.MATRICULE as p_id, p.NOM as p_nom, p.PRENOM as p_prenom, c.ID_CASERNE as c_id, c.NOM as c_nom " +
                                 " FROM POMPIER p INNER JOIN CASERNE c ON p.ID_CASERNE = c.ID_CASERNE " +
                                 " WHERE p.MATRICULE = ?");
            requeteSql.setInt(1, idPompier);
            resultatRequete = requeteSql.executeQuery();
            if (resultatRequete.next()){
                p = new Pompier();
                p.setId(resultatRequete.getInt("p_id"));
                p.setNom(resultatRequete.getString("p_nom"));
                p.setPrenom(resultatRequete.getString("p_prenom"));
                Caserne c = new Caserne();
                c.setId(resultatRequete.getInt("c_id"));
                c.setNom(resultatRequete.getString("c_nom"));
                p.setUneCaserne(c);
            }
        } catch (SQLException e){ e.printStackTrace(); }
        return p;
    }

    public static Pompier addPompier(Connection connection, Pompier p){      
        try {
            requeteSql = connection.prepareStatement("INSERT INTO POMPIER (NOM, PRENOM, ID_CASERNE) VALUES (?,?,?)", 
                                        Statement.RETURN_GENERATED_KEYS );
            requeteSql.setString(1, p.getNom());
            requeteSql.setString(2, p.getPrenom());
            requeteSql.setInt(3, p.getUneCaserne().getId());
            requeteSql.executeUpdate();
            resultatRequete = requeteSql.getGeneratedKeys();
            if (resultatRequete.next()) {
                p.setId(resultatRequete.getInt(1));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return p;    
    }
}