<%@page import="model.DanceInfosDTO"%>
<%@page import="model.DanceInfosDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
    <!-- 임포트 -->
    <link rel="stylesheet" href="./static/css/style.css" />
    <title>Menu</title>
</head>
<body>
	<%
	
		DanceInfosDAO dao = new DanceInfosDAO();
		ArrayList<DanceInfosDTO> list = dao.menu_songlist();
	
	%>


    <div class="menu" style="width: 100%; height: 100vh; color: white;">
        <div style="height: 6.5625rem;"></div>
        <div id="entire">
            <!-- 메뉴 -->
            <div id="menuList">
                <div class="menuList" onclick="location.href='./mainKR.jsp'">HOME</div>
                <div class="menuList" onclick="location.href='./mainKR.jsp'">ABOUT</div>
                <div class="menuList" id="tutorial">TUTORIAL</div>
                <div class="menuList" id="playDance">PLAY DANCE</div>
                <div class="menuList" id="ranking">RANKING</div>
                <div class="menuList" onclick="location.href='./boardKR.jsp'">BOARD</div>
                <div class="menuList" onclick="location.href='./storeKR.jsp'">STORE</div>
            </div>
            <!-- TUTORIAL -->
            <div id="tutorialList">
                <div class="tutorialList">실용만점! 누구나 출 수 있는 '만능리듬' 튜토리얼!ccc</div>
                <div class="tutorialList">몸치 탈출 성공하려면~! 꼭 알아야할 '무릎다운리듬' 튜토리얼!</div>
                <div class="tutorialList">리듬타며 자연스럽게 걷는 법 '업리듬 스텝' 튜토리얼!</div>
                <div class="tutorialList">아무 음악에나 자연스럽게 리듬 타는 법 '업리듬' 튜토리얼!</div>
                <div class="tutorialList">가장 쉬운 리듬 기초 '다운리듬'</div>
            </div>
            <!-- PLAYDANCE -->
            <div id="playDanceList">
                <div style="margin-bottom: 1rem;">
                    <!-- PLAYDANCE 정렬 버튼 -->
                    <input type="button" class="btnSortPlayDance" id="sortSong" value="곡명"> 
                    <input type="button" class="btnSortPlayDance" id="sortSinger" value="가수명"> 
                    <input type="button" class="btnSortPlayDance" id="sortDifficulty" value="난이도"> 
                    <input type="button" class="btnSortPlayDance" id="sortReleaseDate" value="출시"> 
                </div>
                <!-- Swiper -->
                <div class="swiper-container mySwiper">
                    <div class="swiper-wrapper">

                        <!-- 반복 -->
                <%
					for(int i = 0; i < list.size(); i++){
					System.out.println("시퀀스 번호 : "+list.get(i).getSong_seq());
					System.out.println("노래 제목 : "+list.get(i).getSong_title());
					
				%>
                        <!-- 노래1 -->
                        <div class="swiper-slide">
                            <div class="playDanceTitle">
                                <!-- 노래 제목 / 가수 / 난이도 -->
                                
                               <%= list.get(i).getSong_title() %> - <%= list.get(i).getSong_singer() %>  | <%= list.get(i).getDifficulty() %> 
                            </div>
                            <!-- 노래 이미지 -->
                            <img id = "img<%=i%>" src="./static/img/<%= list.get(i).getAlbum_filename() %>" />
                        </div>
                        
                         <input type="hidden" id="v<%=i%>" value="<%= list.get(i).getSong_singer() %>/<%= list.get(i).getSong_title()%>/<%=list.get(i).getAlbum_filename()%> ">
                <% 
					}
			    %>
					
                    </div>
                </div>
            </div> 
            <!-- 랭킹 -->
            <div id="rankingList">
                <div class="rankingList" onclick="location.href='./ranking_songKR.jsp'">노래별 순위</div>
                <div class="rankingList" onclick="location.href='./ranking_countryKR.jsp'">국가별 순위</div>
            </div>
        </div>
    </div>
</body>
<!-- 메뉴 동작 JS -->
<script type="text/javascript" src="./static/js/menu.js"></script>
<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script type="text/javascript">

var len = <%=list.size()%>;

//클릭시 클릭한 이미지의 노래 제목 뽑아주는 함수
function sendData(i){
	$("#img"+i).click(function(){
		var d = document.getElementById("v"+i).value;
		console.log(d);
		const url = 'http://localhost:8082/Third_PJ/playdance.jsp?songdata='+d;
		const encoded = encodeURI(url);
		location.href= encoded;
	});
}
//반복문으로 함수 여러개 생성
for(var i =0; i<len; i++){
	sendData(i);
}
</script>

<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper(".mySwiper", {
        effect: "coverflow",
        direction: "vertical",
        loop: true,
        mousewheel: true,
        centeredSlides: true,
        slidesPerView: "auto",
        coverflowEffect: {
            rotate: 0,
            stretch: 200,
            depth: 200,
            modifier: 1,
            slideShadows: true,
        },
    });
</script>

</html>