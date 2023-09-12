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
        width:74rem;
        margin-left:10%;
        margin-bottom:5%;
    }
    .notice{
        margin-top:50px;
        margin-left:250px;
        height:120px;
        width:60%;
        text-align: center;
        font-weight:bolder;
        font-size:15px;
        color:gray;
        border-bottom:2px solid gray;
    }
    .notice>span{
        font-size:30px;
        color:black;
    }
    .id{
        margin-top:40px;
        margin-left:30%;
    }
    .id pre{
        font-size:15px;
    }
    .content input{
        height: 30px;
        width:60%;
        border-radius: 7px;
        border:1px solid lightgray;
    }
    .pw{
        margin-left:30%;
        margin-top:2%;
    }
    .icpw{
        margin-top:4%;
    }
    .nm{
        margin-top:2%;
        margin-left:30%;
    }
    .em{
        margin-top:2%;
        margin-left:30%;
    }
    .phone{
        margin-top:2%;
        margin-left:30%;
    }
    .line{
        margin-left:30%;
        margin-top:3%;
        border-top:1px solid lightgray;
        width:43%;
    }
    .agg{
        margin-left:30%;
        margin-top:2%;
    }
    .agg>.iagg{
        width:15px;
        border-radius: 15px;
    }
    label{
        position:relative;
        top:-8px;
    }
    button{
        margin-top:2%;
        margin-left:30%;
        margin-bottom:2%;
        border:none;
        border-radius: 5px;
        background-color:red;
        height:40px;
        width:43%;
        font-weight: bolder;
        font-size:15px;
        color:white;
    }
    .cp>a{
        margin-left:48%;
        color:black;
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
                정확한 정보를 입력하셔야 서베이링크에서 진행중인 다양한 설문조사에 참여하실 수 있습니다.
            </div>
            <form action="modify.do">
                <div class="id">
                    <pre>아이디</pre>
                    <input type="text" name="id" class="iid" placeholder="<%= session.getAttribute("id") %>" disabled>
                </div>
                <div class="pw">
                    <pre>비밀번호</pre>
                    <input type="password" name="pw" class="ipw" placeholder="숫자,영문,특수문자 조합 최소 8자">
                    <input type="password" name="cpw" class="icpw" placeholder="비밀번호 재입력">
                </div>
                <div class="nm">
                    <pre>이름</pre>
                    <input type="text" name="name" class="iname" placeholder="<%= session.getAttribute("name") %>" disabled>
                </div>
                <div class="em">
                    <pre>이메일</pre>
                    <input type="email" name="email" class="iemail" placeholder="<%= session.getAttribute("email") %>" disabled>
                </div>
                <div class="phone">
                    <pre>전화번호</pre>
                    <input type="number" name="tel" class="itel" placeholder="<%= session.getAttribute("phone") %>" disabled>
                </div>
                <div class="line"></div>
                <div class="agg">
                    <input type="checkbox" class="iagg" id="agg" required>
                    <label for="agg">개인정보 수집 및 이용에 동의합니다.</label>
                </div>
	            <div class="cp">
	                <button type="submit">수정 완료</button><br>
	                <a href="withdrawal.do" class="withdrawal">-회원 탈퇴-</a>
	            </div>
            </form>
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