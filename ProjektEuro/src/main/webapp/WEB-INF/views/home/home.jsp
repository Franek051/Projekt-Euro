<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Navigation Menu</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        a {
            text-decoration: none;
            color: #337ab7;
        }
        a:hover {
            color: #23527c;
        }
        .header {
            background-color: #337ab7;
            color: #ffffff;
            font-size: 24px;
            font-weight: bold;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="header">Euro 2024</div>
<table>
    <tr>
        <td><a href="<c:url value='/login'/>">Logowanie</a></td>
        <td><a href="<c:url value="/create-user"/>">Rejestracja</a></td>
        <td><a href="<c:url value="/home/about"/>">O Euro</a></td>
        <td> <a href="<c:url value='/api/teams'/>">Symuluj Mecze</a></td>
    </tr>
</table>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</body>
</html>