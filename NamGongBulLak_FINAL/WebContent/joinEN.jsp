<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ����Ʈ -->
    <link rel="stylesheet" href="./static/css/style.css" />
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <title>Join</title>
</head>
<body>
    <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
        <!-- ��� �׺���̼� -->
        <div id="navi"></div>
        <!-- ���� ���� -->
        <div style="height: 2rem;"></div>
        <!-- ���� �� -->
        <form action="a">
            <div style="height: 22.5rem; width: 22.5rem; margin: auto;">
                <!-- ������ �̹��� -->
                <input id="uploadImg" type="file" style="display: none;">
                <label for="uploadImg">
                    <img src="./static/img/upload_image.png" id="previewImg" style="width: 100%; height: 100%; border: 0.25rem solid #ffffff; border-radius: 50%;">
                </label>
            </div>
            <div style="height: 2rem;"></div>
            <div style="height: 16.5rem; display: flex; justify-content: space-between; flex-direction: column; align-items: center; font-family: 'GmarketSansTTFBold';">
                <div style="width: 28rem; display: flex; justify-content:space-between; align-items: center;">
                    <!-- ���̵� -->
                    <div style="margin: auto;">ID</div>
                    <input type="text" style="width: 15rem; height: 2.5rem; border: 0.0625rem solid #000; border-radius: 0.5rem;">
                </div>
                <div style="width: 28rem; display: flex; justify-content: space-between; align-items: center;">
                    <!-- ��й�ȣ -->
                    <div style="margin: auto;">PW</div>
                    <input type="password" style="width: 15rem; height: 2.5rem; border: 0.0625rem solid #000; border-radius: 0.5rem;">
                </div>
                <div style="width: 28rem; display: flex; justify-content: space-between; align-items: center;">
                    <!-- �г��� -->
                    <div style="margin: auto;">NICKNAME</div>
                    <input type="text" style="width: 15rem; height: 2.5rem; border: 0.0625rem solid #000; border-radius: 0.5rem;">
                </div>
                <div style="width: 28rem; display: flex; justify-content: space-between; align-items: center;">
                    <!-- ���� -->
                    <div style="margin: auto;">COUNTRY</div>
                    <select style="width: 15rem; height: 2.5rem; border: 0.0625rem solid #000; border-radius: 0.5rem;">
                        <option value="korea">REPUBLIC OF KOREA</option>
                        <option value="china">CHINA</option>
                        <option value="japan">JAPAN</option>
                        <option value="usa">U.S.A</option>
                    </select>
                </div>
                <div style="width: 28rem; display: flex; justify-content: space-between; align-items: center;">
                    <!-- ��Ŀ ���� ���� ���� -->
                    <div style="margin: auto;">SHARING</div>
                    <div style="margin: auto;">
                        <input type="radio" name="hi" id="agree" checked><label for="agree">Agree</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="hi" id="disagree"><label for="disagree">DisAgree</label>
                    </div>
                </div>
            </div>
            <div style="height: 2rem;"></div>
            <input type="submit" value="ȸ������" style="width: 6rem; height: 2.5rem; background-color: #000; color: #ffffff; border: 0.03125rem solid #ffffff; border-radius: 0.5rem;">
        </form>
    </div>
    
    <script type="text/javascript">
        $(document).ready(function() {
			$("#navi").load("./navigationEN.jsp");
		});
        sessionStorage.clear();
        sessionStorage.setItem("join", "joinEN");
        console.log(sessionStorage.getItem("join"));
	</script>
	
	
</body>
<script type="text/javascript" src="./static/js/preview_image.js"></script>
</html>