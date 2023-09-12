<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        margin-top:8%;
        margin-bottom:5%;
        width:80%;
        height:16%;
    }
    .title{
        margin-top:5%;
        font-weight:bolder;
        font-size:40px;
        color:black;
    }
    .content{
        margin-top:2%;
        padding-bottom:20px;
        font-weight: bolder;
        font-size:17px;
        color:gray;
        border-bottom:2px solid black;
    }
    .content input{
        margin-left:620px;
        height:30px;
        background-color: white;
        color:red;
        border:1px solid red;
    }
    .bd{
        margin-top: 20px;
        margin-left:20px;
        width:73.5rem;
    }
    .bd>p{
        line-height:12rem;
        text-align:center;
        color:gray;
        font-weight:bolder;
        font-size:20px;
    }
    table{
    	   margin-left:13px;
           table-layout:fixed;
           border-collapse:collapse;
           width:100%;
           border-top:1px solid black;
    }
    thead{
        background-color: rgb(245, 235, 235);
    }
    tr{
        height:45px;
        border-bottom:1px solid rgb(244, 241, 241);
    }
    tr>td:last-child{
        overflow:hidden;
        white-space : nowrap;
        text-overflow: ellipsis;
    }
    td{
        text-align:center;
    }
    th:first-child{
        width:20%;
    }
    th:nth-child(3){
        width:60%;
    }
    th:last-child{
        width:10%;
    }
    .delete{
        color:red;
        border:1px solid red;
        background-color: white;
    }
    td>a{
        color:red;
        text-decoration: underline;
    }
    .ft{
    	position: fixed;
    	bottom:0px;
    	width:100%;
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
        <div class="main_container">
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
        </div>
    </nav>

    <section>
        <div class="exp_container">
            <div class="title">
                1:1문의
            </div>
            <form action="reinquiry.jsp">
	            <div class="content">
	                공지사항 및 궁금한 사항을 아래에서 보거나 질문할 수 있습니다.
	                <input type="submit" class="inquiry" value="1:1문의하기">
	            </div>
            </form>
            
            <%
            	ArrayList<InquiryDto> inqdto = (ArrayList)session.getAttribute("inqdto");
            	if(inqdto.size() == 0){
            %>
	            <div class="bd" style="height:12rem; border:2px dashed gray; border-radius:10px;">
	                <p>-등록하신 1:1 문의가 없습니다.-</p>
	            </div>
           	<%
            	}
            	else{
           	%>
           		<div class="bd">
	                <table>
	                    <thead>
	                        <tr>
	                            <th>작성일</th><th>답변</th><th>질문내용</th><th></th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <form action="inquirydelete.do">
	                        <% 
	                        	for(int i = 0; i < inqdto.size(); i++){
	                        %>
	                            <tr>
	                                <td><%= inqdto.get(i).getRedate()%></td>
	                                <%
	                                	String status = inqdto.get(i).getStatus();
	                                	if(status.equals("답변대기")){
	                                %>
	                                	<td><%= inqdto.get(i).getStatus()%></td>
	                                <%
	                                	}
	                                	else{
	                                %>
										<td><a href="lookanswer.do?inquiryind=<%= inqdto.get(i).getIqind()%>"><%= inqdto.get(i).getStatus()%></a></td>
									<%
	                                	}
									%>
	                                <td><%= inqdto.get(i).getConinquiry()%></td>
	                                <td><button type="submit" class="delete" name="delinquiry" value="<%=inqdto.get(i).getIqind() %>">삭제</button></td>
	                            </tr>
	                        <%
	                        	}
	                        %>
	                        </form>
	                    </tbody>
	                </table>
	            </div> 	
            <%
            	}
            %>
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