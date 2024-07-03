<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Szczegóły Drużyny</title>
</head>
<body>
<h1>Szczegóły Drużyny</h1>
<p>ID: ${team.id}</p>
<p>Nazwa: ${team.name}</p>
<p>Punkty: ${team.points}</p>
<a href="${pageContext.request.contextPath}/api/matches/team/${team.id}">Zobacz mecze drużyny</a>
<a href="${pageContext.request.contextPath}/teams">Powrót do Listy</a>
</body>
</html>