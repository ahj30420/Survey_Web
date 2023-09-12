<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.sw.dto.*" %>
<%@page import = "java.sql.Date" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .body{
            margin:0;
        }
        .main_bar{
            position:fixed;
            top:0px; left:0px;
            padding-left:40px;
            width:100vw;
            height:70px;
            background-color: rgb(64, 52, 52);
            color:white;
            font-weight:bolder;
            font-size:40px;
            line-height:70px;
            z-index: 999;
        }
        .main_bar>span{
            color:gray;
            font-size:18px;
        }
        .menu_bar{
            position:fixed;
            top:70px; left:0px;
            width:20vw;
            height:100vh;
            background-color:rgb(231, 226, 226);
        }
        .ad{
            margin-left:8%;
            width:80%;
            height:60px;
            text-align: center;
            line-height:50px;
            font-weight:bolder;
            border-bottom:2px solid rgb(208, 188, 188);
        }
        .content{
            margin-top:20px;
            margin-left:8%;
            padding-bottom:20px;
            width:80%;
            border-bottom:2px solid rgb(208, 188, 188);
        }
        .content>div:first-child{
            font-weight:bolder;
            font-size:15px;
        }
        .content a{
            text-decoration: none;

            color:rgb(125, 112, 112);
        }
        .content a:hover{
            color:red;
        }
        .sub{
            margin-top: 10px;
        }
        .logout{
            margin-top:20px;
            width:80%;
            text-align: center;
        }
        .logout a{
            margin-left:8%;
            font-weight:bolder;
            font-size:15px;
            text-decoration: none;
            color:red;
        }
        main{
            position:absolute;
            top:70px; left:20vw;
        }
        .title{
            margin-top:50px;
            margin-left:30px;
            font-weight:bolder;
            font-size:30px;
        }
        .tb{
            margin-left:30px;
            margin-top:30px;
        }
        table{
            table-layout:fixed;
            border-collapse:collapse;
            width:95%;
            border-top:2px solid gray;
        }
        thead{
            background-color: rgb(243, 239, 239);
            color: rgb(93, 88, 88);
        }
        tr{
            height:45px;
            border-bottom:1px solid rgb(244, 241, 241);
        }
        td{
            text-align:center;
        }
        thead td:first-child{
            width:15%;
        }
        thead td:nth-child(2){
            width:70%;
        }
        thead td:last-child{
            width:15%;
        }
        table a{
            color:black;
            text-decoration-color:gray;
        }
    </style>
</head>
<body>
    <div class="main_bar">
        HSP <span>Administration</span>
    </div>
   <div class="menu_bar">
	        <div class="ad">
	            관리자 님, 환영합니다!
	        </div>
	         <div class="content">
	            <div>회원 관리</div>
	            <div class="sub" id="one"><a href="ad_user.do">사용자</a></div>
	            <div class="sub"><a href="ad_ad.do">관리자</a></div>
	            <div class="sub"><a href="ad_inquiry.do">문의 내역</a></div>
	        </div>
	        <div class="content">
	            <div>콘텐츠 관리</div>
	            <div class="sub"><a href="ad_survey.do">서베이 (survey)</a></div>
	            <div class="sub"><a href="ad_qp.do">퀵폴 (quickpoll)</a></div>
	        </div>
	        <div class="content">
	            <div>설문조사 분석</div>
	           	<div class="sub"><a href="ad_an_survey.do">서베이 분석</a></div>
	            <div class="sub"><a href="ad_an_qp.do" style="color:red;">퀵폴 분석</a></div>
	        </div>
	        <div class="logout">
	            <div><a href="alogout.jsp" id="logout">로그아웃</a></div>
	        </div>
	    </div>

    <main>
    <%
    	ArrayList<AnqpnumDto> dto = (ArrayList)session.getAttribute("aqn");
    	int qind = (int)session.getAttribute("aqnqind");
    	String question = (String)session.getAttribute("aqnquestion");
    %>
        <div class="title">no.<%=qind%>:<%=question%> | 퀵폴 참여 현황</div>
        <div class="tb">
            <table>
                <thead>
                    <tr>
                        <td>회원번호</td>
                        <td>아이디</td>
                        <td>참여일</td>
                    </tr>
                </thead>
                <tbody>
                <%
                	for(int i = 0; i < dto.size(); i++){
                %>
                    <tr>
                        <td><%=dto.get(i).getMind()%></td>
                        <td><%=dto.get(i).getId()%></td>
                        <td><%=dto.get(i).getPdate()%></td>
                    </tr>
                <%
                	}
                %> 
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>