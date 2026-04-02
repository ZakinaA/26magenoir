
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>SDIS 14 - Accueil</title>
        <style>
            body { font-family: Arial, sans-serif; background-color: #f8f9fa; margin: 0; padding: 20px; }
            .container { width: 80%; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0px 4px 10px rgba(0,0,0,0.1); }
            .menu { display: flex; flex-direction: column; align-items: center; gap: 20px; margin-top: 40px; margin-bottom: 40px; }
            .btn-accueil-gros {
                display: inline-block; padding: 15px 30px; font-size: 1.2em;
                color: white; background-color: #dc3545; text-decoration: none;
                border-radius: 8px; width: 250px; text-align: center;
                box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
            }
            .btn-accueil-gros:hover { background-color: #c82333; }
            h1 { text-align: center; color: #333; }
        </style>
    </head>
    <body>
        
        <jsp:include page="vues/inclusions/header.jsp">
            <jsp:param name="hideHomeBtn" value="true" />
        </jsp:include>

        <div class="container">
            <h1>Menu principal</h1>

            <div class="menu">
                <a href="ServletPompier/lister" class="btn-accueil-gros"> Liste des Pompiers</a>
                <a href="ServletCaserne/lister" class="btn-accueil-gros"> Liste des Casernes</a>
            </div>
        </div>
            
        <jsp:include page="vues/inclusions/footer.jsp" />
        
    </body>
</html>