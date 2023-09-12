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
            color:gray;
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
        .container{
            margin-top:3%;
            margin-bottom:4%;
            margin-left:31%;
            width:500px;
            background-color: white;
            border-radius:20px;
        }
        .tt{
            margin-top:30px;
            padding-bottom:20px;
            font-weight:bolder;
            font-size:15px;
            text-align:center;
            color:gray;
            border-bottom:2px solid gray;
        }
        .tt>span{
            color:black;
            font-size:30px;
        }
        .qtitle{
            margin-left:15%;
            margin-top:8%;
        }
        .qt{
            height:30px;
            width:81%;
        }
        .filebox{
            margin-top:30px;
            margin-left:15%;
        }
        .filebox .upload-name {
            margin-bottom:5px;
            display: inline-block;
            height: 30px;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #dddddd;
            width: 50%;
            color: #999999;
        }
        .filebox label {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            text-align:center;
            line-height:10px;
            background-color: #999999;
            cursor: pointer;
            height: 10px;
            margin-left: 3px;
        }
        .filebox input[type="file"] {
            position: absolute;
            width: 0;
            height: 0;
            padding: 0;
            overflow: hidden;
            border: 0;
        }
        .option{
            margin-top:15px;
            height:300px;
            display:flex;
            flex-direction: column;
            justify-content: space-evenly;
            
        }
        .op{
            margin:0 auto;
            width:68%;
            height:50px;
        }
        .date{
            margin-top:15px;
        }
        .date>pre{
            margin-left:16%;
        }
        .placeholder-date{
            margin-left:16%;
            height:30px;
        }
        .date_empty::before{
            content:attr(data-placeholder);
            width:100%;
        }
        .date_empty:focus::before,
        .date_empty:focus::valid::before {display:none}
        button{
            margin-top:30px;
            margin-left:16%;
            border:none;
            border-radius: 5px;
            background-color:red;
            height:40px;
            width:68%;
            font-weight: bolder;
            font-size:15px;
            color:white;
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
        <div class="container">
            <div class="tt">
                <span>퀵폴 등록</span><br><br>
                퀵폴의 썸네일 이미지, 선택지 option, 마감일을 등록해주세요.
            </div>
            <form action="qpregister.do" method="post" enctype="multipart/form-data">
                <div class="qtitle">
                    <pre>질문</pre>
                    <input type="text" class="qt" name="qpques" placeholder="질문 입력" required>
                </div>
                <div class="filebox">
                    <pre>이미지</pre>
                    <input class="upload-name" value="첨부파일" placeholder="첨부파일" required>
                    <label for="file">파일찾기</label>
                    <input type="file" id="file" name = "qpimg" accept="image/gif,image/jpeg,image/png,image/jpg">
                </div>
                <div class="option">
                    <input type="text" class="op" name="op1" placeholder="선택지 1.내용 입력(작성 내용 없을 시 '해당 없음' 작성)" required>
                    <input type="text" class="op" name="op2" placeholder="선택지 2.내용 입력(작성 내용 없을 시 '해당 없음' 작성)" required>
                    <input type="text" class="op" name="op3" placeholder="선택지 3.내용 입력(작성 내용 없을 시 '해당 없음' 작성)" required>
                    <input type="text" class="op" name="op4" placeholder="선택지 4.내용 입력(작성 내용 없을 시 '해당 없음' 작성)" required>
                </div>
                <div class="date">
                    <pre>설문조사 종료일</pre>
                    <input type="date" class="date_empty placeholder-date" name="qpdl"  data-placeholder="날짜 선택" required aria-required="true">
                </div>
                <div class="cp">
                    <button type="submit">등록</button>
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
        
    <script>
        $("#file").on('change',function(){
           var fileName = $("#file").val();
            $(".upload-name").val(fileName);
        });
        
        $("input[type=date].placeholder-date").on("change", (e) => {
        	  const target = $(e.target);
        	  if (target.val() == "") target.addClass("date_empty");
        	  else target.removeClass("date_empty");
        	});
    </script>
</body>
</html>