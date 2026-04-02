<%-- 
    Document   : listerEnginsCaserne
    Created on : 2 avr. 2026, 11:13:01
    Author     : ts1sio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Engin"%>
<%@page import="model.Caserne"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste des engins</title>
        </head>
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
    <body>
        <div class="container"> <div class="header-left">
            <jsp:include page="/vues/inclusions/header.jsp" />
        </div>
        <div class="container">
            <%
                // Récupération des données envoyées par le Servlet
                ArrayList<Engin> lesEngins = (ArrayList<Engin>) request.getAttribute("pLesEngins");
                Caserne laCaserne = (Caserne) request.getAttribute("pLaCaserne");
            %>
            
            <h1>Engins affectés à la caserne : <%= laCaserne != null ? laCaserne.getNom() : "" %></h1>
            
            <% if(lesEngins != null && !lesEngins.isEmpty()) { %>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Libellé</th>
                            <th>Numéro d'ordre</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(Engin e : lesEngins) { %>
                            <tr>
                                <td><%= e.getId() %></td>
                                <td><%= e.getLibelle() %></td>
                                <td><%= e.getNumeroOrdre() %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <p>Aucun engin affecté à cette caserne pour le moment.</p>
            <% } %>

            <a href="../ServletCaserne/lister">Retour Liste Casernes</a>
        </div>
            <div class="container"> <div class="header-left">
            <jsp:include page="/vues/inclusions/footer.jsp" />
        </div>
    </body>
</html>