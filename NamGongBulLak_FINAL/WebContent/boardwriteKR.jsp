<%@page import="model.MemberDTO"%>
<%@page import="org.apache.tomcat.jni.Mmap"%>
<%@page import="model.MemberDAO"%>
<%@page import="model.BoardViewDTO"%>
<%@page import="model.BoardWriteDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DanceBoardDAO"%>
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
    <title>BoardWrite</title>
</head>
<body>
	<%
		System.out.println("넘어가?1");
	
	
		DanceBoardDAO dao = new DanceBoardDAO();
		
		
		System.out.println("넘어가?2");
		
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String id = info.getId();
		MemberDAO memberDAO = new MemberDAO();
		String premium = memberDAO.premiumCheck(id);
		System.out.println("프리미엄" + premium);
		
		ArrayList<BoardWriteDTO> list = dao.board_write(id);
		System.out.println("넘어가?3");
		
		String nickname = null;
		String select_play_date = null;
		String select_song_title = null;
		String select_song_singer = null;
		int select_user_acc = 0;
		String select_user_file_name = null;
		int play_seq = 0;
		
		
	%>
	
    <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
        <!-- 상단 네비게이션 -->
        <div id="navi"></div>
        <!-- 메인 내용 -->
        <%
			if (premium.equals("0")) {
		%>
				<script>
					function back(){
					     history.go(-1);
					}
				</script>
				<div><img src="./static/img/sorry2.png" style="width: 25rem;"></div>
				<div>프리미엄 회원만 게시물 작성이 가능합니다.</div>
				<div style="height: 3rem;"></div>
				<div>
					<input type="button" onclick=back() value="돌아가기" style="width: 5rem; height: 2.5rem; border: 0.0625rem solid white; border-radius: 0.5rem; background-color: black; color: white; margin: 0 2rem;">
					<input type="button" onclick="location.href='./mainKR.jsp'" value="메인으로" style="width: 5rem; height: 2.5rem; border: 0.0625rem solid white; border-radius: 0.5rem; background-color: black; color: white; margin: 0 2rem;">
				</div>
		<%
			} else if(list.isEmpty()) {
				
		%>
				<script>
					function back(){
						    history.go(-1);
					}
				</script>
				<div><img src="./static/img/sorry2.png" style="width: 25rem;"></div>
				<div>PlayDance를 1회 이상 진행해주세요.</div>
				<div style="height: 3rem;"></div>
				<div>
					<input type="button" onclick=back() value="돌아가기" style="width: 5rem; height: 2.5rem; border: 0.0625rem solid white; border-radius: 0.5rem; background-color: black; color: white; margin: 0 2rem;">
					<input type="button" onclick="location.href='./main.html'" value="메인으로" style="width: 5rem; height: 2.5rem; border: 0.0625rem solid white; border-radius: 0.5rem; background-color: black; color: white; margin: 0 2rem;">
				</div>
		<%
			} else {
		%>
        <div style="height: 4rem;"></div>
        <div style="width: 68rem; height: 39.25rem; margin: auto; display: flex; flex-direction: row;">
            <div style="width: 25.5rem; height: 33rem; margin: auto 4.5rem auto 0;">
                <!-- 작성자 리플레이 목록 -->
                <div style="height: 2.5rem; font-family: 'GmarketSansTTFBold'; font-size: 1.2rem;"><%= list.get(0).getNickname() %>님의 리플레이 목록</div>
                <div style="height: 30.5rem; width: 25.5rem; background-color: rgba(0, 0, 0, 0.5); border: 0.0625rem solid white; border-radius: 1rem;">
                    <div style="height: 28.5rem; width: 23.5rem; margin: 1rem; overflow: overlay;">
                       
					<%
						for(int i = 0; i < list.size(); i++){
					%>
	                        <!-- 리플레이 1 -->
	                       	<div class="replayList" style="display: flex">
		                        <div style="width: 12rem; height: 6.75rem; margin-right: 1rem; margin-bottom: 0.5rem;">
		                            <!-- 영상 썸네일 -->
		                            <video src="./static/video/<%= select_user_file_name = list.get(i).getUser_filename() %>#t=1" preload="metadata" style="width: 100%; height: 100%;"></video>
		                        </div>
		                        <div style="width: 10.5rem; height: 6.75rem; font-size: 0.8rem; text-align: left; display: flex; flex-direction: column; justify-content: center; margin-bottom: 0.5rem;">
		                            <!-- 영상 정보 -->
		                            <span style="display: none;"><%= play_seq = list.get(i).getPlay_seq() %></span>
		                            <span><%= select_play_date = list.get(i).getPlay_date() %></span>
		                            <span><%= select_song_title = list.get(i).getSong_title() %> - <%= select_song_singer = list.get(i).getSong_singer() %></span>
		                            <span>Score - <%= select_user_acc = list.get(i).getUser_accuracy() %></span>
		                        </div>
	                       	</div>
					<% 
						}
					%>
                    </div>
                </div>
            </div>
            <!-- 게시물 입력 정보 -->
            <div style="width: 38rem; height: 39.25rem; background-color: rgba(0, 0, 0, 0.5); border: 0.0625rem solid white; border-radius: 1rem;">
                <div style="width: 36rem; height: 37.25rem; margin: 1rem;">
                    <div style="width: 36rem; height: 20.25rem; margin-bottom: 0.5rem;">
                        <!-- 영상 -->
                        <video id="selectedVideo" src="./static/video/<%= list.get(0).getUser_filename() %>" autoplay controls style="width: 100%; height: 100%;"></video>
                    </div>
                    <div style="height: 1.5rem; font-size: 1.0rem; margin-bottom: 1rem;">
                        <!-- 영상 정보 -->
                        <span id="selectedInfo"><%= list.get(0).getPlay_date() %>_<%= list.get(0).getSong_title() %> - <%= list.get(0).getSong_singer() %>_Score - <%= list.get(0).getUser_accuracy() %></span>
                    </div>

                    <!-- 게시물 작성 폼 -->
                    <form action = "WriteBoardService" method="post"> <!-- file 은 크기가 크기 때문에 enctype 부분을 추가해야 함  -->           
	                    <div style="width: 32rem; height: 2.5rem; display: flex; flex-direction: row; justify-content: space-between; align-items: center; margin: 0 auto 1rem auto;">
	                        <div style="font-family: 'GmarketSansTTFBold'; font-size: 1.2rem;">제목</div>
	                        <div>
	                          <!-- 제목 -->
	                          <input type="text" name = "subject" style="width: 28rem; height: 2.5rem; border: 0.0625rem solid black; border-radius: 1rem; font-size: 1.2rem;">
	                      </div>
	                    </div>
	                    <div style="width: 32rem; height: 10rem; display: flex; flex-direction: row; justify-content: space-between; margin: 0 auto 1rem auto;">
	                        <div style="font-family: 'GmarketSansTTFBold'; font-size: 1.2rem; margin-top: 1rem;">내용</div>
	                        <div>
	                            <!-- 내용 -->
	                            <textarea name = "content" style="width: 28rem; height: 10rem; border: 0.0625rem solid black; border-radius: 1rem; font-size: 1.2rem;"></textarea>
	                        </div>
	                    </div>
	                    <!-- 작성자 / 플레이고유번호 / 파일이름 -->
	                    <input type="text" name="id" value="<%= list.get(0).getId() %>" style="display: none;">
	                    <input type="number" name="play_seq" id="inputPlaySeq" value="<%= list.get(0).getPlay_seq() %>" style="display: none;">
	                    <input type="text" name="upload_filename" id="inputFileName" value="<%= list.get(0).getUser_filename() %>" style="display: none;">
	                    <div style="margin-top: 2rem;">
	                        <input type="submit" value="등록하기" style="width: 5rem; height: 2.5rem; font-family: 'GmarketSansTTFBold'; background-color: black; color: white; border: 0.0625rem solid white; border-radius: 1rem;">
	                    </div>
	                </form>           
                </div>       
            </div>
        </div>
    </div>
    <%
			}
    %>
</body>
<script>
const replayList = document.querySelectorAll(".replayList");
const selectedVideo = document.getElementById("selectedVideo");
const selectedInfo = document.getElementById("selectedInfo");
const inputPlaySeq = document.getElementById("inputPlaySeq");
const inputFileName = document.getElementById("inputFileName");
for (const replayVideo of replayList) {
    replayVideo.addEventListener('click', function(event) {
        const replaySrc = replayVideo.childNodes[1].childNodes[3].getAttribute("src");
        selectedVideo.setAttribute("src", replaySrc);
        const replayInfo1 = replayVideo.childNodes[3].childNodes[3].innerHTML;
        const replayInfo2 = replayVideo.childNodes[3].childNodes[5].innerHTML;
        const replayInfo3 = replayVideo.childNodes[3].childNodes[7].innerHTML;
        const replayInfo4 = replayVideo.childNodes[3].childNodes[9].innerHTML;
        selectedInfo.innerHTML = replayInfo2 + "_" +  replayInfo3 + "_" + replayInfo4;
        const replayFileName = replaySrc.split("/")[3].split("#")[0];
        inputPlaySeq.setAttribute("value", replayInfo1);
        inputFileName.setAttribute("value", replayFileName);
    });
};
</script>
</html>