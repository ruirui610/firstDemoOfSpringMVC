<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 16-8-3
  Time: 下午7:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户</title>

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
    <h1>博客系统-用户管理</h1>
    <hr/>
    <h3>所有用户<a href="addUser" type="button" class="btn btn-primary btn-sm">添加</a> </h3>
    <!--如果用户列表为空-->
    <c:if test="${empty userList}">
        <div class="alert alert-warning" role="alert">
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true">表为空，请<a href="/admin/addUser" type="button" class="btn btn-primary btn-sm">添加</a></span>
        </div>
    </c:if>
    <c:if test="${!empty userList}">
        <table class="table table-bordered table-responsive">
            <tr>
                <td>ID</td>
                <th>昵称</th>
                <th>姓名</th>
                <th>密码</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.iduser}</td>
                    <td>${user.nickname}</td>
                    <td>${user.firstname} ${user.lastname}</td>
                    <td>${user.password}</td>
                    <td>
                        <!--这里传参数的方式很特别，需要好好考虑-->
                        <a href="/show/${user.iduser}" type="button" class="btn btn-sm btn-success">详情</a>
                        <a href="/update/${user.iduser}" type="button" class="btn btn-sm btn-warning">修改</a>
                        <a href="/delete/${user.iduser}" type="button" class="btn btn-sm btn-danger">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>

</body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../../js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../js/bootstrap.js"></script>
</html>
