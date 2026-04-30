<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Caserne"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Modifier la Caserne</title>
        <style>
            body { font-family: Arial, sans-serif; }
            .form-container { border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9; margin-top: 20px;}
            .form-group { margin-bottom: 15px; }
            .form-group label { display: block; font-weight: bold; margin-bottom: 5px; }
            .form-group input { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;}
            .btn-submit { background-color: #28a745; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; font-weight: bold; font-size: 16px;}
            .btn-submit:hover { background-color: #218838; }
            .btn-retour { display: inline-block; padding: 10px 20px; background-color: #6c757d; color: white; text-decoration: none; border-radius: 5px; margin-left: 10px; font-weight: bold;}
        </style>
    </head>
    <body>
        <div class="container">
            <%-- Inclusion du Header --%>
            <jsp:include page="/vues/inclusions/header.jsp" />

            <% Caserne c = (Caserne) request.getAttribute("pCaserne"); %>

            <h1>Modifier la Caserne : <%= c != null ? c.getNom() : "" %></h1>

            <% if (c != null) { %>
                <div class="form-container">
                    <!-- NOUVEAUTÉ : onsubmit avec confirmation JS sur la balise form -->
                    <form action="../ServletCaserne/modifier" method="POST" onsubmit="return confirm('Confirmez-vous l\'enregistrement de ces modifications ?');">
                        
                        <input type="hidden" name="idCaserne" value="<%= c.getId() %>" />
                        
                        <div class="form-group">
                            <label>Nom :</label>
                            <input type="text" name="nom" value="<%= c.getNom() %>" required />
                        </div>
                        
                        <div class="form-group">
                            <label>Rue :</label>
                            <input type="text" name="rue" value="<%= c.getRue() %>" required />
                        </div>
                        
                        <div class="form-group">
                            <label>Code Postal :</label>
                            <input type="text" name="copos" value="<%= c.getCopos() %>" required />
                        </div>
                        
                        <div class="form-group">
                            <label>Ville :</label>
                            <input type="text" name="ville" value="<%= c.getVille() %>" required />
                        </div>
                        
                        <div style="margin-top: 20px;">
                            <input type="submit" value="Enregistrer les modifications" class="btn-submit">
                            <a href="../ServletCaserne/consulter?idCaserne=<%= c.getId() %>" class="btn-retour">Annuler</a>
                        </div>
                    </form>
                </div>
            <% } else { %>
                <p>Caserne introuvable.</p>
            <% } %>

            <%-- Inclusion du Footer --%>
            <jsp:include page="/vues/inclusions/footer.jsp" />
        </div>
    </body>
</html>