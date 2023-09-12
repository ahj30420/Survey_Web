<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .content{
            width:74rem;
            margin-top:100px;
            margin-left:8%;
            margin-bottom:4%;
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
            border:none;
            border-radius: 5px;
            background-color:red;
            height:40px;
            width:43%;
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
                <li><a href="slogin.jsp">로그인</a></li>
                <li><a href="sregister.jsp">회원가입</a></li>
                <li>카테고리
                    <ul class="category">
                        <li><a href="#">설문조사</a></li>
                        <li><a href="#">퀵폴</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <section>
        <div class="content">
            <div class="notice">
                <span>회원가입</span><br><br>
                정확한 정보를 입력하셔야 서베이링크에서 진행중인 다양한 설문조사에 참여하실 수 있습니다.
            </div>
            <form action="register.do">
                <div class="id">
                    <pre>아이디</pre>
                    <input type="text" name="id" class="iid" placeholder="영문,숫자 5~11자" >
                </div>
                <div class="pw">
                    <pre>비밀번호</pre>
                    <input type="password" name="pw" class="ipw" placeholder="숫자,영문,특수문자 조합 최소 8자">
                    <input type="password" name="cpw" class="icpw" placeholder="비밀번호 재입력">
                </div>
                <div class="nm">
                    <pre>이름</pre>
                    <input type="text" name="name" class="iname" placeholder="이름 입력" >
                </div>
                <div class="em">
                    <pre>이메일</pre>
                    <input type="email" name="email" class="iemail" placeholder="12345@HSP.com" >
                </div>
                <div class="phone">
                    <pre>전화번호</pre>
                    <input type="number" name="tel" class="itel" placeholder="'ㅡ' 제외 입력">
                </div>
                <div class="line"></div>
                <div class="agg">
                    <input type="checkbox" class="iagg" id="agg" required>
                    <label for="agg">개인정보 수집 및 이용에 동의합니다.</label>
                </div>
                <div class="cp">
                    <button type="submit">가입</button><br>
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
                <a href="inquiry.do">1:1문의</a>
                </p>
            </div>
        </div>
    </footer> 
</body>
</html>