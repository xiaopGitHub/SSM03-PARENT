<%--
  Created by IntelliJ IDEA.
  Creater: xp
  Date: 2018/11/19
  Time: 10:11
  Function:
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登陆</title>
    <script type="text/javascript" src="static/jquery-3.3.1.mini.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>
<form action="loginUser" style="width: 400px;margin-left: 400px">
    <div class="form-group">
        <label for="username">用户名</label>
        <input type="text" class="form-control" id="username" name="username">
    </div>
    <div class="form-group">
        <label for="password">密码</label>
        <input type="password" class="form-control" id="password" name="password">
    </div>
    <button type="submit" class="btn btn-primary">登录</button>
</form>
</body>
</html>
