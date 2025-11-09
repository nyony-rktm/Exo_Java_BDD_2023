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
            }
            
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
