package servlet;

import database.DaoCaserne;
import database.DaoPompier;
import form.FormPompier;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import model.Caserne;
import model.Pompier;

@WebServlet(name = "ServletPompier", urlPatterns = {"/ServletPompier/consulter", "/ServletPompier/lister", "/ServletPompier/ajouter", "/ServletPompier/modifier", "/ServletPompier/supprimer"})
public class ServletPompier extends HttpServlet {

     Connection cnx ;
            
    @Override
    public void init()
    {      
        ServletContext servletContext=getServletContext();
        cnx = (Connection)servletContext.getAttribute("connection");     
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPompier</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPompier at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         String url = request.getRequestURI();  
       
        if(url.equals("/sdisweb/ServletPompier/lister"))
        {              
            ArrayList<Pompier> lesPompiers = DaoPompier.getLesPompiers(cnx);
            request.setAttribute("pLesPompiers", lesPompiers);
            getServletContext().getRequestDispatcher("/vues/pompier/listerPompiers.jsp").forward(request, response);
        }
        
        if(url.equals("/sdisweb/ServletPompier/consulter"))
        {  
            int idPompier = Integer.parseInt((String)request.getParameter("idPompier"));
            Pompier p= DaoPompier.getPompierById(cnx, idPompier);
            request.setAttribute("pPompier", p);
            getServletContext().getRequestDispatcher("/vues/pompier/consulterPompier.jsp").forward(request, response);        
        }
        
        if(url.equals("/sdisweb/ServletPompier/ajouter"))
        {                   
            ArrayList<Caserne> lesCasernes = DaoCaserne.getLesCasernes(cnx);
            request.setAttribute("pLesCasernes", lesCasernes);
            this.getServletContext().getRequestDispatcher("/vues/pompier/ajouterPompier.jsp" ).forward( request, response );
        }
        
        if(url.equals("/sdisweb/ServletPompier/modifier")) {
            int idPompier = Integer.parseInt(request.getParameter("idPompier"));
            Pompier p = DaoPompier.getPompierById(cnx, idPompier);
            request.setAttribute("pPompier", p);
            getServletContext().getRequestDispatcher("/vues/pompier/modifierPompier.jsp").forward(request, response);
        }

        // NOUVEAUTÉ : Gestion de la suppression
        if(url.equals("/sdisweb/ServletPompier/supprimer")) {
            int idPompier = Integer.parseInt(request.getParameter("idPompier"));
            DaoPompier.deletePompier(cnx, idPompier);
            response.sendRedirect(request.getContextPath() + "/ServletPompier/lister");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = request.getRequestURI();
        
        if(url.equals("/sdisweb/ServletPompier/ajouter")) {
            FormPompier form = new FormPompier();
            Pompier p = form.ajouterPompier(request);
            
            request.setAttribute( "form", form );
            request.setAttribute( "pPompier", p );
            
            if (form.getErreurs().isEmpty()){
                Pompier pompierInsere =  DaoPompier.addPompier(cnx, p);
                if (pompierInsere != null ){
                    request.setAttribute( "pPompier", pompierInsere );
                    this.getServletContext().getRequestDispatcher("/vues/pompier/consulterPompier.jsp" ).forward( request, response );
                }
            }
            else { 
                ArrayList<Caserne> lesCasernes = DaoCaserne.getLesCasernes(cnx);
                request.setAttribute("pLesCasernes", lesCasernes);
                this.getServletContext().getRequestDispatcher("/vues/pompier/ajouterPompier.jsp" ).forward( request, response );
            }
        }
        
        else if(url.equals("/sdisweb/ServletPompier/modifier")) {
            Pompier p = new Pompier();
            p.setId(Integer.parseInt(request.getParameter("idPompier")));
            p.setNom(request.getParameter("nom"));
            p.setPrenom(request.getParameter("prenom"));
            p.setDateNaiss(request.getParameter("dateNaiss"));
            
            DaoPompier.updatePompier(cnx, p);
            
            response.sendRedirect(request.getContextPath() + "/ServletPompier/consulter?idPompier=" + p.getId());
        }
    }
}