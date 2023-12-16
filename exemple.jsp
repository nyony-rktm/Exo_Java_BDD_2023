<html>
<head>
<title>Sample Application JSP Page</title>
</head>
<body bgcolor=white>

<form action="#" method="post">
    <label for="inputValeur">Entrez une valeur :</label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Envoyer">
</form>

<%-- Récupération de la valeur --%>
<% String valeur = request.getParameter("valeur"); %>
    
<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { %>
    <p>La valeur saisie est : <%= valeur %></p>
<% } else { %>
    <p>Aucune valeur saisie.</p>
<% } %>




<%= new String("Hello!") %>

</body>
</html>
