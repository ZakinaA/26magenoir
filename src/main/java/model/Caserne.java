package model;

public class Caserne {
    private int id;
    private String nom;
    private String rue;
    private String copos;
    private String ville;

    public Caserne() {}
    
    public Caserne(int id) {}

    public int getId() {
        return id; 
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNom() {
        return nom; 
    }
    public void setNom(String nom) { 
        this.nom = nom;
    }
    public String getRue() { 
        return rue;
    }
    public void setRue(String rue) {
        this.rue = rue;
    }
    public String getCopos() {
        return copos;
    }
    public void setCopos(String copos) {
        this.copos = copos;
    }
    public String getVille() {
        return ville;
    }
    public void setVille(String ville) {
        this.ville = ville;
    }
}