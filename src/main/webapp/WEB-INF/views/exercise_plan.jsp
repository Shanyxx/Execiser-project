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
    <header>Add Exercise To Plan</header>
    <div class="card">
        <div class="card-body">
            <a href="/exercise/list" class="btn btn-primary">Back</a>
        </div>
    </div>
    <div class="card mt-4" class="form-group" style="text-align: center;" style="margin: 0 auto">
        <div class="card-body">
        <form:form method="post" modelAttribute="exerciseDto">
            <div class="form-group" style="text-align: center;" style="margin: 0 auto">
                <div>
                    <label>${exercise.name}</label>
                </div>
                <label for="plans">Plans:</label>
                <form:select path="plans" items="${plans}" itemLabel="name" itemValue="id" class="form-control"/>
                <form:errors path="plans" element="div" cssClass="error"/>
            </div>
            <input type="submit" class="btn btn-primary" value=Save>
        </form:form>
        </div>
    </div>
</div>
</body>
</html>
