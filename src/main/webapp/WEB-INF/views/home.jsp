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
    <header>Welcome to Execiser!</header>
    <div class="card">
        <div class="card-body">
            <div>Lorem ipsum dolor sit amet enim. Etiam ullamcorper. Suspendisse a pellentesque dui, non felis. Maecenas
                malesuada elit lectus felis, malesuada ultricies.
                Curabitur et ligula. Ut molestie a, ultricies porta urna. Vestibulum commodo volutpat a, convallis ac,
                laoreet enim. Phasellus fermentum in, dolor.
                Pellentesque facilisis. Nulla imperdiet sit amet magna. Vestibulum dapibus, mauris nec malesuada fames
                ac turpis velit, rhoncus eu, luctus
                et interdum adipiscing wisi. Aliquam erat ac ipsum. Integer aliquam purus. Quisque lorem tortor
                fringilla sed, vestibulum id, eleifend justo vel bibendum
                sapien massa ac turpis faucibus orci luctus non, consectetuer lobortis quis, varius in, purus. Integer
                ultrices posuere cubilia Curae, Nulla ipsum dolor lacus,
                suscipit adipiscing. Cum sociis natoque penatibus et ultrices volutpat. Nullam wisi ultricies a, gravida
                vitae, dapibus risus ante sodales lectus blandit eu,
                tempor diam pede cursus vitae, ultricies eu, faucibus quis, porttitor eros cursus lectus, pellentesque
                eget, bibendum a, gravida ullamcorper quam.
                Nullam viverra consectetuer. Quisque cursus et, porttitor risus. Aliquam sem. In hendrerit nulla quam
                nunc, accumsan congue. Lorem ipsum primis in nibh vel
                risus. Sed vel lectus. Ut sagittis, ipsum dolor quam.
            </div>
            <br>
            <c:choose>
                <c:when test="${empty cookie.get('user')}">
                    <div class="form-group" style="text-align: center;" style="margin: 0 auto">
                        <a href="/user/login" class="btn btn-primary">Log in</a><br><br>
                        <div>Don't have account?Go register</div>
                        <a href="/user/register" class="btn btn-warning">Register</a>
                    </div>
                </c:when>

            </c:choose>
        </div>
    </div>

</div>

</body>
</html>
