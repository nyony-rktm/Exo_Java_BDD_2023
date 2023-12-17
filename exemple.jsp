<html>
<head>
<title>Boucles</title>
<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-8">
</head>
<body bgcolor=white>
<h1>Exercices sur les boucles</h1>
<form action="#" method="post">
    <label for="inputValeur">Saisir le nombre d'étoiles : </label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Afficher">
</form>

<%-- Récupération de la valeur saisie par l'utilisateur --%>
<% String valeur = request.getParameter("valeur"); %>
    
<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { %>

<%-- Boucle for pour afficher une ligne d'étoiles --%>
    <%int cpt = Integer.parseInt(valeur); %>
    <p>
    <% for (int i = 1; i <= cpt; i++) { %>
       <%= "*" %>
    <% } %>
    </p>


<%= new String(valeur) %>
<p>La valeur saisie est : <%= valeur %></p>


<% } else { %>
    <p>Aucune valeur saisie.</p>
<% } %>




<%= new String("Hello!") %>

</body>
</html>
