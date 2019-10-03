<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <title>Title</title>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
</head>
<body>
<%@include file="/WEB-INF/views/header.jspf" %>
<div class="container">
    <header>User List</header>
    <div class="card">
        <div class="card-body">
            <a href="/home" class="btn btn-primary">Back</a>
            <%--  <a href="/user/add" class="btn btn-primary">Add User</a>--%>
        </div>
    </div>



    <div class="card mt-4" class="form-group" style="text-align: center;" style="margin: 0 auto">
        <div class="card-body">
            <c:choose>
                <c:when test="${empty cookie.get('user')}">
                    <div class="text-center">You need to log in to see other users.</div>
                    <a href="/user/login" class="btn btn-primary">Log in</a>
                    <div>Don't have account?Go register</div>
                    <a href="/user/register" class="btn btn-warning">Register</a>
                </c:when>
                <c:otherwise>
                    <table class="table table-hover">
                        <tr>
                            <th>Nick</th>
                                <%--<th>Password</th>--%>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>E-mail</th>
                            <th>Age</th>
                        </tr>
                        <c:forEach items="${users}" var="users">
                            <tr>
                                <td>${users.nick}</td>
                                    <%--<td>${users.password}</td>--%>
                                <td>${users.firstName}</td>
                                <td>${users.lastName}</td>
                                <td>${users.mail}</td>
                                <td>${users.age}</td>

                                    <%-- <td>
                                         <a href="/user/update/${users.id}">Edit</a>
                                         <a href="/user/delete/${users.id}">Delete</a>
                                     </td>--%>
                            </tr>
                        </c:forEach>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
</body>
</html>
