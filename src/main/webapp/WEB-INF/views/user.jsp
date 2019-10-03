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
    <header><%--${empty user.id ? 'Register' : 'Edit User'}--%>Register</header>
    <div class="card">
        <div class="card-body">
            <a href="/home" class="btn btn-primary">Back</a>
        </div>
    </div>


    <div class="card mt-4" class="form-group" style="text-align: center;" style="margin: 0 auto">
        <div class="card-body">
            <c:choose>
                <c:when test="${empty cookie.get('user')}">
                    <form:form method="post" modelAttribute="user">
                        <form:hidden path="id" value="${user.id}"/>
                        <div>
                            <label>Nick:
                                <form:input path="nick" class="form-control" />
                            </label>
                            <form:errors path="nick" element="div" cssClass="error"/>
                        </div>
                        <div>
                            <label>Password:
                                <form:password path="password" class="form-control"/>
                            </label>
                            <form:errors path="password" element="div" cssClass="error"/>
                        </div>
                        <div>
                            <label>First Name:
                                <form:input path="firstName" class="form-control"/>
                            </label>
                            <form:errors path="firstName" element="div" cssClass="error"/>
                        </div>
                        <div>
                            <label>Last Name:
                                <form:input path="lastName" class="form-control"/>
                            </label>
                            <form:errors path="lastName" element="div" cssClass="error"/>
                        </div>
                        <div>
                            <label>E-mail:
                                <form:input path="mail" class="form-control"/>
                            </label>
                            <form:errors path="mail" element="div" cssClass="error"/>
                        </div>
                        <div>
                            <label>Age:
                                <form:input path="age" class="form-control"/>
                            </label>
                            <form:errors path="age" element="div" cssClass="error"/>
                        </div>

                        <input type="submit" class="btn btn-primary" value=${empty user.id ? 'Register' : 'Save'}>

                    </form:form>
                </c:when>
                <c:otherwise>
                    <div class="align-content-md-center">You are already logged.</div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
</body>
</html>
