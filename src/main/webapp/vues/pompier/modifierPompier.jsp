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
        .label-custom { display: block; font-weight: bold; }
        input[type="text"], input[type="date"] { width: 100%; padding: 8px; margin-top: 5px; }
        .btn-submit { padding: 10px 20px; background-color: #28a745; color: white; border: none; border-radius: 5px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="container">
        <jsp:include page="/vues/inclusions/header.jsp" />
        
        <h1>Modifier le Pompier</h1>
        <% Pompier p = (Pompier)request.getAttribute("pPompier"); %>
        
        <!-- NOUVEAUTÉ : Ajout du onsubmit JS -->
        <form action="../ServletPompier/modifier" method="POST" onsubmit="return confirm('Confirmez-vous l\'enregistrement de ces modifications ?');">
            <input type="hidden" name="idPompier" value="<%= p.getId() %>">
            
            <div class="form-group">
                <label class="label-custom">Nom :</label>
                <input type="text" name="nom" value="<%= (p.getNom() != null) ? p.getNom() : "" %>" required>
            </div>
            
            <div class="form-group">
                <label class="label-custom">Prénom :</label>
                <input type="text" name="prenom" value="<%= (p.getPrenom() != null) ? p.getPrenom() : "" %>" required>
            </div>
            
            <div class="form-group">
                <label class="label-custom">Date de Naissance :</label>
                <input type="date" name="dateNaiss" value="<%= (p.getDateNaiss() != null) ? p.getDateNaiss() : "" %>">
            </div>
            
            <button type="submit" class="btn-submit">💾 Enregistrer les modifications</button>
            <a href="../ServletPompier/consulter?idPompier=<%= p.getId() %>" style="margin-left: 10px; color: red; text-decoration: none; font-weight: bold;">Annuler</a>
        </form>

        <jsp:include page="/vues/inclusions/footer.jsp" />
    </div>
</body>
</html>