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
    <script type="text/javascript">   
        $(document).ready(function() {
			$("#navi").load("./navigationEN.jsp");
		});
        sessionStorage.clear();
        sessionStorage.setItem("login", "loginEN");
        console.log(sessionStorage.getItem("login"));
	</script>
    <title>Login</title>
</head>
<body>
    <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
        <!-- 상단 네비게이션 -->
        <div id="navi"></div>
        <!-- 메인 내용 -->
        <div style="height: 6.25rem;"></div>
        <!-- 로고 -->
        <img src="./static/img/kdcc-logo.png" style="height: 22.5rem; width: 22.5rem;">
        <div style="height: 1rem;"></div>
        <!-- 로그인 폼 -->
        <form action="Loginservice">
        	<input type = "hidden" name = "a" value = "EN">
            <div style="display: flex; justify-content: center;" >
                <div style="display: flex; flex-direction: column;">
                    <!-- 아이디 -->
                    <input type="text" name = "id" placeholder="Please enter your ID" style="width: 15rem; height: 2.5rem; border: 0.0625rem solid #707070; border-top-left-radius: 0.5rem;">
                    <!-- 비밀번호 -->
                    <input type="password" name = "pw" placeholder="Please enter your PW" style="width: 15rem; height: 2.5rem; border-left: 0.0625rem solid #707070; border-right: 0.0625rem solid #707070; border-bottom: 0.0625rem solid #707070; border-bottom-left-radius: 0.5rem;">
                </div>
                <!-- 로그인 버튼 -->
                <input type="submit" value="SignIn" style="width: 5rem; background-color: black; color: white; border-top: 0.0625rem solid #707070; border-right: 0.0625rem solid #707070; border-bottom: 0.0625rem solid #707070; border-top-right-radius: 0.5rem; border-bottom-right-radius: 0.5rem;">
            </div>
        </form>
    </div>
</body>
</html>