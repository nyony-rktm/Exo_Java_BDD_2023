<html>
<head>
<title>Sample Application JSP Page</title>
</head>
<meta charset="utf-8">
<body bgcolor=white>

<form action="#" method="post">
    <label for="inputValeur">Combien d'étoiles ?</label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Afficher">
</form>

<%-- Récupération de la valeur --%>
<% String valeur = request.getParameter("valeur"); %>
    
<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { %>

<%-- Boucle for pour afficher une séquence de nombres --%>
    <% for (int i = 1; i <= 5; i++) { %>
        <p><%= "*" %>
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
