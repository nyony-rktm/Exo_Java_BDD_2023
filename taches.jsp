<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%!
    public class Task {
        private String nom;
        private String description;
        private String dateEcheance;
        private boolean tacheFinie;


        public Task(String nom, String description, String dateEcheance) {
            this.nom = nom;
            this.description = description;
            this.dateEcheance = dateEcheance;
            
            this.tacheFinie = false; // Statut par défaut

        //Getters
        public String getNom() { return nom; }
        public String getDescription() { return description; }
        public String getDate() { return dateEcheance; }

        // Méthodes de gestion des statuts
        public boolean isTacheFinie() { return tacheFinie; }
        public void changeStatutTache() { 
            tacheFinie = !tacheFinie;
        }
    }
%>

<%
    // Liste des tâches
    List<Task> taches = (List<Task>) application.getAttribute("taches");
    if (taches == null) {
        taches = new ArrayList<>();
        application.setAttribute("taches", taches);
    }

    // Paramètres envoyés par la page
    String action = request.getParameter("action"); 
    String indexStr = request.getParameter("index");
    int index = -1;

    if (indexStr != null) {
        try { 
            index = Integer.parseInt(indexStr);
        } catch (NumberFormatException e) {}
    }

    // POST = formulaire rempli et soumis
    String methodeRequete = request.getMethod();
    if (methodeRequete.equals("POST")) {
        String nom = request.getParameter("Nom");
        String description = request.getParameter("Description");
        String date = request.getParameter("Date");

        if (nom != null && !nom.trim().isEmpty()) {
            // Création d'un nouvel objet Task
            Task nouvelleTache = new Task(nom.trim(), description.trim(), date);
            
            // Ajout de la nouvelle tâche à la liste des tâches
            taches.add(nouvelleTache);
            
            // Mise à jour de la liste des tâches
            application.setAttribute("taches", taches);
            
            // Boucle dans la page pour afficher la nouvelle liste
            response.sendRedirect("taches.jsp");
            return;
        }
    }

    // Si une action (supprimer ou terminer) est demandée
    if (action != null && index >= 0 && index < taches.size()) {
        // Gestion de statut de la tâche
        if ("toggle".equals(action)) {
            taches.get(index).changeStatutTache();
        // Suppression de la tâche
        } else if ("delete".equals(action)) {
            taches.remove(index);
        }        

        application.setAttribute("taches", taches);        
        response.sendRedirect("taches.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html><head>
    <meta charset="UTF-8">
    <title>Gestionnaire de Tâches</title>
</head>
<body>

    <h1>Gestionnaire de Tâches</h1>
    <p><a href="TP.jsp">⬅ Retour à l'accueil</a></p>

    <h2>Ajouter une tâche</h2>
    <form method="post" action="taches.jsp">
        Nom : <input type="text" name="Nom" required><br>
        Description : <input type="text" name="Description"><br>
        Date d’échéance : <input type="date" name="Date" required><br>
        <button type="submit">Ajouter la tâche</button>
    </form>    <h2>Liste des tâches</h2>
    <%
        // Vérifie si la liste des tâches est vide
        if (taches.isEmpty()) {
    %>
        <p>Aucune tâche pour le moment.</p>
    <%
        } else {
            for (int i = 0; i < taches.size(); i++) {
                Task tache = taches.get(i);
                
                // Statut de la tâche (terminée ou en cours)
                String statut = tache.isTacheFinie() ? "Terminée" : "En cours";
                                // Détermine le texte du lien pour basculer le statut de la tâche
                String texteToggle = tache.isTacheFinie() ? "Rétablir" : "Terminer";
    %>
        <div>
            <strong><%= tache.getNom() %></strong> - <%= tache.getDescription() %> - <%= tache.getDate() %> - <%= statut %><br>
            
            <%-- Bouton pour basculer le statut de la tâche (terminer ou rétablir) --%>
            <input type="button" value="<%= texteToggle %>" onclick="location.href='taches.jsp?action=toggle&index=<%= i %>'">
            
            <%-- Bouton pour supprimer la tâche --%>
            <input type="button" value="Supprimer" onclick="location.href='taches.jsp?action=delete&index=<%= i %>'">
        </div>
        <hr>
    <%
            }
        }
    %>

</body>
</html>
