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
            
        </style>
    </head>
    <body>
        <div class="header-left">
            <jsp:include page="/vues/inclusions/header.jsp" />
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
        <div class="header-left">
            <jsp:include page="/vues/inclusions/footer.jsp" />
        </div>
    </body>
</html>