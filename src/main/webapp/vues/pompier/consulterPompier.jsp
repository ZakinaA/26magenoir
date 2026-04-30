<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pompier"%>
<!DOCTYPE html>
<html>
<head>
    <title>Détail Pompier</title>
    <style>
        .container { width: 50%; margin: 20px auto; font-family: Arial, sans-serif; }
        .card { border: 1px solid #ccc; padding: 20px; border-radius: 8px; box-shadow: 2px 2px 12px #eee; }
        .label { font-weight: bold; color: #555; margin-top: 10px; }
        .value { margin-bottom: 15px; font-size: 1.1em; }
    </style>
</head>
<body>
    <div class="container">
        <jsp:include page="/vues/inclusions/header.jsp" />
        
        <h1>Détail du Pompier</h1>
        <%
            Pompier p = (Pompier)request.getAttribute("pPompier");
            if (p != null) {
        %>
            <div class="card">
                <div class="label">Matricule :</div>
                <div class="value"><%= p.getId() %></div>

                <div class="label">Nom :</div>
                <div class="value"><%= p.getNom() %></div>

                <div class="label">Prénom :</div>
                <div class="value"><%= p.getPrenom() %></div>

                <div class="label">Date de Naissance :</div>
                <div class="value"><%= (p.getDateNaiss() != null) ? p.getDateNaiss() : "Non renseignée" %></div>

                <div class="label">Grade :</div>
                <div class="value"><%= (p.getGrade() != null && p.getGrade().getLibelle() != null) ? p.getGrade().getLibelle() : "Aucun grade" %></div>
                
                <div class="label">Catégorie du Grade :</div>
                <div class="value">
                    <%= (p.getGrade() != null && p.getGrade().getCategorieGrade() != null && p.getGrade().getCategorieGrade().getLibelle() != null) ? p.getGrade().getCategorieGrade().getLibelle() : "Aucune catégorie" %>
                </div>

                <div class="label">Profession :</div>
                <div class="value"><%= (p.getProfession() != null && p.getProfession().getLibelle() != null) ? p.getProfession().getLibelle() : "Aucune profession" %></div>

                <div class="label">Caserne d'affectation :</div>
                <div class="value"><%= (p.getUneCaserne() != null && p.getUneCaserne().getNom() != null) ? p.getUneCaserne().getNom() : "Non affecté" %></div>
                
            </div>
            
            <div style="margin-top: 20px; margin-bottom: 20px;">
                <a href="../ServletPompier/modifier?idPompier=<%= p.getId() %>" style="display:inline-block; padding:10px 15px; background-color:#ffc107; color:black; text-decoration:none; border-radius:5px; font-weight: bold;">✏️ Modifier</a>
                
                <!-- NOUVEAUTÉ : Bouton Supprimer avec popup JS -->
                <a href="../ServletPompier/supprimer?idPompier=<%= p.getId() %>" style="display:inline-block; padding:10px 15px; background-color:#dc3545; color:white; text-decoration:none; border-radius:5px; font-weight: bold; margin-left: 10px;" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce pompier ?');">🗑️ Supprimer</a>
            </div>
        <% } else { %>
            <p style="color:red;">Erreur : Impossible de trouver ce pompier.</p>
        <% } %>
        
        <a href="../ServletPompier/lister" style="text-decoration:none; color: #007bff; font-weight: bold;">← Retour à la liste</a>
        
        <div style="margin-top: 40px;">
            <jsp:include page="/vues/inclusions/footer.jsp" />
        </div>
    </div>
</body>
</html>