<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 임포트 -->
    <link rel="stylesheet" href="./static/css/style.css" />
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <title>Navigation</title>
</head>
<body>
<%
MemberDTO info = (MemberDTO)session.getAttribute("info");
%>
    <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 7.5rem; color: white; display: flex; align-items: center;">
        <!-- 메뉴 버튼 -->
        <div style="width: 55.25rem; height: 2.5rem; margin-left: 1rem">
            <input type="checkbox" id="menuicon">
            <label for="menuicon">
                <span></span>
                <span></span>
                <span></span>
            </label>
            <!-- 메뉴 -->
            <div id="menu"></div>
        </div>
        <!-- 네비게이션 로고 -->
        <div style="width: 7.5rem; height: 7.5rem;">
            <a href="./mainKR.jsp"><img src="./static/img/imgs/logo2.png" style="width: 100%; height: 100%;"></a>
        </div>
        <!-- 네비게이션 버튼들 -->
        <div id="d1" style="width: 56.25rem; height: 7.5rem; display: flex; align-items: center; justify-content: flex-end; font-family: 'Bangtan';">
            <!-- 로그인 했을 시 -->
            <%if(info!=null){ %>
            <a id="na1" href="./mypageKR.jsp" style="margin: 0 1rem;">마이페이지</a>
            <a id="na2" href="./Logoutservice?a=KR" style="margin: 0 1rem;">로그아웃</a>
             <%} %>
            <!-- 로그인 안했을 시 -->
            <%if(info==null){ %>
            	<a id="na3" href="./loginKR.jsp" style="margin: 0 1rem;">로그인</a>
            	<a id="na4" href="./joinKR.jsp" style="margin: 0 1rem;">회원가입</a>
            <%} %>
            <!-- 언어 설정 버튼 -->
            <img src="./static/icon/global_white.png" style="width: 60px; height: 60px; margin: 0 1rem;" onclick="tl1()">
        </div>
        
        
        
        <div id="d2" style="width: 30vw; height: auto; display: none; align-items: center; justify-content: flex-end; font-family: 'Bangtan';">
            <!-- 로그인 했을 시 -->
           
            <a id="na1" href="./mypage.html" style="margin: 0 1rem;">MyPage</a>
            <a id="na2" href="" style="margin: 0 1rem;">LogOut</a>
            <!-- 로그인 안했을 시 -->
            <%if(info!=null){ %>
            <a id="na3" href="./login.html" style="margin: 0 1rem;">SignIn</a>
            <a id="na4" href="./joinEN.jsp" style="margin: 0 1rem;">Join</a>
            <!-- 언어 설정 버튼 -->
             <%} %>
            <img src="./static/icon/global_white.png" style="width: 60px; height: 60px; margin: 0 1rem;" onclick="tl2()">
        </div>
    </div>
    <input type="hidden" value="0" id="tldata">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    
    //언어 변경을 위한 세션값 받아오기
 	var join = sessionStorage.getItem("join");
    var main = sessionStorage.getItem("main");
    var login = sessionStorage.getItem("login");
	var mypage = sessionStorage.getItem("mypage");
	var r_country = sessionStorage.getItem("R_country");
	var r_song = sessionStorage.getItem("R_song");
	var board = sessionStorage.getItem("board");
	var boardw = sessionStorage.getItem("boardw");
	var boardv = sessionStorage.getItem("boardv");
	var store = sessionStorage.getItem("store");
    
    console.log(main);
	function KR() {
		$("#menu").load("./menuKR.jsp");
	}
	function EN() {
		$("#menu").load("./menuEN.jsp");
	}
	
	function move(){
		if(join=="storeKR"){
			location.href="http://localhost:8082/Third_PJ/storeEN.jsp";
		}
		if(join=="joinKR"){
			location.href="http://localhost:8082/Third_PJ/joinEN.jsp";
		}
		if(main=="mainKR"){
			location.href="http://localhost:8082/Third_PJ/mainEN.jsp";
		}
		if(login=="loginKR"){
			location.href="http://localhost:8082/Third_PJ/loginEN.jsp";
		}
		if(mypage=="mypageKR"){
			location.href="http://localhost:8082/Third_PJ/mypageEN.jsp";
		}
		if(r_country=="R_countryKR"){
			location.href="http://localhost:8082/Third_PJ/ranking_countryEN.jsp";
		}
		if(r_song=="R_songKR"){
			location.href="http://localhost:8082/Third_PJ/ranking_songEN.jsp";
		}
		if(board=="boardKR"){
			location.href="http://localhost:8082/Third_PJ/boardEN.jsp";
		}
		if(boardw=="boardwKR"){
			location.href="http://localhost:8082/Third_PJ/boardwriteEN.jsp";
		}
	}
    
	 function tl1(){
	    	if(boardv!="boardvKR"){
	        	EN();
	        	move();
			}
	 }
    
    </script>
    <script type="text/javascript"> 
		$(document).ready(function() {
			$("#menu").load("./menuKR.jsp");
		});
	</script>
	
</body>
</html>