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
    <header>Exercises for plan ${plan.name}</header>
    <div class="card">
        <div class="card-body">
            <a href="/plan/list" class="btn btn-primary">Back</a>
        </div>
    </div>
</div>

<div class="card mt-4" class="form-group" style="text-align: center;" style="margin: 0 auto">
    <div class="card-body">

        <h3>${plan.name}</h3>
        <div>${plan.description}</div>
        <br><br>
        <%--<ul>
            <c:forEach var="ex" items="${plan.exercises}">

                <li>
                    Name:${ex.name} ->
                    ${ex.numberOfRepetitions}
                    /${ex.timeOfRepetition}
                    /${ex.numberOfSeries} &nbsp;
                    Description:${ex.description}
                </li>

            </c:forEach>
        </ul>--%>
        <div>
            <table class="table table-hover">

                <tr>
                    <th>Name</th>
                    <th>Number of repetitions</th>
                    <th>Time of repetition</th>
                    <th>Number of series</th>
                </tr>
                <c:forEach items="${plan.exercises}" var="exercise">
                    <tr>
                        <td>${exercise.name}</td>
                        <td>${exercise.numberOfRepetitions}</td>
                        <td>${exercise.timeOfRepetition}</td>
                        <td>${exercise.numberOfSeries}</td>
                        <td>
                            <a href="/plan/${plan.id}/details/${exercise.id}/delete" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
