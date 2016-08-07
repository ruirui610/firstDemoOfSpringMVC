<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 16-8-7
  Time: 下午3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title></title>

    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <h1>用户详情</h1>
    <br/>
    <table class="table table-bordered table-responsive">
        <tr>
            <th>ID</th>
            <td>${user.iduser}</td>
        </tr>
        <tr>
            <th>Nickname</th>
            <th>${user.nickname}</th>
        </tr>
        <tr>
            <th>First Name</th>
            <th>${user.firstname}</th>
        </tr>
        <tr>
            <th>Last Name</th>
            <th>${user.lastname}</th>
        </tr>
        <tr>
            <th>Password</th>
            <th>${user.password}</th>
        </tr>
    </table>
</div>


</body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../../js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../js/bootstrap.js"></script>
</html>
