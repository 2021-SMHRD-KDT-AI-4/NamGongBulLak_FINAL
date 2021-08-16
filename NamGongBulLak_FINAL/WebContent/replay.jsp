<%@page import="model.MemberDTO"%>
<%@page import="model.ReplayDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MyDanceinfoDAO"%>
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
			$("#navi").load("./navigationKR.jsp");
		});
	</script>
	<!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <title>Replay</title>
</head>
<body style="overflow: overlay;">
	<%
		MemberDTO memInfo = (MemberDTO)session.getAttribute("info");
		String id = memInfo.getId();
		//System.out.println("넘어가?1");
		MyDanceinfoDAO dao = new MyDanceinfoDAO();
		//System.out.println("넘어가?2");
		ArrayList<ReplayDTO> list = dao.replay_view(id);
		//System.out.println("넘어가?3");
	%>

    <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
        <!-- 상단 네비게이션 -->
        <div id="navi"></div>
        <!-- 메인 내용 -->
        <div style="height: 2.5rem;"></div>
        <div style="width: 113rem; margin: auto; display: grid; grid-template-columns: 1fr 1fr 1fr; column-gap: 2.5rem; font-size: 1.2rem;">
            
            
            <%
            	System.out.println("test1");
				for(int i = 0; i < list.size(); i++){
					
			%>
            
            <div style="margin-bottom: 1.0rem;">
                <!-- 반복 -->
                <!-- 영상 -->
                <video src="./static/video/<%= list.get(i).getUser_filename() %>" controls preload="metadata" style="width: 36rem; height: 20.25rem;"></video>
                <!-- 영상 제목? -->
                <br><%= list.get(i).getPlay_date() %>
                <br><%= list.get(i).getSong_title() %> - <%= list.get(i).getSong_singer() %>
                <br>Score - <%= list.get(i).getUser_accuracy() %>
            </div>
            
            <% 
				}
			%>
            
        </div>
    </div>
</body>
</html>