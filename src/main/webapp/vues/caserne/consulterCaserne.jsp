<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Caserne"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Détails de la Caserne</title>
        <style>
            body { font-family: Arial, sans-serif; }
            .info-box { border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9; margin-top: 20px;}
            .btn-menu { display: inline-block; padding: 10px 20px; color: white; text-decoration: none; border-radius: 5px; margin-right: 10px; font-weight: bold;}
            .btn-modifier { background-color: #ffc107; color: black; }
            .btn-supprimer { background-color: #dc3545; }
            .btn-retour { background-color: #6c757d; }
            .btn-engins { background-color: #17a2b8; }
        </style>
    </head>
    <body>
        <div class="container">
            <%-- Inclusion du Header --%>
            <jsp:include page="/vues/inclusions/header.jsp" />

            <% Caserne c = (Caserne) request.getAttribute("pCaserne"); %>

            <h1>Détails de la Caserne</h1>

            <% if (c != null) { %>
                <div class="info-box">
                    <p><strong>ID :</strong> <%= c.getId() %></p>
                    <p><strong>Nom :</strong> <%= c.getNom() %></p>
                    <p><strong>Rue :</strong> <%= c.getRue() %></p>
                    <p><strong>Code Postal :</strong> <%= c.getCopos() %></p>
                    <p><strong>Ville :</strong> <%= c.getVille() %></p>
                </div>

                <div style="margin-top: 20px;">
                    <a href="../ServletCaserne/engins?idCaserne=<%= c.getId() %>" class="btn-menu btn-engins">Voir les engins</a>
                    
                    <a href="../ServletCaserne/modifier?idCaserne=<%= c.getId() %>" class="btn-menu btn-modifier">Modifier</a>
                    
                    <!-- NOUVEAUTÉ : Bouton Supprimer avec confirmation JS -->
                    <a href="../ServletCaserne/supprimer?idCaserne=<%= c.getId() %>" class="btn-menu btn-supprimer" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette caserne ? Cette action est irréversible.');">Supprimer</a>

                    <a href="../ServletCaserne/lister" class="btn-menu btn-retour">Retour à la liste</a>
                </div>
            <% } else { %>
                <p>Caserne introuvable.</p>
                <a href="../ServletCaserne/lister" class="btn-menu btn-retour">Retour à la liste</a>
            <% } %>

            <%-- Inclusion du Footer --%>
            <jsp:include page="/vues/inclusions/footer.jsp" />
        </div>
    </body>
</html>