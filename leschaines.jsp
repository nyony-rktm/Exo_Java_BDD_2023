<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les chaines</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les chaines de charactères</h1>
<form action="#" method="post">
    <p>Saisir une chaine (du texte) : <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String chaine = request.getParameter("chaine"); %>

    <%-- Vérification de la condition entre les deux valeurs --%>
    <% if (chaine != null) { %>

  <%-- Obtention de la longueur de la chaîne --%>
    <% int longueurChaine = Chaine.length(); %>
    
    <p>La longueur de la chaîne "<%= Chaine %>" est : <%= longueurChaine %></p>

   
    
<h2>Exercice 1 : Comparaison 1</h2>
<p>Ecrire un programme qui demande à l'utilisateur de saisir 3 valeurs (des chiffres),</br>
A, B et C et dites nous si la valeur de C est comprise entre A et B.</br>
Exemple :</br>
A = 10</br>
B = 20</br>
C = 15</br>
Oui C est compris entre A et B</p>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<p>Écrivez un programme pour vérifier si un nombre est pair ou impair en utilisant une structure if</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
