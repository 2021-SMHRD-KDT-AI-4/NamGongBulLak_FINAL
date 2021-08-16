<%@page import="model.MemberDTO"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ����Ʈ -->
    <link rel="stylesheet" href="./static/css/style.css" />
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">   
        $(document).ready(function() {
			$("#navi").load("./navigation.jsp");
		});
	</script>
	<!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <title>EditProfile</title>
</head>
<body>
	<%
		MemberDTO memInfo = (MemberDTO)session.getAttribute("info");
	%>
    <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
        <!-- ��� �׺���̼� -->
        <div id="navi"></div>
        <!-- ���� ���� -->
        <div style="height: 2rem;"></div>
        <!-- ���� �� -->
        <form action="UpdateService" method="post">
            <div style="height: 22.5rem; width: 22.5rem; margin: auto;">
                <!-- ������ �̹��� -->
                <input id="uploadImg" name="profile_image" type="file" style="display: none;">
                <label for="uploadImg">
                    <img src="./data/profile_image/upload_image.png" id="previewImg" style="width: 100%; height: 100%; border: 0.25rem solid #ffffff; border-radius: 50%;">
                </label>
            </div>
            <div style="height: 2rem;"></div>
            <div style="height: 16.5rem; display: flex; justify-content: space-between; flex-direction: column; align-items: center; font-family: 'GmarketSansTTFBold';">
                <div style="width: 28rem; display: flex; justify-content:space-between; align-items: center;">
                    <!-- ���̵� -->
                    <div style="margin: auto;">ID</div>
                    <input type="text" name="id" value="<%=memInfo.getId() %>" style="width: 15rem; height: 2.5rem; border: 0.0625rem solid #000; border-radius: 0.5rem; background-color: #cfcfcf;">
                </div>
                <div style="width: 28rem; display: flex; justify-content: space-between; align-items: center;">
                    <!-- ��й�ȣ -->
                    <div style="margin: auto;">PW</div>
                    <input type="password" name="pw" value="" style="width: 15rem; height: 2.5rem; border: 0.0625rem solid #000; border-radius: 0.5rem;">
                </div>
                <div style="width: 28rem; display: flex; justify-content: space-between; align-items: center;">
                    <!-- �г��� -->
                    <div style="margin: auto;">NICKNAME</div>
                    <input type="text" name="nickname" placeholder="�г��� ����" style="width: 15rem; height: 2.5rem; border: 0.0625rem solid #000; border-radius: 0.5rem;">
                </div>
                <div style="width: 28rem; display: flex; justify-content: space-between; align-items: center;">
                    <!-- ���� -->
                    <div style="margin: auto;">COUNTRY</div>
                    <select name="country" style="width: 15rem; height: 2.5rem; border: 0.0625rem solid #000; border-radius: 0.5rem;">
                        <option value="korea">���ѹα�</option>
                        <option value="china">�߱�</option>
                        <option value="japan">�Ϻ�</option>
                        <option value="usa">�̱�</option>
                    </select>
                </div>
                <div style="width: 28rem; display: flex; justify-content: space-between; align-items: center;">
                    <!-- ��Ŀ ���� ���� ���� -->
                    <div style="margin: auto;">SHARING</div>
                    <div style="margin: auto;">
                        <input type="radio" name="share_agree" value="Y" id="agree" checked><label for="agree">����</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="share_agree" value="N" id="disagree"><label for="disagree">�ź�</label>
                    </div>
                </div>
            </div>
            <div style="height: 2rem;"></div>
            <input type="submit" value="�����ϱ�" style="width: 6rem; height: 2.5rem; background-color: #000; color: #ffffff; border: 0.03125rem solid #ffffff; border-radius: 0.5rem;">
        </form>
    </div>
<script type="text/javascript" src="./static/js/preview_image.js"></script>    
</body>
</html>