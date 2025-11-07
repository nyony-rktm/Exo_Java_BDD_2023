<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>
<form action="#" method="post">
    <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String chaine = request.getParameter("chaine"); %>
    
    <% if (chaine != null) { %>

    <%-- Division de la chaîne de chiffres séparés par des espaces --%>
    <% String[] tableauDeChiffres = chaine.split("\\s+"); %>
    <p>La tableau contient <%= tableauDeChiffres.length %> valeurs</br>
    Chiffre 1 : <%= Integer.parseInt(tableauDeChiffres[0]) %></br>
    Chiffre 2 : <%= Integer.parseInt(tableauDeChiffres[1]) %></br>
    Chiffre 3 : <%= Integer.parseInt(tableauDeChiffres[2]) %></p>

<%-- Conversion des valeurs --%>
<%
    int[] nombres = new int[tableauDeChiffres.length];
    for (int i = 0; i < tableauDeChiffres.length; i++) {
        nombres[i] = Integer.parseInt(tableauDeChiffres[i]);
    }
%>
    
<h2>Exercice 1 : La carré de la première valeur</h2>
<p>
<%
    int carre = nombres[0] * nombres[0];
    out.println("Le carré de la première valeur est: " + carre);
%>
</p>

<h2>Exercice 2 : La somme des 2 premières valeurs</h2>
<p>
<%
    int sommeDeuxPremiers = nombres[0] + nombres[1];
    out.println("La somme des 2 premières valeurs est: " + sommeDeuxPremiers);
%>
</p>

<h2>Exercice 3 : La somme de toutes les valeurs</h2>
<p>
<%
    int somme = 0;
    for (int nombre : nombres) {somme += nombre;}
    out.println("La somme de toutes les valeurs est: " + somme);
%>
</p>

<h2>Exercice 4 : La valeur maximum</h2>
<p>
<%
    int max = nombres[0];
    for (int i = 1; i < nombres.length; i++) {
        if (nombres[i] > max) {
            max = nombres[i];
        }
    }
    out.println("La valeur maximale est: " + max);
%>
</p>

<h2>Exercice 5 : La valeur minimale</h2>
<p>
<%
    int min = nombres[0];
    for (int i = 1; i < nombres.length; i++) {
        if (nombres[i] < min) {
            min = nombres[i];
        }
    }
    out.println("La valeur minimale est: " + min);
%>
</p>

<h2>Exercice 6 : La valeur le plus proche de 0</h2>
<p>
<%
    int procheZero = nombres[0];
    int minAbs = Math.abs(nombres[0]);

    for (int i = 1; i < nombres.length; i++) {
        int absValue = Math.abs(nombres[i]);
        if (absValue < minAbs) {
            minAbs = absValue;
            procheZero = nombres[i];
        }
    }
    out.println("La valeur le plus proche de 0 est: " + procheZero);            
%>
</p>

<h2>Exercice 7 : La valeur le plus proche de 0 (2° version)</h2>
<p>
    <%
        int procheZero2 = nombres[0];
        int minAbs2 = Math.abs(nombres[0]);

        for (int i = 1; i < nombres.length; i++) {
            int absValue = Math.abs(nombres[i]);
            if (absValue < minAbs2) {
                minAbs2 = absValue;
                procheZero2 = nombres[i];
            } else if (absValue == minAbs2 && nombres[i] > 0 && procheZero2 < 0) {
                procheZero2 = nombres[i];
            }
        }
        out.println("La valeur le plus proche de 0 est: " + procheZero2);
    %>
</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
