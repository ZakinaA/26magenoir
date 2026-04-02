<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .header-nav {
        background-color: #333; 
        padding: 15px 20px; 
        border-radius: 8px;
        margin-bottom: 30px; 
        width: 100%; /* Prend toute la largeur de son conteneur */
        box-shadow: 0px 2px 5px rgba(0,0,0,0.2);
        display: flex; 
        align-items: center; 
        min-height: 45px; 
        box-sizing: border-box;
    }
    .header-title { color: white; font-size: 1.2em; font-weight: bold; margin: 0; }
    .btn-menu {
        display: inline-block; padding: 10px 20px; font-size: 1.1em;
        color: white; background-color: #dc3545; text-decoration: none;
        border-radius: 5px; font-weight: bold; transition: background-color 0.2s;
    }
    .btn-menu:hover { background-color: #c82333; }
</style>

<div class="header-nav">
    <% 
        String hideBtn = request.getParameter("hideHomeBtn");
        if (!"true".equals(hideBtn)) { 
    %>
        <a href="${pageContext.request.contextPath}/" class="btn-menu">🏠 Accueil</a>
    <% } else { %>
        <span class="header-title">SDIS 14 - Application de gestion</span>
    <% } %>
</div>