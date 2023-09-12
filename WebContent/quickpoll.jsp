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
            background-image: url("./image/1.jpg");
            background-position-y:-100px;
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
        .qp_container{
            width:80%;
            margin-left:8%;;
            margin-top:10px;
            margin-bottom:10px;
            display:flex;
            flex-wrap:wrap;
            justify-content: space-between;
        }
        .de{
            width: 30%;
            height:500px;
            margin-bottom: 30px;
            font-size:15px;
            font-weight:bolder;
            border-radius: 10px;
            box-shadow: 2px 2px 2px rgb(216, 211, 211);
        }
        .op{
            margin-top:10px;
            padding-top:25px;
            height:200px;
        }
        .img1{
            margin-top:30px;
            margin-left:35px;
            width:80%;
            height:50%;
            background-repeat:no-repeat;
            background-size:cover;
            background-position:center;
            border-radius:10px 10px 0px 0px;
        }
        .ti{
            margin-top:10px;
            margin-left:35px;
            padding-bottom:5px;
            width:80%;
            font-weight:bolder;
            font-size:20px;
            border-bottom:2px solid gray;
        }
        .dl{
            margin-top:10px;
            margin-left:250px;
            width:fit-content;
            font-size:12px;
            color:gray;
        }
        .vote{
            margin-top:-40px;
            margin-left:45px;
            width:80%;
            height:98%;
        }
        .bt{
            margin-top:15px;
            margin-left:-14px;
            width:290px;
            height:35px;
            border:none;
            border-radius: 20px;
            font-weight: bolder;
            font-size:17px;
            color:white;
            background-color:red;
        }
        .sop{
            margin-top:20px;
            margin-left:-13px;
        }
        .sub1{
            float:left;
            width:50%;
        }
        .sub3{
            float:left;
            width:50%;
        }
        .sop span{
            font-size:17px;
        }
        .rd{
            accent-color:red;
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
                       		<li><a href="surveys.jsp">설문조사</a></li>
                        	<li><a href="qp.do">퀵폴</a></li>
                   		</ul>
               		</li>
                </ul>
               	</c:if>
            </div>
            <div class="exp_container">
                <div class="title">
                    Quick Poll
                </div>
                <div class="content">
                    사람들과 소통할수있는<br>
                    <span>퀵폴</span>시스템을 이용해보세요.
                </div>
            </div>
            <form action="#">
                <div class="view_container">
                    <div class="exp">
                        사람들과 편하게 소통하고<br>
                        의견을 받아보세요.<br>
                        모바일로도 가능합니다.<br>
                        <div class="apply">사용자 설문조사</div>     
                    </div>
                </div>
            </form>
        </div>
    </nav>

    <section>
        <div class="qp_container">
        <%
        	ArrayList<QpDto> qpdto = (ArrayList)session.getAttribute("qpdto");
        	ArrayList<QpselectDto> qpselect = (ArrayList)session.getAttribute("qpselect");
        	ArrayList<String> selects = new ArrayList<String>();
        	ArrayList<Integer> numselect = new ArrayList<Integer>();
        	ArrayList<Integer> comqind = (ArrayList)session.getAttribute("comqind");
        	ArrayList<Integer> comqpselection = (ArrayList)session.getAttribute("comqpselection");
        	
        	int x = 0;
        	int y = 0;
        	int k = 0;
        	
        	if(qpdto.size() != 0){
        		for(int i = 0; i < qpdto.size(); i++){
        			for(int j = x; j < 4*(i+1); j++){
        				if(i == y){
		%>
					<div class="de">
		                <div class="img1" style="background-image:url(<%= qpdto.get(i).getImage()%>)"></div>
		                <div class="ti">
		                    <span>Q.</span><%=qpdto.get(i).getQuestion() %>
		                </div>
		                <div class="dl">
	                    <%=qpdto.get(i).getDeadline() %>
	                	</div>
		<%        					
							y++;
        				}
        				int nums = qpselect.get(j).getNumselect();
        				String s = qpselect.get(j).getConselect();
        				selects.add(s);
        				numselect.add(nums);
        			}
        			
        			if(comqind.size() == 0){
  		%>
  					<div class="op">
                    <form action="submitqp.do">
                        <div class="vote">
                            <div class="sop">
                                <div class="sub1">
                                    <input type="radio" name="op1" class="rd" value="<%=numselect.get(0)%>/<%=qpdto.get(i).getQind() %>">
                                    <span><%=selects.get(0)%></span>
                                </div>
                                <div class="sub2">
                                    <input type="radio" name="op1" class="rd" value="<%=numselect.get(1)%>/<%=qpdto.get(i).getQind() %>">
                                    <span><%=selects.get(1)%></span>
                                </div>
                            </div>
                            <div class="sop">
                                <div class="sub3">
                                    <input type="radio" name="op1" class="rd" value="<%=numselect.get(2)%>/<%=qpdto.get(i).getQind() %>">
                                    <span><%=selects.get(2)%></span>
                                </div>
                                <div class="sub4">
                                    <input type="radio" name="op1" class="rd" value="<%=numselect.get(3)%>/<%=qpdto.get(i).getQind() %>">
                                    <span><%=selects.get(3)%></span>
                                </div>
                            </div>
                            <button type="submit" class="bt">투표하기</button>
                        </div>
                    </form> 
                </div>
            </div>
        <%}			
        			else{
        				boolean com = false;
        				int selection = -1;
        				if(k != comqind.size()-1){
        					if(qpdto.get(i).getQind() == comqind.get(k)){
        						com = true;
        						selection = comqpselection.get(k);
        						k++;
        					}
        				}
        				else{
        					if(qpdto.get(i).getQind() == comqind.get(k)){
        						com = true;
        						selection = comqpselection.get(k);
        					}
        				}
        				if(com){
        %>	
        			<div class="op">
                    <form action="submitqp.do">
                        <div class="vote">
                            <div class="sop">
                                <div class="sub1">
                                <%
                                	if(selection == 1){
                                %>
                                    <input type="radio"  name="op2" class="rd" checked disabled>
                                <%
                                	}
                                	else{
                                %>
                                	<input type="radio"  name="op2" class="rd" disabled>
                                <%
                                	}
                                %>
                                    <span><%=selects.get(0)%></span>
                                </div>
                                <div class="sub2">
                                <%
                                	if(selection == 2){
                                %>
                                    <input type="radio"  name="op2" class="rd" checked disabled>
                                <%
                                	}
                                	else{
                                %>
                                	<input type="radio"  name="op2" class="rd" disabled>
                                <%
                                	}
                                %>
                                    <span><%=selects.get(1)%></span>
                                </div>
                            </div>
                            <div class="sop">
                                <div class="sub3">
                                <%
                                	if(selection == 3){
                                %>
                                    <input type="radio"  name="op2" class="rd" checked disabled>
                                <%
                                	}
                                	else{
                                %>
                                	<input type="radio"  name="op2" class="rd" disabled>
                                <%
                                	}
                                %>
                                    <span><%=selects.get(2)%></span>
                                </div>
                                <div class="sub4">
                                <%
                                	if(selection == 4){
                                %>
                                    <input type="radio"  name="op2" class="rd" checked disabled>
                                <%
                                	}
                                	else{
                                %>
                                	<input type="radio"  name="op2" class="rd" disabled>
                                <%
                                	}
                                %>
                                    <span><%=selects.get(3)%></span>
                                </div>
                            </div>
                            <button type="submit" class="bt" style="background-color:gray;" disabled>투표완료</button>
                        </div>
                    </form> 
                </div>
            </div>								
        <%}
        		else{
		%>
				<div class="op">
                    <form action="submitqp.do">
                        <div class="vote">
                            <div class="sop">
                                <div class="sub1">
                                    <input type="radio" name="op1" class="rd" value="<%=numselect.get(0)%>/<%=qpdto.get(i).getQind() %>">
                                    <span><%=selects.get(0)%></span>
                                </div>
                                <div class="sub2">
                                    <input type="radio" name="op1" class="rd" value="<%=numselect.get(1)%>/<%=qpdto.get(i).getQind() %>">
                                    <span><%=selects.get(1)%></span>
                                </div>
                            </div>
                            <div class="sop">
                                <div class="sub3">
                                    <input type="radio" name="op1" class="rd" value="<%=numselect.get(2)%>/<%=qpdto.get(i).getQind() %>">
                                    <span><%=selects.get(2)%></span>
                                </div>
                                <div class="sub4">
                                    <input type="radio" name="op1" class="rd" value="<%=numselect.get(3)%>/<%=qpdto.get(i).getQind() %>">
                                    <span><%=selects.get(3)%></span>
                                </div>
                            </div>
                            <button type="submit" class="bt">투표하기</button>
                        </div>
                    </form> 
                </div>
            </div>			
		<%        						
        			}
        	}
        %>
  		<%	
        			x = 4*(i+1);
  					selects.clear();
  					numselect.clear();
        		}
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