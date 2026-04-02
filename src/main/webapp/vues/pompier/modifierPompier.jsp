<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pompier"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier Pompier</title>
    <style>
        .container { width: 50%; margin: 20px auto; font-family: Arial; }
        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; }
        input[type="text"], input[type="date"] { width: 100%; padding: 8px; margin-top: 5px; }
        .btn-submit { padding: 10px 20px; background-color: #28a745; color: white; border: none; border-radius: 5px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Modifier le Pompier</h1>
        <% Pompier p = (Pompier)request.getAttribute("pPompier"); %>
        
        <form action="../ServletPompier/modifier" method="POST">
            <input type="hidden" name="idPompier" value="<%= p.getId() %>">
            
            <div class="form-group">
                <label>Nom :</label>
                <input type="text" name="nom" value="<%= (p.getNom() != null) ? p.getNom() : "" %>" required>
            </div>
            
            <div class="form-group">
                <label>Prénom :</label>
                <input type="text" name="prenom" value="<%= (p.getPrenom() != null) ? p.getPrenom() : "" %>" required>
            </div>
            
            <div class="form-group">
                <label>Date de Naissance :</label>
                <input type="date" name="dateNaiss" value="<%= (p.getDateNaiss() != null) ? p.getDateNaiss() : "" %>">
            </div>
            
            <button type="submit" class="btn-submit">💾 Enregistrer les modifications</button>
            <a href="../ServletPompier/consulter?idPompier=<%= p.getId() %>" style="margin-left: 10px; color: red;">Annuler</a>
        </form>
    </div>
</body>
</html>