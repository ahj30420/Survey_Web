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
        width:80%;
    }
    .title{
        margin-top:50px;
        margin-left:30px;
        width:90%;
        padding-bottom:15px;
        font-weight:bolder;
        font-size:30px;
        border-bottom:3px solid gray;
    }
    .question{
        margin-top:10px;
        width:90%;
    }
    .qu{
        margin-left:100px;
        margin-top:30px;
        width:90%;
    }
    .d{
        display:flex;
        font-size:20px;
        margin-bottom:10px;
    }
    .d>div:first-child{
        width:3%;
        font-size:30px;

    }
    .d>div:nth-child(2){
        margin-top:10px;
        width:87%;
    }
    .d>div:last-child{
        display:flex;
        width:10%;
        font-size:15px;
        justify-content:end;
        align-items:end;
        color:gray;
    }
    .qu_con{
        display:flex;
        padding-top:5px;
        padding-left:5px;
        height:90%;
        border-radius: 5px;
        background-color:rgb(236, 234, 234);
    }
    .qu_con>div:first-child{
        margin-top:-10px;
        margin-right:5px;
        width:3%;
        font-size:30px;
        color:red;
    }
    .qu_con>div:nth-child(2){
        font-size:20px;
        width:87%;
        color:black;
        background-color: b;
    }
    .qu_con>div:last-child{
        display:flex;
        width:10%;
        font-size:15px;
        justify-content:end;
        align-items:end;
        color:gray;
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
            <div class="sub"><a href="ad_user.do">사용자</a></div>
            <div class="sub"><a href="ad_ad.do">관리자</a></div>
            <div class="sub"><a href="ad_inquiry.do" style="color:red;">문의 내역</a></div>
        </div>
        <div class="content">
            <div>콘텐츠 관리</div>
            <div class="sub"><a href="ad_survey.do">서베이 (survey)</a></div>
            <div class="sub"><a href="ad_qp.do">퀵폴 (quickpoll)</a></div>
        </div>
        <div class="content">
            <div>설문조사 분석</div>
           <div class="sub"><a href="ad_an_survey.do">서베이 분석</a></div>
            <div class="sub"><a href="ad_an_qp.do">퀵폴 분석</a></div>
        </div>
        <div class="logout">
            <div><a href="alogout.jsp" id="logout">로그아웃</a></div>
        </div>
    </div>

    <main>
    	<%
    		ArrayList<InquiryDto> inqdto = (ArrayList)session.getAttribute("ad_inquiry");
    		int i = Integer.parseInt(request.getParameter("i"));
    	%>
        <div class="title">답변 확인</div>
        <div class="question">
            <div class="qu">
                <div class="d"><div>Q</div><div><%=inqdto.get(i).getConinquiry() %></div><div><%=inqdto.get(i).getRedate() %></div></div>
                <div class="qu_con">
                    <div>A</div>
                    <div><%=inqdto.get(i).getConanswer()%></div>
                    <div><%=inqdto.get(i).getAnsdate()%></div>
                </div>
            </div>
         </div>
    </main>
</body>
</html>