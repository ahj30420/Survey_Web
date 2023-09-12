<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%
session.removeAttribute("ad_mind");
session.removeAttribute("ad_id");
session.removeAttribute("ad_pw");

String cPath = request.getContextPath();
response.sendRedirect(cPath+"/ad_login.jsp");
%>