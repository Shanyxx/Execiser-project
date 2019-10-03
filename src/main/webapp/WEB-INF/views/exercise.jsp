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
    <header>${empty exercise.id ? 'Add Exercise' : 'Edit Exercise'}</header>
    <div class="card">
        <div class="card-body">
            <a href="/exercise/list" class="btn btn-primary">Back</a>
        </div>
    </div>


    <div class="card mt-4" class="form-group" style="text-align: center;" style="margin: 0 auto">
        <div class="card-body">

            <form:form method="post" modelAttribute="exercise">
                <form:hidden path="id" value="${exercise.id}"/>
                <div>
                    <label>Name:
                        <form:input path="name" class="form-control"/>
                    </label>
                    <form:errors path="name" element="div" cssClass="error"/>
                </div>
                <div>
                    <label>Number of Repetitions:
                        <form:input path="numberOfRepetitions" class="form-control"/>
                    </label>
                    <form:errors path="numberOfRepetitions" element="div" cssClass="error"/>
                </div>
                <div>
                    <label>Time of Repetition:
                        <form:input path="timeOfRepetition" class="form-control"/>
                    </label>
                    <form:errors path="timeOfRepetition" element="div" cssClass="error"/>
                </div>
                <div>
                    <label>Number of Series:
                        <form:input path="numberOfSeries" class="form-control"/>
                    </label>
                    <form:errors path="numberOfSeries" element="div" cssClass="error"/>
                </div>
                <div>
                    <label>Description:
                        <form:textarea path="description" rows="3" cols="60" class="form-control" id="descriptionId"/>
                    </label>
                    <form:errors path="description" element="div" cssClass="error"/>
                </div>


                <input type="submit" class="btn btn-primary" value=${empty user.id ? 'Save' : 'Edit'}>

            </form:form>
        </div>
    </div>
</div>
</body>
</html>
