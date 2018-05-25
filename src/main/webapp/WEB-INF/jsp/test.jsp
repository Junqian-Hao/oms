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
<%--${a}--%>
<%--${user.id}--%>
<%--<audio src="http://localhost:8080/user/music/1" controls="controls">--%>
    <%--Your browser does not support the audio element.--%>
<%--</audio>--%>
<%--<form action="${pageContext.request.contextPath}/login">--%>
    <%--<input type="text" name="username">--%>
    <%--<input type="password" name="password">--%>
    <%--<input type="submit">--%>
<%--</form>--%>
<form action="${pageContext.request.contextPath}/user/uploadMusic" method="post"
      enctype="multipart/form-data">
    <input type="text" class="form-control" id="aaa" placeholder="music" name="mtitle">
    <input type="text" class="form-control" id="bbb" placeholder="author" name="mauthor">
    <select class="form-control" id="eee" name="category.cid">
        <option value="3">动漫</option>
        <option value="4">电子</option>
        <option value="1">钢琴</option>
        <option value="2">吉他</option>
    </select>
    <input type="text" class="form-control" id="fff" placeholder="abstract" name="msummary">
    <input type="file" id="ccc" name="musicfile">
    <input style="position: relative; " type="file" id="ddd" name="mpic">
    <input type="submit" class="btn btn-primary btn-lg" value="上传" >
</form>
</body>
</html>
