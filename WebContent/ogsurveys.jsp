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
            margin-left:8%;
            margin-top:5%;
            width:80%;
            height:30%;
        }
        .title{
            margin-top:5%;
            font-weight:bolder;
            font-size:70px;
            color:red;
        }
        .content{
            margin-top:1%;
            font-weight: bolder;
            font-size:40px;
        }
        .content>span{
            color:red;
        }
        .view_container{
            margin-top:1%;
            margin-left:8%;
            height: 400px;
            width: 80%;
            border-radius:10px;
            background-image: url("./image/3.jpg");
            background-position-y:-50px;
            background-size:cover;
            background-repeat: no-repeat;
        }
        .exp{
            width:50%;
            height:100%;
            padding-left:80px;
            padding-top:110px;
            font-weight:bolder;
            font-size:30px;
            color:white;
        }
        .apply{
            margin-top:30px;
            width:50%;
            height:10%;
            border-radius: 10px;
            border:none;
            text-align:center;
            line-height:200%;
            font-weight: bolder;
            font-size:18px;
            background-color: red;
            color:white;
        }
        .search_container{
            margin-left:8%;
            width:80%;
            height:250px;
            border-radius: 10px;
            background-color: rgb(78, 68, 62);
        }
        .search>input{
            margin-left:25%;
            margin-top:70px;
            width:45%;
            height:50px;
            border-radius: 5px 0px 0px 5px;
            border:none;
        }
        .search>button[type="submit"]{
            width:52px;
            height:52px;
            margin-left:-0.5%;
            position:relative;
            top:21px;
            border-radius:0px 5px 5px 0px;
            border:none;
            background-image:url("./image/d1.png");
            background-size:cover;
            background-position: center;
            background-repeat: no-repeat;
            background-color: white;
        }
        .bt{
            margin-top:20px;
            margin-left:28%;
            height:40%;
            width:20%;
            display:flex;
            justify-content: space-evenly;
        }
        .total{
            height:40px;
            width:80px;
            border-radius:20px;
            border:none;
            background-color: rgb(78, 68, 62);
            color:white;
            font-size:20px;
        }
        .og{
            height:40px;
            width:80px;
            border-radius:20px;
            border:none;
            background-color: white;
            color:rgb(78, 68, 62);
            font-weight:bolder;
            font-size:20px;
        }
        .dl{
            height:40px;
            width:80px;
            border-radius:20px;
            border:none;
            background-color: rgb(78, 68, 62);
            color:white;
            font-size:20px;
        }
        .co{
        	height:40px;
            width:80px;
            border-radius:20px;
            border:none;
            background-color: rgb(78, 68, 62);
            color:white;
            font-size:20px;
        }
        .total:hover{
        	background-color: white;
            color:rgb(78, 68, 62);
            font-weight:bolder;
        }
        .dl:hover{
        	background-color: white;
            color:rgb(78, 68, 62);
            font-weight:bolder;
        }
        .co:hover{
        	background-color: white;
            color:rgb(78, 68, 62);
            font-weight:bolder;
        }
        .survey_container{
            margin-left:8%;
            margin-top:5%;
            width:80%;
            display:flex;
            flex-wrap:wrap;
            justify-content: space-around;
        }
        .survey{
            margin-bottom:10%;
            width:30%;
            height:600px;
            border-radius:20px;
            box-shadow: 0px 0px 5px gray;
        }
        .img{
            height:65%;
            border-radius:20px 20px 0px 0px;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .ti{
            margin-top:10px;
            height:40px;
            text-align: center;
            font-weight: bolder;
            font-size:28px;
            color:red;
            background-color: white;
        }
        .dp{
            width: 30%;
            margin-top:5px;
            padding-left:240px;;
            color:gray;
            font-size:13px;
            background-color: white;
        }
        .dp>span:last-child{
            margin-left:10px;
            color:gray;
        }
        .con{
            margin-top:10px;
            padding-left:18px;
            padding-right:18px;
            font-size:18px;
            text-align:center;
        }
        .sb{
            margin-left:15%;
            margin-top:5%;
            width:70%;
            height:8%;
            font-weight: bolder;
            font-size:15px;
            color:white;
            background-color: rgb(255, 0, 0);
            border-radius:20px;
            border:none;
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
                       		<li><a href="tsurveys.do">설문조사</a></li>
                        	<li><a href="#">퀵폴</a></li>
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
                       		<li><a href="surveys.jsp">설문조사</a></li>
                        	<li><a href="qp.do">퀵폴</a></li>
                   		</ul>
               		</li>
                </ul>
               	</c:if>
            </div>
            <div class="exp_container">
                <div class="title">
                    Survey
                </div>
                <div class="content">
                    하루 5분, 에이치에스피 서비스로<br>
                    <span>설문조사</span>에 빠르게 참여해보세요.
                </div>
            </div>
            <form action="#">
                <div class="view_container">
                    <div class="exp">
                        쉽고 빠르게, 다양한 설문조사에<br>
                        참여하여 포인를 받아가세요.<br>
                        모바일앱 지원합니다.<br>
                        <div class="apply">통합 설문조사</div>     
                    </div>
                </div>
            </form>
        </div>
    </nav>

    <section>
        <div class="search_container">
            <form action="search.do">
                <div class="search">
                    <input name="search" type="text" placeholder="Search for...">
                    <button type="submit"></button>
                </div>
            </form>
           
            <div class="bt">
                <form action="tsurveys.do">
                    <button class="total">전체</button>
                </form>
                <form action="ogsurveys.do">
                    <button class="og">진행</button>
                </form>
                <form action="desurveys.do">   
                    <button class="dl">마감</button>
                </form>
                <form action="comsurveys.do">
                    <button class="co">완료</button>
                </form>
            </div>
        </div>
        <form action="#">
            <div class="survey_container">
            	<% 
	            	ArrayList<SurveyDto> dto = (ArrayList)session.getAttribute("ogsurveys");
            		ArrayList<Integer> comsind = (ArrayList) session.getAttribute("comsind");
                    int j = 0;
	                for(int i=0; i<dto.size(); i++){ 
                  		
                  		boolean com = false;
                  		
                  		if(comsind.size() != 0){
	                  		if(j != comsind.size()-1){
	              				if(comsind.get(j) == dto.get(i).getInd()){
	              					com = true;
	              					j++;
	              				}
	              			}
		              		else{
		          				if(comsind.get(j) == dto.get(i).getInd()){
		          					com = true;
		          				}
		              		}
                  		}
                  		else{}
                  		
                  		if(com){
	             %>
			               <div class="survey">
				                    <div class="img" style="background-image : url(<%= dto.get(i).getImg()%>);"></div>
				                    <div class="ti">
				                        <%= dto.get(i).getTitle() %>
				                    </div>
				                    <div class="con">
				                        <%= dto.get(i).getStitle() %>
				                    </div>
				                    <button type="submit" class="sb" style="background-color:gray;" disabled>설문조사 완료</button>
				                    <div class="dp">
				                        <span><%= dto.get(i).getDeadline() %></span><span>+<%= dto.get(i).getPoint() %>P</span>
				                    </div>
		                	</div>
			        <%}
                  		else{
                  	%>
                  		 <div class="survey">
			                    <div class="img" style="background-image : url(<%= dto.get(i).getImg()%>);"></div>
			                    <div class="ti">
			                        <%= dto.get(i).getTitle() %>
			                    </div>
			                    <div class="con">
			                        <%= dto.get(i).getStitle() %>
			                    </div>
			                    <button type="submit" class="sb">설문조사 참여</button>
			                    <div class="dp">
			                        <span><%= dto.get(i).getDeadline() %></span><span>+<%= dto.get(i).getPoint() %>P</span>
			                    </div>
			               </div>
                  	<%} 
                  	%>
		         <%
	                }		         
		         %>
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