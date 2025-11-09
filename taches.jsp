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
