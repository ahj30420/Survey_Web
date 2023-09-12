 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.sw.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src='https://code.jquery.com/jquery-3.2.1.min.js'></script>
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
        section{
            margin-top: 10%;
            display:flex;
            justify-content: space-between;
        }
        .survey_img{
            margin-left:9%;
            width:28rem;
            height:37rem;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;  
            border-radius: 10px;
            position: -webkit-sticky;
            position: sticky;
            top: 90px;
            box-shadow: 0px 0px 5px gray;
        }
        .survey_content{
            margin-right:9%;
            margin-top:2.7%;
            width:44rem;
            height:auto;
            border-radius: 10px;
            box-shadow: 0px 0px 5px gray;
        }
        .t{
            padding-top:10px;
            margin-top:-40px;
            height:150px;
            border-radius:10px 10px 0px 0px;
            background-color: red;
        }
        .title{
            margin-top:5%;
            margin-left:6%;
            font-weight: bolder;
            font-size:35px;
            color:white;
        }
        .sti{
            margin-top:1%;
            margin-left:6%;
            font-weight: bolder;
            font-size:15px;
            color:white;
        }
        .s{
            margin-left:6%;
            margin-top:6%;
        }
        .q{
            font-weight:bolder;
            font-size:20px;
        }
        .op{
            margin-top:2%;
        }
        .sop{
            margin-top:1%;
        }
        .sbtn{
            float:right;
            margin-top:10%;
            margin-right:5%;
            margin-bottom:5%;
        }
        .sb{
            width:100px;
            height:45px;
            border-radius: 10px;
            border:none;
            background-color: red;
            font-weight:bolder;
            font-size:20px;
            color:white;
        }
        .rd{
            width:18px;
            height:18px;
            border:none;
            position:relative;
            top:2px;
            accent-color:red;
        }
        span{
            font-size:18px;
        }
        .ft{
            margin-top:50px;
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
                     	<li><a href="qp.do">퀵폴</a></li>
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
    </nav>

    <section>
    	<div class="survey_img" style="background-image: url(<%= (String)session.getAttribute("img")%>);"></div>
    	<div class="survey_content">
            <div class="t">
                <div class="title">
                    <%= (String)session.getAttribute("title") %>
                </div>
                <div class="sti">
                    <%= (String)session.getAttribute("stitle") %>
                </div>
            </div>
            <form action="submitsurvey.do">
            	<%
            		ArrayList<SquestionDto> sqdto = (ArrayList)session.getAttribute("sqdto");
            		int nq = 0;
            	
            		for(int i = 0; i < sqdto.size(); i++){
            	%>
	                <div class = "s">
	                <% 
	                	if(sqdto.get(i).getNumques() != nq){
	                		nq++;
	                %>
	                    <div class="q">
	                        *Q<%= sqdto.get(i).getNumques()%>. <%= sqdto.get(i).getQuestion()%>
	                    </div>
	                <%
	                	}
	                %>
	                    <div class="op">
	                        <div class="sop">
	                            <input type="radio" name="op<%=sqdto.get(i).getNumques()%>" class="rd" value="<%= sqdto.get(i).getNumselect()%>">
	                            <span><%= sqdto.get(i).getConselect()%></span>
	                        </div>
	                    </div>
	                </div>
	            <%
            		}
	            %>
                <div class="sbtn">
                    <button type="submit" class="sb">제출</button>
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
</body>
</html>