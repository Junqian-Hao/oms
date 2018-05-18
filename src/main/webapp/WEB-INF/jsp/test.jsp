<%--
  Created by IntelliJ IDEA.
  User: 郝俊谦
  Date: 2018/5/18
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>测试界面</title>
</head>
<body>
${a}
${user.id}
<form action="${pageContext.request.contextPath}/login">
    <input type="text" name="username">
    <input type="password" name="password">
    <input type="submit">
</form>
</body>
</html>
