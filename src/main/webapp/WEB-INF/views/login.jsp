<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
</head>
<body>
<%@include file="/WEB-INF/views/header.jspf" %>

<div class="container">
    <header>Login</header>
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
                    <div>
                        <form method="post">
                            <div class="form-group mt-6">E-mail:
                                    <%--<label for="mailId" style="font-weight: bold">Email address</label>--%>
                                <input type="email" name="mail" class="form-control" id="mailId">
                            </div>
                            <div class="form-group">Password:
                                    <%-- <label for="passwordId" style="font-weight: bold">Password</label>--%>
                                <input type="password" name="password" class="form-control" id="passwordId">
                            </div>
                            <button type="submit" style="font-weight: bold" class="btn btn-primary">Log in
                            </button>
                        </form>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="align-content-md-center">You are already logged.</div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>
