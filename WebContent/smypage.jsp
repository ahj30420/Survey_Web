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
        .content{
            height:25rem;
            width:74rem;
            margin-left:10%;
        }
        .content>p{
            line-height:25rem;
            text-align:center;
            color:gray;
            font-weight:bolder;
            font-size:40px;
        }
        .qp_container{
            width:80%;
            margin-left:10%;;
            margin-top:50px;
            margin-bottom:10px;
            display:flex;
            flex-wrap:wrap;
            justify-content: space-evenly;
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
            margin-top:-30px;
            margin-left:30px;
            width:80%;
            height:98%;
        }
        .opdiv span{
            font-size:17px;
        }
        .opdiv{
        	margin-bottom: 10px;
        	display: flex;
			justify-content: space-between;
        }
        .selection{
        	width:250px;
        }
        .participation{
        	width:50px;
        	display:flex;
        }
        .pimg{
        	width:50%;
        	background-image:url("./image/people3.png");
        	background-repeat:no-repeat;
            background-size:cover;
            background-position:center;
            opacity : 0.3;
        }
        .count{
        	width:50%;
        	color:red;
        }
        .btn{
            height:8px;
        }
        .delete{
            margin-top:13px;
            margin-left:335px;
            width:20px;
            height:20px;
            background-image: url("./image/trash.png");
            background-position: center;
            background-size: contain;
            background-repeat: no-repeat;
            background-color: white;
            border-radius: 50%;
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
        <%
        	ArrayList<QpDto> myqp = (ArrayList) session.getAttribute("myqp");
        	ArrayList<QpselectDto> myqpselect = (ArrayList) session.getAttribute("myqpselect");
        	ArrayList<QpcpcountDto> qpcount = (ArrayList) session.getAttribute("qpcount");
        	ArrayList<String> selects = new ArrayList<String>();
        	System.out.println(myqp.size());
        	System.out.println(myqpselect.size());
        	System.out.println(qpcount.size());
        	System.out.println(selects.size());
        	int[] arr = new int[4];
        	Arrays.fill(arr,0);
 
        	int x = 0;
        	int y = 0;
        	int k = 0;
        	
        	if(myqp.size() == 0){
        %>
        <div class="content">
            <p>-등록된 퀵폴이 없습니다.-</p>
        </div>
        <%
        	}
        	else{
        
        %>
          <div class="qp_container">
        <%
        		for(int i = 0; i < myqp.size(); i++){
    				for(int j = x; j < 4*(i+1); j++){
        				if(i == y){
        %>
	            <div class="de">
	                <div class="btn">
	                    <form action="qpdelete.do">
	                        <button type="submit" class="delete" name="qpdelete" value="<%=myqp.get(i).getQind()%>"></button>
	                    </form>
	                </div>
	                <div class="img1" style="background-image:url(<%= myqp.get(i).getImage()%>)"></div>
	                <div class="ti">
	                    <span>Q.</span><%= myqp.get(i).getQuestion() %>
	                </div>
	                <div class="dl">
	                    <%= myqp.get(i).getDeadline() %>
	                </div>
	                
	    <%
	    			y++;
        				}
        				int nums = myqpselect.get(j).getNumselect();
        				String s = myqpselect.get(j).getConselect();
        				selects.add(s);
        			}
    			if(qpcount.size() != 0){
	    			if(k != qpcount.size()-1){	
	    				while(qpcount.get(k).getQind() == myqp.get(i).getQind()){
	    					arr[qpcount.get(k).getSelection()-1] = qpcount.get(k).getCount();
	    					k++;
	    					if(k >= qpcount.size()){
	    						break;
	    					}
	    				}
	    			}
	    			else{	
	    				while(qpcount.get(k).getQind() == myqp.get(i).getQind()){
	    					arr[qpcount.get(k).getSelection()-1] = qpcount.get(k).getCount();
	    					break;
	    				}
	    			}		
    			}
	    %>
	                <div class="op">
	                    <form action="#">
	                        <div class="vote">
	                        	<div class = "opdiv">
	                        		<div class = "selection">
	                                 	<input type="radio" name="op1" class="rd" disabled>
	                                 	<span><%= selects.get(0) %></span>
	                                 </div>
	                                 <div class = "participation">
	                                 	<div class="pimg"></div>
	                                 	<div class="count"><%=arr[0]%></div>
	                                 </div>
                            	</div>
                            	<div class = "opdiv">
	                                <div class = "selection">
	                                 	<input type="radio" name="op1" class="rd" disabled>
	                                 	<span><%= selects.get(1) %></span>
	                                 </div>
	                                 <div class = "participation">
	                                 	<div class="pimg"></div>
	                                 	<div class="count"><%=arr[1]%></div>
	                                 </div>
                         		</div>
                         		<div class = "opdiv">
	                                <div class = "selection">
	                                 	<input type="radio" name="op1" class="rd" disabled>
	                                 	<span><%= selects.get(2) %></span>
	                                 </div>
	                                 <div class = "participation">
	                                 	<div class="pimg"></div>
	                                 	<div class="count"><%=arr[2]%></div>
	                                 </div>
                         		</div>
                         		<div class = "opdiv">
	                                <div class = "selection">
	                                 	<input type="radio" name="op1" class="rd" disabled>
	                                 	<span><%= selects.get(3) %></span>
	                                 </div>
	                                 <div class = "participation">
	                                 	<div class="pimg"></div>
	                                 	<div class="count"><%=arr[3]%></div>
	                                 </div>
                                 </div>
                             </div>
	                    </form> 
	                </div>
	            </div>  		
        <%			
        			Arrays.fill(arr,0);
    				x = 4*(i+1);
  					selects.clear();
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