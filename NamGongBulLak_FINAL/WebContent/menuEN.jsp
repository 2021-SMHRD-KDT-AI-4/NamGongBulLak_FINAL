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
                <div class="menuList" onclick="location.href='./mainEN.jsp'">HOME</div>
                <div class="menuList" onclick="location.href='./mainEN.jsp'">ABOUT</div>
                <div class="menuList" id="tutorial">TUTORIAL</div>
                <div class="menuList" id="playDance">PLAY DANCE</div>
                <div class="menuList" id="ranking">RANKING</div>
                <div class="menuList" onclick="location.href='./boardEN.jsp'">BOARD</div>
                <div class="menuList" onclick="location.href='./storeEN.jsp'">STORE</div>
            </div>
            <!-- TUTORIAL -->
            <div id="tutorialList">
                <div class="tutorialList">Practical! Anyone can dance to the "Versatile Rhythm" tutorial!</div>
                <div class="tutorialList">To get out of here! Knee-down Rhythm Tutorial!</div>
                <div class="tutorialList">How to walk naturally with rhythm. Up-rhythm Step!</div>
                <div class="tutorialList">How to dance to any music naturally. Up-rhythm tutorial!</div>
                <div class="tutorialList">Easiest rhythm foundation, Down rhythm.</div>
            </div>
            <!-- PLAYDANCE -->
            <div id="playDanceList">
                <div style="margin-bottom: 1rem;">
                    <!-- PLAYDANCE 정렬 버튼 -->
                    <input type="button" class="btnSortPlayDance" id="sortSong" value="Title"> 
                    <input type="button" class="btnSortPlayDance" id="sortSinger" value="Singer"> 
                    <input type="button" class="btnSortPlayDance" id="sortDifficulty" value="Difficulty"> 
                    <input type="button" class="btnSortPlayDance" id="sortReleaseDate" value="ReleaseDate"> 
                </div>
                <!-- Swiper -->
                <div class="swiper-container mySwiper">
                    <div class="swiper-wrapper">

                        <%
					for(int i = 0; i < list.size(); i++){
					System.out.println(list.get(i).getSong_seq());
				%>
                        <!-- 노래1 -->
                        <div class="swiper-slide">
                            <div class="playDanceTitle">
                                <!-- 노래 제목 / 가수 / 난이도 -->
                                <%= list.get(i).getSong_title() %> - <%= list.get(i).getSong_singer() %>  | <%= list.get(i).getDifficulty() %>
                            </div>
                            <!-- 노래 이미지 -->
                            <img src="./static/img/<%= list.get(i).getAlbum_filename() %>" />
                        </div>
                <% 
					}
			    %>

                    </div>
                </div>
            </div> 
            <!-- 랭킹 -->
            <div id="rankingList">
                <div class="rankingList" onclick="location.href='./ranking_songEN.jsp'">노래별 순위</div>
                <div class="rankingList" onclick="location.href='./ranking_countryEN.jsp'">국가별 순위</div>
            </div>
        </div>
    </div>
</body>
<!-- 메뉴 동작 JS -->
<script type="text/javascript" src="./static/js/menu.js"></script>
<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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