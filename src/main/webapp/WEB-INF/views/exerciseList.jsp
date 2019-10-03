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
    <header>Exercises List</header>
    <div class="card">
        <div class="card-body">
            <a href="/home" class="btn btn-primary">Back</a>
            <c:choose>
                <c:when test="${empty cookie.get('user')}">
                </c:when>
                <c:otherwise>
                    <a href="/exercise/add" class="btn btn-primary">Add exercise</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>


    <div class="card mt-4" class="form-group" style="text-align: center;" style="margin: 0 auto">
        <div class="card-body">
            <c:choose>
            <c:when test="${empty cookie.get('user')}">
                <div class="text-center">You need to log in to see exercises.</div>
                <a href="/user/login" class="btn btn-primary">Log in</a>
                <div>Don't have account?Go register</div>
                <a href="/user/register" class="btn btn-warning">Register</a>
            </c:when>
            <c:otherwise>
            <table class="table table-hover">
                <tr>
                    <th>Name</th>
                    <th>Number of Repetitions:</th>
                    <th>Time of Repetitions:</th>
                    <th>Number of Series:</th>
                    <th>Description:</th>
                </tr>
                <c:forEach items="${exercises}" var="exercises">
                <tr>
                    <td>${exercises.name}</td>
                    <td>${exercises.numberOfRepetitions}</td>
                    <td>${exercises.timeOfRepetition}</td>
                    <td>${exercises.numberOfSeries}</td>
                    <td>${exercises.description}</td>
                    <td>
                        <a href="/exercise/update/${exercises.id}" class="btn btn-primary">Edit</a>
                        <a href="/exercise/delete/${exercises.id}" class="btn btn-danger">Delete</a>
                        <a href="/exercise/${exercises.id}/plan/add" class="btn btn-success">Add to plan</a>
                    </td>
                </tr>
                </c:forEach>

                </c:otherwise>
                </c:choose>
        </div>
    </div>


</div>
</body>
</html>
