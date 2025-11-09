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
        }

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
    <p><a href="index.html">Retour à l'accueil</a></p>

    <hr size="2" noshade>

    <h2>Ajouter une tâche</h2>
    <form method="post" action="taches.jsp">
        <fieldset>
            <legend>Nouvelle Tâche</legend>
            <label for="nom">Nom :</label><br>
            <input type="text" id="nom" name="Nom" size="50" required><br><br>
            
            <label for="description">Description :</label><br>
            <textarea id="description" name="Description" rows="3" cols="50"></textarea><br><br>
            
            <label for="date">Date d’échéance :</label><br>
            <input type="date" id="date" name="Date" required><br><br>
            
            <button type="submit">Ajouter la tâche</button>
        </fieldset>
    </form>

<hr size="2" noshade>

<h2>Liste des tâches</h2>
    <%
        // Vérifie si la liste des tâches est vide
        if (taches.isEmpty()) {
    %>
        <p><i>Aucune tâche pour le moment.</i></p>
    <%
        } else {
    %>
        <ol>
    <%
            for (int i = 0; i < taches.size(); i++) {
                Task tache = taches.get(i);
                
                // Statut de la tâche (terminée ou en cours)
                String statut = tache.isTacheFinie() ? "Terminée" : "En cours";
                                // Détermine le texte du lien pour basculer le statut de la tâche
                String texteToggle = tache.isTacheFinie() ? "Rétablir" : "Terminer";
    %>
        <li>
                <h3>
                    <strong><%= tache.getNom() %></strong>
                    <br>
                    <small>Description: <%= tache.getDescription() %></small><br>
                    <small>Date d’échéance: <%= tache.getDate() %></small><br>
                    <small><i>Statut: <%= statut %></i></small>
                </h3>
            
            <%-- Bouton pour basculer le statut de la tâche (terminer ou rétablir) --%>
            <input type="button" value="<%= texteToggle %>" onclick="location.href='taches.jsp?action=toggle&index=<%= i %>'">
            
            <%-- Bouton pour supprimer la tâche --%>
            <input type="button" value="Supprimer" onclick="location.href='taches.jsp?action=delete&index=<%= i %>'">
        </li>
        <br>
    <%
            }
    %>
        <ol>
    <%
        }
    %>
<hr size="2" noshade>

</body>
</html>
