<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 16-8-7
  Time: 下午7:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <h1>博客系统-博客管理</h1>
    <br/>
    <h3>所有博客<a href="/addBlogs" type="button" class="btn btn-sm btn-success">添加博客</a> </h3>
    <c:if test="${empty blogList}">
        <div class="alert alert-warning" role="alert">
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true">Blog表为空，请<a href="/addBlogs" type="button" class="btn btn-sm btn-success">添加博客</a></span>
        </div>
    </c:if>

    <c:if test="${!empty blogList}">
        <table class="table table-bordered table-responsive">
            <tr>
                <th>ID</th>
                <th>标题</th>
                <th>作者</th>
                <th>发布日期</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${blogList}" var="blog">
                <tr>
                    <td>${blog.id}</td>
                    <td>${blog.title}</td>
                    <!--关于外键的使用-->
                    <td>${blog.userByUserId.nickname},${blog.userByUserId.firstname},${blog.userByUserId.lastname}</td>
                    <td><fmt:formatDate value="${blog.pubdate}" pattern="yyyy-MM-dd"/> </td>
                    <td>
                        <a href="showBlog" type="button" class="btn btn-sm btn-success">详情</a>
                        <a href="modifyBlog" type="button" class="btn btn-sm btn-warning">修改</a>
                        <a href="deleteBlog" type="button" class="btn btn-sm btn-danger">删除my</a>
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
