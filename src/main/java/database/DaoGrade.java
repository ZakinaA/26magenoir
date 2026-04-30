/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;
/**
 *
 * @author ts1sio
 */
import java.util.ArrayList;
import model.CategorieGrade;
import model.Grade;
import java.sql.*;
        

public class DaoGrade {
    
    java.sql.Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;
    
    public static ArrayList<Grade> getLesGrades(Connection cnx){
        ArrayList<Grade> lesGrades= new ArrayList<Grade>();
        try{
            requeteSql = cnx.prepareStatement("select g.id_grade as id_grade, g.libelle as libelle, cp.id_categorieGrade as id_categorieGrade" +
                " from Grade g left join CategorieGrade cp on g.id_categorieGrade = cp.id_categorieGrade");
            resultatRequete = requeteSql.executeQuery();
            
            while (resultatRequete.next()){
                Grade g = new Grade();
                g.setId_grade(resultatRequete.getInt("id_grade"));
                g.setLibelle(resultatRequete.getString("libelle"));
                CategorieGrade cg = new CategorieGrade();
                cg.setId_categoriegrade(resultatRequete.getInt("id_categorieGrade"));
                g.setCategorieGrade(cg);
                lesGrades.add(g);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return lesGrades;
    }
}
