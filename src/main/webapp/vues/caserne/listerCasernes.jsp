<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Caserne"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>SDIS 14 - Liste des Casernes</title>
        <style>
            body { font-family: Arial, sans-serif; }
            table { border-collapse: collapse; width: 70%; margin: auto; }
            th, td { border: 1px solid black; padding: 10px; text-align: left; }
            th { background-color: #eee; }
            
            /* Bouton Accueil */
            .btn-accueil {
                display: inline-block; padding: 10px 20px; font-size: 1.1em;
                color: white; background-color: #dc3545; text-decoration: none;
                border-radius: 8px; box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
            }
            .btn-accueil:hover { background-color: #c82333; }
            .header-left { text-align: left; margin: 20px; }
        </style>
    </head>
    <body>
        <div class="header-left">
            <a href="${pageContext.request.contextPath}/" class="btn-accueil">🏠 Accueil</a>
        </div>
        
        <h1 style="text-align:center;">Liste des Casernes</h1>
        
        <% ArrayList<Caserne> lesCasernes = (ArrayList<Caserne>)request.getAttribute("pLesCasernes"); %>
        
        <table>
            <thead>
                <tr>
                    <th>ID Caserne</th>
                    <th>Nom</th>
                    <th>Ville</th>
                </tr>
            </thead>
            <tbody>
                <% if(lesCasernes != null && !lesCasernes.isEmpty()) {
                    for (Caserne c : lesCasernes) { %>
                    <tr>
                        <td><%= c.getId() %></td>
                        <td>
                            <a href="../ServletCaserne/consulter?idCaserne=<%= c.getId() %>">
                                <%= c.getNom() %>
                            </a>
                        </td>
                        <td><%= (c.getVille() != null) ? c.getVille() : "N/A" %></td>
                    </tr>
                <% } } else { %>
                    <tr>
                        <td colspan="3" style="text-align:center; color:red;">Aucune caserne trouvée dans la base de données.</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>