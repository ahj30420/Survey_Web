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
   session.removeAttribute("mind");
   session.removeAttribute("id");
   session.removeAttribute("pw");
   session.removeAttribute("name");
   session.removeAttribute("email");
   session.removeAttribute("phone");
   session.removeAttribute("point");
   
  
   String cPath = request.getContextPath();
   response.sendRedirect(cPath+"/shomepage.jsp");
%>