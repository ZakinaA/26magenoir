<%-- 
    Document   : consulterGrade
    Created on : 30 avr. 2026, 09:58:07
    Author     : ts1sio
--%>

<%@page import="model.Grade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Détail des grades</title>
    <style>
        .container { width: 50%; margin: 20px auto; font-family: Arial, sans-serif; }
        .card { border: 1px solid #ccc; padding: 20px; border-radius: 8px; box-shadow: 2px 2px 12px #eee; }
        .label { font-weight: bold; color: #555; margin-top: 10px; }
        .value { margin-bottom: 15px; font-size: 1.1em; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Détail des grades</h1>
        <%
            Grade g = (Grade)request.getAttribute("gGrade");
            if (g != null) {
        %>
            <div class="card">
                <div class="label">Id :</div>
                <div class="value"><%= g.getId_grade() %></div>

                <div class="label">Libelle :</div>
                <div class="value"><%= g.getLibelle() %></div>

                <div class="value">
                    <%= (g.getGrade() != null && g.getGrade().getCategorieGrade() != null && g.getGrade().getCategorieGrade().getLibelle() != null) ? g.getGrade().getCategorieGrade().getLibelle() : "Aucune catégorie" %>
                </div>
                
            </div>
        <% } else { %>
            <p style="color:red;">Erreur : Impossible de trouver ce grade.</p>
        <% } %>
        <br>
        <a href="../ServletPompier/modifier?idPompier=<%= g.getId_grade() %>" style="display:inline-block; padding:10px; background-color:#ffc107; color:black; text-decoration:none; border-radius:5px;">✏️ Modifier</a>
        <br>
        <a href="../ServletPompier/lister">← Retour à la liste</a>
    </div>
</body>
</html>
