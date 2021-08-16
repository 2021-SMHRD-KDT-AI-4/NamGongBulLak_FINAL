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
    <!-- ����Ʈ -->
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
            <!-- �޴� -->
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
                <div class="tutorialList">�ǿ븸��! ������ �� �� �ִ� '���ɸ���' Ʃ�丮��!ccc</div>
                <div class="tutorialList">��ġ Ż�� �����Ϸ���~! �� �˾ƾ��� '�����ٿ��' Ʃ�丮��!</div>
                <div class="tutorialList">����Ÿ�� �ڿ������� �ȴ� �� '������ ����' Ʃ�丮��!</div>
                <div class="tutorialList">�ƹ� ���ǿ��� �ڿ������� ���� Ÿ�� �� '������' Ʃ�丮��!</div>
                <div class="tutorialList">���� ���� ���� ���� '�ٿ��'</div>
            </div>
            <!-- PLAYDANCE -->
            <div id="playDanceList">
                <div style="margin-bottom: 1rem;">
                    <!-- PLAYDANCE ���� ��ư -->
                    <input type="button" class="btnSortPlayDance" id="sortSong" value="���"> 
                    <input type="button" class="btnSortPlayDance" id="sortSinger" value="������"> 
                    <input type="button" class="btnSortPlayDance" id="sortDifficulty" value="���̵�"> 
                    <input type="button" class="btnSortPlayDance" id="sortReleaseDate" value="���"> 
                </div>
                <!-- Swiper -->
                <div class="swiper-container mySwiper">
                    <div class="swiper-wrapper">

                        <!-- �ݺ� -->
                <%
					for(int i = 0; i < list.size(); i++){
					System.out.println("������ ��ȣ : "+list.get(i).getSong_seq());
					System.out.println("�뷡 ���� : "+list.get(i).getSong_title());
					
				%>
                        <!-- �뷡1 -->
                        <div class="swiper-slide">
                            <div class="playDanceTitle">
                                <!-- �뷡 ���� / ���� / ���̵� -->
                                
                               <%= list.get(i).getSong_title() %> - <%= list.get(i).getSong_singer() %>  | <%= list.get(i).getDifficulty() %> 
                            </div>
                            <!-- �뷡 �̹��� -->
                            <img id = "img<%=i%>" src="./static/img/<%= list.get(i).getAlbum_filename() %>" />
                        </div>
                        
                         <input type="hidden" id="v<%=i%>" value="<%= list.get(i).getSong_singer() %>/<%= list.get(i).getSong_title()%>/<%=list.get(i).getAlbum_filename()%> ">
                <% 
					}
			    %>
					
                    </div>
                </div>
            </div> 
            <!-- ��ŷ -->
            <div id="rankingList">
                <div class="rankingList" onclick="location.href='./ranking_songKR.jsp'">�뷡�� ����</div>
                <div class="rankingList" onclick="location.href='./ranking_countryKR.jsp'">������ ����</div>
            </div>
        </div>
    </div>
</body>
<!-- �޴� ���� JS -->
<script type="text/javascript" src="./static/js/menu.js"></script>
<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script type="text/javascript">

var len = <%=list.size()%>;

//Ŭ���� Ŭ���� �̹����� �뷡 ���� �̾��ִ� �Լ�
function sendData(i){
	$("#img"+i).click(function(){
		var d = document.getElementById("v"+i).value;
		console.log(d);
		const url = 'http://localhost:8082/Third_PJ/playdance.jsp?songdata='+d;
		const encoded = encodeURI(url);
		location.href= encoded;
	});
}
//�ݺ������� �Լ� ������ ����
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