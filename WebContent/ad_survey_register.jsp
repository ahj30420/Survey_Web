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
        width:79%;
    }
    .title{
        margin-top:50px;
        margin-left:40px;
        width:95%;
        padding-bottom:15px;
        font-weight:bolder;
        font-size:30px;
        border-bottom:3px solid gray;
    }
    .container{
        margin-top:3%;
        margin-bottom:4%;
        margin-left:29%;
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
        color:red;
        font-size:30px;
    }
    .qtitle{
        margin-left:15%;
        margin-top:8%;
    }
    .qsubtitle{
        margin-left:15%;
        margin-top:25px;
    }
    .qt{
        height:30px;
        width:81%;
    }
    .filebox{
        margin-top:25px;
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
    .question{
        margin-top:25px;
        margin-left:15%;
        width:71%;
        border-top: 3px solid gray;
    }
    .q{
        height:30px;
        width:98%;
    }
    .option{
        height:300px;
        display:flex;
        flex-direction: column;
        justify-content: space-evenly;
    }
    .op{
        width:98%;
        height:50px;
    }
    .delete{
        margin-left:86%;
        font-size:12px;
        color:red;
        border:1px solid red;
    }
    .delete{
        display:none;
    }
    .a{
        margin-left:86%;
        font-size:12px;
        color:red;
        border:1px solid red;
    }
    .date{
        float:left;
        margin-top:3px;
        margin-left:48px;
        margin-right:110px;
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
	.p{
        height:30px;
        width:80px;
        font-weight:bolder;
    }
    input[type="button"]{
        margin-top:30px;
        margin-left:15%;
        border:none;
        border-radius: 5px;
        background-color:red;
        height:40px;
        width:70%;
        font-weight: bolder;
        font-size:15px;
        color:white;
    }    
    input[type="submit"]{
        margin-top:30px;
        margin-left:15%;
        border:none;
        border-radius: 5px;
        background-color:red;
        height:40px;
        width:70%;
        font-weight: bolder;
        font-size:15px;
        color:white;
    }       
</style>
<script>
    let n = 1;
    let numques = 1;
    function deleteque(ind){
        const d = document.getElementById(ind);
        d.remove();
        const elem = document.getElementsByClassName("question");

        for(let i=0; i<elem.length; i++){
            if(i != elem.length-1){
                elem[i].getElementsByClassName("add")[0].style.display="none";
            }
            else{
                elem[i].getElementsByClassName("add")[0].style.display="block";
            }
        }
		numques--;
    }
    function addque(){
        n++;
        numques++;
        const elem = document.getElementsByClassName("question");
        let test = elem[0].cloneNode(true);
        let t = test.getElementsByTagName("input");
        for(let i =0; i<t.length; i++){
            t[i].value=null;
        }
        test.id='q'+n.toString();
        test.getElementsByClassName("delete")[0].id=test.id
        elem[elem.length-1].after(test);
        
        for(let i=0; i<elem.length; i++){
            if(i == 0){ 
                if(elem.length!=0){
                    elem[i].getElementsByClassName("add")[0].style.display="none";
                }
            }
            else if(i != elem.length-1){
                elem[i].getElementsByClassName("add")[0].style.display="none";
                elem[i].getElementsByClassName("delete")[0].style.display="block";
            }
            else{
                elem[i].getElementsByClassName("add")[0].style.display="block";
                elem[i].getElementsByClassName("delete")[0].style.display="block";
            }
        }
    }
    function quescount(){
    	const elem = document.getElementsByClassName("question");
    	for(let i = 0; i < elem.length; i++){
    		 let num = i+1;
    		 let t = elem[i].getElementsByTagName("input");
    		 t[0].setAttribute("name","q"+num);
   	         t[1].setAttribute("name","q"+num+"_op1");
   	         t[2].setAttribute("name","q"+num+"_op2");
   	         t[3].setAttribute("name","q"+num+"_op3");
    	     t[4].setAttribute("name","q"+num+"_op4");
    	}
    	const btn = document.querySelector('input[type="button"]');
    	btn.value = elem.length;
    	btn.setAttribute("type","submit");
    	btn.click();
    }
</script>
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
            <div class="sub" id="one"><a href="ad_user.do">사용자</a></div>
            <div class="sub"><a href="ad_ad.do">관리자</a></div>
            <div class="sub"><a href="ad_inquiry.do">문의 내역</a></div>
        </div>
        <div class="content">
            <div>콘텐츠 관리</div>
            <div class="sub"><a href="ad_survey.do" style="color:red;">서베이 (survey)</a></div>
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
        <div class="title">서베이 등록</div>
        <div class="container">
            <div class="tt">
                <span>Register</span><br><br>
                서베이 썸네일 이미지, 선택지 option, 마감일 등을 등록해주세요.
            </div>
            <form action="survey_register.do" method="post" enctype="multipart/form-data">
                <div class="qtitle">
                    <pre>제목</pre>
                    <input type="text" class="qt" name="qmt" placeholder="제목 입력">
                </div>
                <div class="qsubtitle">
                    <pre>부제목</pre>
                    <input type="text" class="qt" name="qst" placeholder="부제목 입력">
                </div>
                <div class="filebox">
                    <pre>이미지</pre>
                    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
                    <label for="file">파일찾기</label>
                    <input type="file" id="file" name = "simg" accept="image/gif,image/jpeg,image/png,image/jpg">
                </div>
                <div class="question">
                    <div class="que">
                        <pre>질문</pre>
                        <input type="text" class="q" name="q1" placeholder="질문 입력">
                    </div>
                    <div class="option">
                        <pre>선택지</pre>
                        <input type="text" class="op" name="q1_op1" placeholder="선택지 1.내용 입력" required>
                        <input type="text" class="op" name="q1_op2" placeholder="선택지 2.내용 입력" required>
                        <input type="text" class="op" name="q1_op3" placeholder="선택지 3.내용 입력">
                        <input type="text" class="op" name="q1_op4" placeholder="선택지 4.내용 입력">
                    </div>
                    <div class="del">
                        <a class="delete" id="q1" onclick="deleteque(this.id)">삭제하기</a>
                    </div>
                    <div class="add">
                        <a class="a" onclick="addque()">추가하기</a>
                    </div>
                </div>
                <div class="date">
                    <pre>설문조사 종료일</pre>
                    <input type="date" class="date_empty placeholder-date" name="date" data-placeholder="날짜 선택" required aria-required="true">
                </div>
                <div class="point">
                    <pre>포인트</pre>
                    <input type="number" class="p" name="point" data-placeholder="포인트" required>
                </div>
                <div class="cp">
                    <input type="button" onclick="quescount()" name="qc" value="등록">
                </div>
            </form>
        </div>
    </main>
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