<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pompier"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>SDIS 14 - Pompiers</title>
        <style>
            table { border-collapse: collapse; width: 90%; margin: auto; }
            th, td { border: 1px solid black; padding: 10px; text-align: left; }
            th { background-color: #eee; }
            /* Style du bouton Accueil*/
            .btn-accueil {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1.1em;
            color: white;
            background-color: #dc3545; /* Même rouge que le menu */
            text-decoration: none;
            border-radius: 8px;
            box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
            transition: background-color 0.2s;
            }

            .btn-accueil:hover {
            background-color: #c82333;
            }

            /* Conteneur pour le mettre en haut à gauche */
            .header-left {
            text-align: left;
            margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <div class="container"> <div class="header-left">
            <a href="${pageContext.request.contextPath}/" class="btn-accueil">🏠 Accueil</a>
        </div>
        <h1 style="text-align:center;">Liste des pompiers</h1>
        <% ArrayList<Pompier> lesPompiers = (ArrayList<Pompier>)request.getAttribute("pLesPompiers"); %>
        <table>  
            <thead>
                <tr>             
                    <th>Matricule (ID)</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Caserne</th>                
                </tr>
            </thead>
            <tbody>
                <% if(lesPompiers != null) {
                    for (Pompier p : lesPompiers) { %>
                    <tr>
                        <td><%= p.getId() %></td>
                        <td>
                            <a href="../ServletPompier/consulter?idPompier=<%= p.getId() %>">
                                <%= p.getNom() %>
                            </a>
                        </td>
                        <td><%= p.getPrenom() %></td>
                        <td>
                        <% if (p.getUneCaserne() != null) { %>
                        <a href="../ServletCaserne/consulter?idCaserne=<%= p.getUneCaserne().getId() %>">
                        <%= p.getUneCaserne().getNom() %>
                        </a>
                        <% } else { %>
                        N/A
                        <% } %>
                        </td>
                    </tr>
                <% } } %>
            </tbody>
        </table>
    </body>
</html>