<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lista grup</title>
</head>
<body>
<h1>Lista grup</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nazwa</th>
        <th>Akcje</th>
    </tr>
    <c:forEach var="group" items="${groups}">
        <tr>
            <td>${group.id}</td>
            <td>${group.name}</td>
            <td>
                <a href="${pageContext.request.contextPath}/api/groups/${group.id}">Szczegóły</a>
                <a href="${pageContext.request.contextPath}/api/groups/edit/${group.id}">Edytuj</a>
                <a href="${pageContext.request.contextPath}/api/groups/delete/${group.id}">Usuń</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/api/groups/new">Dodaj nową grupę</a>
</body>
</html>