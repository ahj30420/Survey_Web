<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
    body{
        background-color:rgb(64, 52, 52);
    }
    .container{
        width:500px;
        height:400px;
        position:absolute;
        top:50%; left:50%;
        margin-left:-250px; margin-top:-200px;
    }
    .title{
        font-weight:bolder;
        text-align:center;
    }
    .m{
        font-size:60px;
        color:white;
    }
    .s{
        font-size:25px;
        color:gray;
    }
    table{
        margin-top:20px;
        margin-left:55px;
        width:400px;
        border-radius:10px;
    }
    td{
        border:none;
        background-color: white;
    }
    tr{
        height:50px;
    }
    tr>td:first-child{
        text-align:center;
        width:15%;
        font-size:20px;
        color: gray;
        background-color: lightgray;
    }
    .one{
        border-radius:10px 0px 0px 0px;
    }
    .two{
        border-radius:0px 0px 0px 10px;
    }
    td>input{
        height:50px;
        width:99%;
    }
    input[type="text"]{
        border-radius:0px 10px 0px 0px;
    }
    input[type="password"]{
        
        border-radius:0px 0px 10px 0px;
    }
    tr:first-child>td:last-child{
        background-color: white;
        border-radius:0px 10px 0px 0px;
    }
    tr:last-child>td:last-child{
        border-radius:0px 0px 10px 0px;
    }
    input{
        border:none;
    }
    input[type="submit"]{
        margin-top:20px;
        margin-left:55px;
        width:400px;
        height:40px;
        font-weight: bolder;
        font-size:20px;
        border-radius:10px;
        color:white;
        background-color: red;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="title">
            <div class="m">HSP</div>
            <div class="s">Administration</div>
        </div>
        <div class="info">
            <form action="ad_login.do">
                <table>
                    <tr>
                        <td class="one">ID</td><td><input type="text" name="id" placeholder="아이디를 입력하세요"></td>
                    </tr>
                    <tr>
                        <td class="two">PW</td><td><input type="password" name="pw" placeholder="비밀번호를 입력하세요"></td>
                    </tr>
                </table>
                <input type="submit" value="Log In">
            </form>
        </div>
    </div>
</body>
</html>