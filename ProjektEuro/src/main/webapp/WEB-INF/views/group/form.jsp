<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formularz grupy</title>
</head>
<body>
<h1><c:choose>
    <c:when test="${group.id != null}">Edytuj grupę</c:when>
    <c:otherwise>Dodaj nową grupę</c:otherwise>
</c:choose></h1>
<form action="${pageContext.request.contextPath}/api/groups/save" method="post">
    <input type="hidden" name="id" value="${group.id}">
    <div>
        <label for="name">Nazwa grupy:</label>
        <input type="text" id="name" name="name" value="${group.name}">
    </div>
    <div>
        <button type="submit">Zapisz</button>
    </div>
</form>
<a href="${pageContext.request.contextPath}/api/groups">Powrót do listy</a>
</body>
</html>