/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Engin {
    private int id;
    private String libelle;
    private int numeroOrdre;
    // On peut inclure l'objet Caserne complet si besoin, mais pour l'instant l'ID suffit ou juste le lien logique
    private Caserne caserne; 

    public Engin() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getLibelle() { return libelle; }
    public void setLibelle(String libelle) { this.libelle = libelle; }

    public int getNumeroOrdre() { return numeroOrdre; }
    public void setNumeroOrdre(int numeroOrdre) { this.numeroOrdre = numeroOrdre; }

    public Caserne getCaserne() { return caserne; }
    public void setCaserne(Caserne caserne) { this.caserne = caserne; }
}