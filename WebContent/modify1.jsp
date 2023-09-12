<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.sw.dto.*" %>
<%@page import = "java.sql.Date" %>
<%@page import = "java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='https://code.jquery.com/jquery-3.2.1.min.js'></script>
<title>Document</title>
<style>
    body{
        margin:0;
    }
    .main_container{
        height:100vh;
    }
    a{
        text-decoration: none;
    }
    .name{
        margin-left:50px;
        margin-top: 15px;
        font-family: Impact,sans-serif;
        font-size: 40px;
        color:black;
    }
    .menu > li{
        list-style-type: none;
        margin-left: 20px;
        color:black;
    }
    .menu>li>a{
        color:black;
        font-size: 17px;
    }
    .menu_container{
        width:100vw;
        height:4.45rem;
        display:flex;
        position:fixed;
        top:0px;
        z-index:999;
        background-color:white;
        border-bottom:1px solid lightgray;
    }
    .menu{
        margin-left:1000px;
        margin-top:30px;
        display: flex;
        justify-content: space-around;
        position:relative;
        color:white;
        font-size:17px;
    } 
    .category{
        display:none;
    }
    .category>li>a{
        color:lightgray;
    }
    .menu > li:last-child:hover > .category{
        padding-left:0px;
        display: flex;
        justify-content: space-between;
        margin-top: 3px;
    }
    .menu > li:last-child:hover > .category > li{
        padding-top: 15px;
        list-style-type: none;
        text-align:center;
        width: 5rem;
    }
    .menu > li:last-child:hover > .category > li >a:hover{
        color:red;
    }
    .exp_container{
        margin-left:10%;
        margin-top:8%;
        width:80%;
        height:30%;
        border-bottom:2px solid gray;
    }
    .title{
        margin-top:5%;
        margin-bottom:1%;
        font-weight:bolder;
        font-size:50px;
        color:red;
    }
    .title>span:first-child{
        margin-left:750px;
        font-weight:lighter;
        font-size:15px;
        color:black
    }
    .title>span:last-child{
        margin-left:10px;
        font-weight:lighter;
        font-size:20px;
    }
    .menubar{
        margin-left:10%;
        height: 40px;
        width:80%;
        background-color: rgb(245, 242, 242);
    }
    .modify{
    	float:left;
        height:40px;
        font-weight:bolder;
        font-size:20px;
        color:red;
        border:none;
        background-color: rgb(245, 242, 242);
    }
    .modify:hover{
        color:red;
    }
    .register{
        margin-left:20px;
        height:40px;
        font-weight:bolder;
        font-size:20px;
        color:gray;
        border:none;
        background-color: rgb(245, 242, 242);
    }
    .register:hover{
        color:red;
    }
    .content{
        height:25rem;
        width:74rem;
        margin-left:10%;
    }
    .notice{
        margin-top:50px;
        height:120px;
        text-align: center;
        font-weight:bolder;
        color:gray;
    }
    .notice>span{
        font-size:30px;
        color:black;
    }
    .identify{
        margin-top:30px;
        margin-left:350px;
    }
    .id{
        font-size:15px;
    }
    .id>span{
        font-size:25px;
    }
    .pw{
        margin-top:20px;
        font-size:15px;
    }
    .password{
        margin-top:10px;
        width:60%;
        height:45px; 
        border:1px solid rgb(150, 137, 137);
    }
    .sm{
        margin-top:10px;
        width:61%;
        height:45px;
        font-size:20px;
        color:white;
        background-color: red;
        border:none; 
    }
    .content>p{
        line-height:25rem;
        text-align:center;
        color:gray;
        font-weight:bolder;
        font-size:40px;
    }
    .ft{
        padding-top:1%;
        height: 11rem;
        background-color: black;
    }
    .box1{
        width:50%;
        height:100%;
        float:left;
    }
    .box2{
        width:50%;
        height:100%;
        float:left;
    }
    .company{
        margin-left:30%;
        color:white;
    }
    .owner{
        margin-left:30%;
        color:white;
    }
    .email{
        margin-left:30%;
        color:white;
    }
    .reference{
        margin-left:30%;
        color:gray;
    }
    .tel{
        margin-left:30%;
        color:white;
    }
    .teln{
        margin-top:-10px;
        margin-left:30%;
        font-weight: bolder;
        font-size:30px;
        color:white;
    }
    .ask{
        margin-left:30%;
        margin-top:-20px;
    }
    .ask > a{
        color:rgb(199, 43, 43);
    }
</style>
<script>
    $(document).ready(function () {
            $(".menu>li:last-child").hover(function () {
                $(".menu_container").css("height", "15%");
            }, function () {
                $(".menu_container").css("height", "4.45rem");
            });
        });
</script>
</head>
<body>
    <nav>
        <div class="menu_container">
            <a href="home.do" class="name">HSP</a>
             <ul class="menu">
                   <li><a href="smypage.do"><%=(String) session.getAttribute("name")%> 님</a></li>
                	<li><a href="slogout.jsp">로그아웃</a></li>
                	<li>카테고리
                    	<ul class="category">
                       		<li><a href="tsurveys.do">설문조사</a></li>
                        	<li><a href="qp.do">퀵폴</a></li>
                   		</ul>
               		</li>
                </ul>
        </div>
    </nav>

    <section>
        <div class="exp_container">
            <div class="title">
                My Page
                <span>현재 보유 포인트 : </span><span><%= (int)session.getAttribute("point") %>P</span>
            </div>
        </div>
        <div class="menubar">
	        <form action="modify1.jsp">
	            <input type="submit" class="modify" value="회원정보 수정">
	        </form>
	        <form action="reqp.jsp">
	            <input type="submit" class="register" value="퀵폴 등록">
	        </form>
        </div>
        <div class="content">
            <div class="notice">
                <span>회원정보 수정</span><br><br>
                회원님의 정보 보호를 위해 비밀번호를 다시 한번 확인합니다.<br>
                비밀번호는 항상 타인에게 노출되지 않도록 주의해 주세요.
            </div>
            <div class="identify">
                <div class="id">
                    아이디<br>
                    <span><%= session.getAttribute("id") %></span>
                </div>
                <form action="identify.do">
                    <div class="pw">
                        비밀번호<br>
                        <input type="password" class="password" name="password" placeholder="비밀번호를 입력해주세요." required><br>
                        <input type="submit" class="sm" value="확인">
                    </div>
                </form>
            </div>
        </div>
    </section>

    <footer>
        <div class="ft">
            <div class="box1">
                <p class="company">(주)에이치에스피</p>
                <p class="owner">대표자: 안형준</p>
                <p class="email">이메일: ahj30420@naver.com</p>
                <p class="reference">Copyright &copy; Your Website 2023</p>
            </div>
            <div class="box2">
                <p class="tel">대표전화</p>
                <p class ="teln">1533-1533</p>
                <p class="ask">
				<c:if test = "${id == null}">
	                	<a href="slogin.jsp">1:1문의</a>
                </c:if>
                <c:if test = "${id != null}">
                	<a href="inquiry.do">1:1문의</a>
                </c:if>                
                </p>
            </div>
        </div>
    </footer> 
</body>
</html>