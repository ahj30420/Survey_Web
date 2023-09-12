<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            background-image: url("./image/main.gif");
            background-size: cover;
            background-repeat: no-repeat;
        }
        a{
            text-decoration: none;
        }
        .name{
            margin-left:50px;
            margin-top: 15px;
            font-family: Impact,sans-serif;
            font-size: 40px;
            color:white;
        }
        .menu > li{
            list-style-type: none;
            margin-left: 20px;
        }
        .menu>li>a{
            color:white;
            font-size: 17px;
        }
        .menu_container{
            width:100vw;
            height:4.45rem;
            display:flex;
            position:fixed;
            top:0px;
            z-index:999;
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
        section{
            margin-top: 10%;
            height:320vh;
            display:flex;
            justify-content: space-between;
        }
        .explanation_container{
            margin-left:9%;
            width:28rem;
            height:37rem;
 
            position: -webkit-sticky;
            position: sticky;
            top: 90px;
        }
        #n{
            margin-top:100px;
            font-weight: bolder;
            font-size:30px;
            color:red;
        }
        #b p:first-child{
            font-weight: bolder;
            font-size:40px;
        }
        #b p:nth-child(2){
            margin-top:-15px;
            font-weight:bolder;
            font-size:17px;
        }
        #b button{
            width:150px;
            height:50px;
            background-color: red;
            border: none;
            border-radius: 8px;
            color:white;
            font-weight: bolder;
            font-size:15px;
        }
        .survey_container{
            margin-right:120px;
            width:44rem;
            height:37rem;
        }
        .survey{
            height: 90%;
            display: flex;
            justify-content: space-between;
        }
        .survey1{
            width:48%;
            height:90%;
            align-self: flex-start;
            border-radius: 20px;
        }
        .survey2{
            width:48%;
            height:90%;
            align-self: flex-end;
            border-radius: 20px;
        }
        .sn{
            margin-top:40px;
            text-align:center;
            font-weight:bolder;
            font-size: 25px;
            color:white;
        }
        .sb{
            margin-top:20px;
            margin-left:50px;
            width: 70%;
            text-align:center;
            font-weight:bolder;
            font-size: 15px;
            color:white;
        }
        .gl{
            margin-top:280px;
            margin-left:50px;
            font-weight:bolder;
            font-size: 15px;
            color:white;
            border:none;
            background-color:transparent;
        }
        .s1{
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .s2{
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .s3{
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat; 
        }
        .s4{
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;  
        }
        .s5{
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat; 
        }
        .s6{
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;  
        }
        .s7{
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;  
        }
        .s8{
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;  
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
            color:rgb(199, 43, 43)
        }
    </style>
    <script>
        $(document).ready(function () {
            $(window).scroll(function () {
                var scroll = $(window).scrollTop();
                if (scroll > 500) {
                    $(".menu_container").css("background", "#ffffff");
                    $(".menu_container").css("border-bottom", "1px solid lightgray");
                    $(".name").css("color", "black");
                    $(".menu>li").css("color", "black");
                    $(".menu>li>a").css("color", "black");
                    $(".menu_container").hover(function(){
                        $(this).css("background","#ffffff");
                        $(".name").css("color", "black");
                        $(".menu>li").css("color", "black");
                        $(".menu>li>a").css("color", "black");
                    }, function(){
                        $(this).css("background","#ffffff");
                        $(".name").css("color", "black");
                        $(".menu>li").css("color", "black");
                        $(".menu>li>a").css("color", "black");
                    });   
                    $(".menu>li:last-child").hover(function(){
                        $(".name").css("color", "black");
                        $(".menu>li").css("color", "black");
                        $(".menu>li>a").css("color", "black");
                        $(".menu_container").css("border-bottom","1px solid lightgray");
                        $(".menu_container").css("height","15%");
                    }, function(){
                        $(".menu_container").css("height","4.45rem");
                        $(".menu_container").css("border-bottom", "1px solid lightgray");
                    });           
                }
                else {
                    $(".menu_container").css("background", "none");
                    $(".menu_container").css("border-bottom", "none");
                    $(".name").css("color", "white");
                    $(".menu>li").css("color", "white");
                    $(".menu>li>a").css("color", "white");
                    $(".menu_container").hover(function(){
                        $(this).css("background","#ffffff");
                        $(".name").css("color", "black");
                        $(".menu>li").css("color", "black");
                        $(".menu>li>a").css("color", "black");
                    }, function(){
                        $(this).css("background","none");
                        $(".name").css("color", "white");
                        $(".menu>li").css("color", "white");
                        $(".menu>li>a").css("color", "white");
                    });
                    $(".menu>li:last-child").hover(function(){
                        $(".menu_container").css("border-bottom","1px solid lightgray");
                        $(".menu_container").css("height","15%");
                        $(".name").css("color", "black");
                        $(".menu>li").css("color", "black");
                        $(".menu>li>a").css("color", "black");
                    }, function(){
                        $(".menu_container").css("height","4.45rem");
                        $(".menu_container").css("border-bottom","none");
                        $(".menu_container").css("background","#ffffff");
                        $(".name").css("color", "black");
                        $(".menu>li").css("color", "black");
                        $(".menu>li>a").css("color", "black");
                    });                
                }
            })
        })
    </script>
</head>
<body> 
 	<c:set var = "s_title0" value = "${s_title0}" />
    <c:if test = "${s_title0 == null}">
        <% response.sendRedirect("home.do"); %>
    </c:if>
    <nav>
        <div class="main_container">
            <div class="menu_container">
                <a href="home.do" class="name">HSP</a>
                <c:set var = "id" value = "${id}" />
                <c:if test = "${id == null}">
                <ul class="menu">
                   <li><a href="slogin.jsp">로그인</a></li>
                	<li><a href="sregister.jsp">회원가입</a></li>
                	<li>카테고리
                    	<ul class="category">
                       		<li><a href="slogin.jsp">설문조사</a></li>
                        	<li><a href="slogin.jsp">퀵폴</a></li>
                   		</ul>
               		</li>
                </ul>
                </c:if>
                <c:if test = "${id != null}">
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
               	</c:if>
            </div>
        </div>
    </nav>

    <section>
        <div class="explanation_container">
            <div id="n">
                SERVICE
            </div>
            <div id="b">
                <p>
                	 에이치에스피에서 한 번에 통합 온라인 설문조사를 집행하세요.
                </p>
                <p>
                	다양한 종류의 설문조사를 제공하며 설문조사 참여시 포인트를 지급합니다.
                </p><br>
                <c:if test = "${id == null}">
                	<form action="slogin.jsp">
                </c:if>
                <c:if test = "${id != null}">
                	<form action="tsurveys.do">
                </c:if>
                    <button>서비스 확인</button>
                </form>
            </div>
        </div>
        
        
        <c:if test = "${id != null}">
            <form action="contentsurvey.do">
        </c:if>
        <c:if test = "${id == null}">
            <form action="slogin.jsp">
        </c:if>
        <div class="survey_container">
            <div class="survey">
                <div class="survey1 s1" style="background-image: url(<%= (String)session.getAttribute("s_img0")%>);">
                    <div class="sn">
                        <%= (String)session.getAttribute("s_title0") %>
                    </div>
                    <div class="sb">
                        <%= (String)session.getAttribute("s_stitle0") %>
                    </div>
                        <button class="gl" name="ti" value="<%= (String)session.getAttribute("s_title0")%>">자세히 보기 ></button>
                </div>
                <div class="survey2 s2" style="background-image: url(<%= (String)session.getAttribute("s_img1")%>);">
                    <div class="sn">
                        <%= (String)session.getAttribute("s_title1") %>
                    </div>
                    <div class="sb">
                        <%= (String)session.getAttribute("s_stitle1") %>
                    </div>
                        <button class="gl" name="ti" value="<%= (String)session.getAttribute("s_title1")%>">자세히 보기 ></button>
                </div>
            </div>
            <div class = survey>
                <div class="survey1 s3" style="background-image: url(<%= (String)session.getAttribute("s_img2")%>);">
                    <div class="sn">
                       <%= (String)session.getAttribute("s_title2") %>
                    </div>
                    <div class="sb">
                        <%= (String)session.getAttribute("s_stitle2") %>
                    </div>
                        <button class="gl" name="ti" value="<%= (String)session.getAttribute("s_title2")%>">자세히 보기 ></button>
                </div>
                <div class="survey2 s4" style="background-image: url(<%= (String)session.getAttribute("s_img3")%>);">
                    <div class="sn">
                        <%= (String)session.getAttribute("s_title3") %>
                    </div>
                    <div class="sb">
                       <%= (String)session.getAttribute("s_stitle3") %>
                    </div>
                        <button class="gl" name="ti" value="<%= (String)session.getAttribute("s_title3")%>">자세히 보기 ></button>
                </div>
            </div>
            <div class = survey>
                <div class="survey1 s5" style="background-image: url(<%= (String)session.getAttribute("s_img4")%>);">
                    <div class="sn">
                       <%= (String)session.getAttribute("s_title4") %>
                    </div>
                    <div class="sb">
                        <%= (String)session.getAttribute("s_stitle4") %>
                    </div>
                        <button class="gl" name="ti" value="<%= (String)session.getAttribute("s_title4")%>">자세히 보기 ></button>
                </div>
                <div class="survey2 s6" style="background-image: url(<%= (String)session.getAttribute("s_img5")%>);">
                    <div class="sn">
                        <%= (String)session.getAttribute("s_title5") %>
                    </div>
                    <div class="sb">
                        <%= (String)session.getAttribute("s_stitle5") %>
                    </div>
                        <button class="gl" name="ti" value="<%= (String)session.getAttribute("s_title5")%>">자세히 보기 ></button>
                </div>
            </div>
            <div class = survey>
                <div class="survey1 s7" style="background-image: url(<%= (String)session.getAttribute("s_img6")%>);">
                    <div class="sn">
                        <%= (String)session.getAttribute("s_title6") %>
                    </div>
                    <div class="sb">
                        <%= (String)session.getAttribute("s_stitle6") %>
                    </div>
                        <button class="gl" name="ti" value="<%= (String)session.getAttribute("s_title6")%>">자세히 보기 ></button>
                </div>
                <div class="survey2 s8" style="background-image: url(<%= (String)session.getAttribute("s_img7")%>);">
                    <div class="sn">
                        <%= (String)session.getAttribute("s_title7") %>
                    </div>
                    <div class="sb">
                        <%= (String)session.getAttribute("s_stitle7") %>
                    </div>
                        <button class="gl" name="ti" value="<%= (String)session.getAttribute("s_title7")%>">자세히 보기 ></button>
                </div>
            </div>
        </div>
        </form>
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