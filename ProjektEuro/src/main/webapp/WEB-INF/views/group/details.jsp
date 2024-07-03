<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Szczegóły grupy</title>
</head>
<body>
<h1>Szczegóły grupy</h1>
<p>ID: ${group.id}</p>
<p>Nazwa: ${group.name}</p>
<a href="${pageContext.request.contextPath}/api/groups">Powrót do listy</a>
</body>
</html>
