/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
/**
 *
 * @author ts1sio
 */

public class Grade {
    private int id_grade;
    private String libelle;
    private CategorieGrade id_categorieGrade ;

    public Grade() {}
    
    public int getId_grade() { 
        return id_grade;
    }
    public void setId_grade(int id_grade) { 
        this.id_grade = id_grade; 
    }
    public String getLibelle() { 
        return libelle;
    }
    public void setLibelle(String libelle) {
        this.libelle = libelle; 
    }

    public CategorieGrade getId_CategorieGrade() {
        return id_categorieGrade;
    }

    public void setCategorieGrade(CategorieGrade id_categorieGrade) {
        this.id_categorieGrade = id_categorieGrade;
    }
    
}

