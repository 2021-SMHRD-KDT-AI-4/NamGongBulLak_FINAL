<%@page import="model.RankingSongDTO"%>
<%@page import="model.RankingSongDAO"%>
<%@page import="model.DanceInfosDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DanceInfosDAO"%>
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
			$("#navi").load("./navigation.html");
		});
	</script>
	<!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <title>SongRanking</title>
	<script>
	function getParameter(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	</script>
</head>
<body>
<%
	String song_title= request.getParameter("song_title");
	DanceInfosDAO danceinfodao = new DanceInfosDAO();
	RankingSongDAO rsdao = new RankingSongDAO();
	ArrayList<DanceInfosDTO> dancelist = danceinfodao.dancelist();
	ArrayList<RankingSongDTO> RSFlist = rsdao.songranklist(song_title);
	ArrayList<RankingSongDTO> RSFHlist = rsdao.select_ranking_home();
%> 
    <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
        <!-- 상단 네비게이션 -->
        <div id="navi"></div>
        <!-- 메인 내용 -->
        <div style="height: 1rem;"></div>
        <div style="height: 51rem; margin: 0 7rem; display: flex; flex-direction: row;">
            <div style="width: 8.25rem;">
                <div style="height: 20rem;"></div>
                <!-- 노래별, 국가별 순위 버튼 -->
                <input type="button" value="Song" style="margin-bottom: 2rem; width: 6.25rem;" onclick="location.href='ranking_songKR.jsp'">
                <input type="button" value="Country" style="margin-bottom: 2rem; width: 8rem;" onclick="location.href='ranking_countryKR.jsp'">
            </div>
            <div style="width: 38.25rem;">
                <div style="height: 17.5rem;">
                    <div style="height: 100%; display: flex; flex-direction: row;">
                        <div style="width: 11.25rem;">
                            <div id="secimg" style="height: 12.5rem; display: flex; align-items: center; justify-content: center;">
                                <!-- 2위 프로필 사진 -->
                                <img src="./image/<%= RSFHlist.get(1).getProfile_Img() %>" id="secimg" style="height: 11.25rem; width: 11.25rem; border: 0.0625rem solid #fff; border-radius: 50%;">
                            </div>
                            <div style="height: 5rem; display: flex; align-items: center; justify-content: center;">
                               	<!-- 2위 동메달 -->
                                <div id="secmedal">
                                	<img src="./static/img/gold_medal.png" style="height: 2.5rem;">
                                </div>
                               	<!-- 2위 닉네임 -->
                                <div id="sec" style="font-size: 1.3rem;" id="sec">
                                	<%= RSFHlist.get(1).getNickname() %>
                                </div>
                            </div>
                        </div>
                        <div style="width: 17rem;">
                            <div id="feimg" style="height: 12.5rem; display: flex; align-items: center; justify-content: center;">
                                <!-- 1위 프로필 사진 -->
                                <img src="./image/<%= RSFHlist.get(0).getProfile_Img() %>" id="secimg" style="height: 11.25rem; width: 11.25rem; border: 0.0625rem solid #fff; border-radius: 50%;">
                            </div>
                            <div style="height: 5rem; display: flex; align-items: center; justify-content: center;">
                                <div id="femedal">
                                	<!-- 1위 금메달 -->
                                	<img src="./static/img/gold_medal.png" style="height: 2.5rem;">
                                </div>
                                <!-- 1위 닉네임 -->
                                <div id="fe" style="font-size: 1.3rem;" id="sec">
                                	<%= RSFHlist.get(0).getNickname() %>
                                </div>
                            </div>
                        </div>
                        <div style="width: 10rem;">
                            <div id="thimg" style="height: 12.5rem; display: flex; align-items: center; justify-content: center;">
                                <!-- 3위 프로필 사진 -->
                                <img src="./image/<%= RSFHlist.get(2).getProfile_Img() %>" id="secimg" style="height: 11.25rem; width: 11.25rem; border: 0.0625rem solid #fff; border-radius: 50%;">
                            </div>
                            <div style="height: 5rem; display: flex; align-items: center; justify-content: center;">
                                <div id="thmedal">
                                	<!-- 3위 동메달 -->
                                	<img src="./static/img/gold_medal.png" style="height: 2.5rem;">
                                </div>
                                <!-- 3위 닉네임 -->
                           		<div id="th" style="font-size: 1.3rem;" id="sec">
                           			<%= RSFHlist.get(2).getNickname() %>
                           		</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="height: 33.5rem;margin: 0 2.5rem;">
                    <!-- 테이블 -->
                    <div style="height: 33.5rem; background-color: rgba(207, 207, 207, 0.5); color: black; overflow:overlay;">
                        <!-- 테이블 제목 -->
                        <div style="font-size: 2rem; font-family: 'GmarketSansTTFBold'; display: grid; grid-template-columns: 5rem 8.75rem 18.25rem;">
                            <div>번호</div>
                            <div></div>
                            <div>곡정보</div>
                        </div>
                        <!-- 테이블 내용 -->
                        <div style="font-size: 2rem; display: grid; grid-template-columns: 5rem 8.75rem 18.25rem;">
                            <% for(int i=0; i<dancelist.size(); i++) { %>
                            <!-- 번호 -->
                            <div><%= dancelist.get(i).getSong_seq() %></div>
                            <!-- 앨범 이미지 -->
                            <div><img src="./static/img/<%= dancelist.get(i).getAlbum_filename() %>" style="height: 5rem; border: 0.0625rem solid #fff;"></div>
                            <!-- 노래 제목/가수/앨범명 -->
                            <div>
                                <input style="font-family: 'GmarketSansTTFBold'; font-size: 2rem; background-color:transparent; outline:none; border:none;" type="button" id="songtitle<%= i %>" name="songtitle" value="<%= dancelist.get(i).getSong_title() %>" onclick="songclick(<%=i%>)"><br>
                                <span style="font-size: 1.2rem;"><%= dancelist.get(i).getSong_singer() %> | <%= dancelist.get(i).getAlbum_title() %></span>
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
            <div style="width: 57rem; margin-left: 2.5rem;">
                <!-- 테이블 -->
                <div style="height: 51rem; width: 57rem; background-color: rgba(207, 207, 207, 0.5); color: black; overflow:overlay;">
                    <!-- 테이블 제목 -->
                    <div style="font-size: 2rem; font-family: 'GmarketSansTTFBold'; display: grid; grid-template-columns: 5rem 9.75rem 21.25rem 5rem 14.75rem;">
                        <div>순위</div>
                        <div></div>
                        <div>닉네임</div>
                        <div>점수</div>
                        <div>엠블럼</div>
                    </div>
                    <!-- 테이블 내용 -->
                    <div id="songview" style="font-size: 2rem; display: grid; grid-template-columns: 5rem 9.75rem 21.25rem 5rem 4.9rem 4.9rem 4.9rem;">
	                    <% for(int i=0; i<RSFHlist.size(); i++) { %>
	                       <!-- 순위 -->
	                       <div><%= RSFHlist.get(i).getRank() %></div>
	                       <!-- 프로필 사진 -->
	                       <div>
	                           <img src="./data/profile_image/<%= RSFHlist.get(i).getProfile_Img() %>" style="height: 6.25rem; width: 6.25rem; border: 0.0625rem solid #fff; border-radius: 50%;">
	                       </div>
	                       <!-- 닉네임 -->
	                       <div><%= RSFHlist.get(i).getNickname() %></div>
	                       <!-- 점수 -->
	                       <div><%= RSFHlist.get(i).getAccuracy() %></div>
	                       <!-- 엠블럼 -->
	                       <% if(RSFHlist.get(i).getEmblem_1() == null && RSFHlist.get(i).getEmblem_2() == null && RSFHlist.get(i).getEmblem_3()== null){ %>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>
	                       <% }else if(RSFHlist.get(i).getEmblem_1() != null && RSFHlist.get(i).getEmblem_2() == null && RSFHlist.get(i).getEmblem_3()== null){%>
	                       	   <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/emblem/<%= RSFHlist.get(i).getEmblem_1() %>" style="height: 3.75rem; width: 3.75rem;"></div>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>
		                   <% }else if(RSFHlist.get(i).getEmblem_1() != null && RSFHlist.get(i).getEmblem_2() != null && RSFHlist.get(i).getEmblem_3()== null){%>    
	                       	   <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/emblem/<%= RSFHlist.get(i).getEmblem_1() %>" style="height: 3.75rem; width: 3.75rem;"></div>
	                       	   <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/emblem/<%= RSFHlist.get(i).getEmblem_2() %>" style="height: 3.75rem; width: 3.75rem;"></div>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>
	                       <% }else if(RSFHlist.get(i).getEmblem_1() != null && RSFHlist.get(i).getEmblem_2() != null && RSFHlist.get(i).getEmblem_3() != null){%>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/emblem/<%= RSFHlist.get(i).getEmblem_1() %>" style="height: 3.75rem; width: 3.75rem;"></div>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/emblem/<%= RSFHlist.get(i).getEmblem_2() %>" style="height: 3.75rem; width: 3.75rem;"></div>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/emblem/<%= RSFHlist.get(i).getEmblem_3() %>" style="height: 3.75rem; width: 3.75rem;"></div>
	                        <% } %>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function songclick(num){
	var test = '';
	$.ajax({
		type : "post",
		data : {
			"songtitle" : $('#songtitle'+num).val()
		},
		url : "RankSongService",
		dataType: "JSON",
		success : function(data){
			console.log(data);
			$("#songview").html(data);
			for(var i = 0; i < data.length; i++){
				$("#songview").append('<div>'+data[i].rank+'</div>'); 
				$("#songview").append('<div><img src="./data/profile_image'+data[i].profile_Img+'" style="height: 6.25rem; width: 6.25rem; border: 0.0625rem solid #fff; border-radius: 50%;"></div>'); 
				$("#songview").append('<div>'+data[i].nickname+'</div>'); 
				$("#songview").append('<div>'+data[i].accuracy+'</div>'); 
				if(data[i].emblem_1 == null && data[i].emblem_2 == null && data[i].emblem_3 == null){
					$("#songview").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>');
					$("#songview").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>');
					$("#songview").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>');
				}else if(data[i].emblem_1 != null && data[i].emblem_2 == null && data[i].emblem_3 == null ){
					$("#songview").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/emblem/'+data[i].emblem_1+'" style="height: 3.75rem; width: 3.75rem;"></div>');
					$("#songview").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>');
					$("#songview").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>');
				}else if(data[i].emblem_1 != null && data[i].emblem_2 != null && data[i].emblem_3 == null ){
					$("#songview").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/emblem/'+data[i].emblem_1+'" style="height: 3.75rem; width: 3.75rem;"></div>');
					$("#songview").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/emblem/'+data[i].emblem_2+'" style="height: 3.75rem; width: 3.75rem;"></div>');
					$("#songview").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>');
				}else if(data[i].emblem_1 != null && data[i].emblem_2 != null && data[i].emblem_3 != null ){
					$("#songview").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/emblem/'+data[i].emblem_1+'" style="height: 3.75rem; width: 3.75rem;"></div>');
					$("#songview").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/emblem/'+data[i].emblem_2+'" style="height: 3.75rem; width: 3.75rem;"></div>');
					$("#songview").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/emblem/'+data[i].emblem_3+'" style="height: 3.75rem; width: 3.75rem;"></div>');
				}
			}
			if(data.length == 1){
				$("#sec").html('');
				$("#secimg").html('');
				$("#secmedal").html('');
				$("#fe").html(data[0].nickname);
				$("#feimg").html('<img src="./image/'+data[0].proImg+'" id="secimg" style="height: 11.25rem; width: 11.25rem; border: 0.0625rem solid #fff; border-radius: 50%;">');
				$("#femedal").html('<img src="./static/img/gold_medal.png" style="height: 2.5rem;">');
				$("#th").html('');
				$("#thimg").html('');
				$("#thmedal").html('');
			}else if(data.length == 2){
				$("#sec").html(data[1].nickname);
				$("#secimg").html('<img src="./image/'+data[1].proImg+'" id="secimg" style="height: 11.25rem; width: 11.25rem; border: 0.0625rem solid #fff; border-radius: 50%;">');
				$("#secmedal").html('<img src="./static/img/gold_medal.png" style="height: 2.5rem;">');
				$("#fe").html(data[0].nickname);
				$("#feimg").html('<img src="./image/'+data[0].proImg+'" id="secimg" style="height: 11.25rem; width: 11.25rem; border: 0.0625rem solid #fff; border-radius: 50%;">');
				$("#femedal").html('<img src="./static/img/gold_medal.png" style="height: 2.5rem;">');
				$("#th").html('');
				$("#thimg").html('');
				$("#thmedal").html('');
			}else if(data.length >= 3){
				$("#sec").html(data[1].nickname);
				$("#secimg").html('<img src="./image/'+data[1].proImg+'" id="secimg" style="height: 11.25rem; width: 11.25rem; border: 0.0625rem solid #fff; border-radius: 50%;">');
				$("#secmedal").html('<img src="./static/img/gold_medal.png" style="height: 2.5rem;">');
				$("#fe").html(data[0].nickname);
				$("#feimg").html('<img src="./image/'+data[0].proImg+'" id="secimg" style="height: 11.25rem; width: 11.25rem; border: 0.0625rem solid #fff; border-radius: 50%;">');
				$("#femedal").html('<img src="./static/img/gold_medal.png" style="height: 2.5rem;">');
				$("#th").html(data[2].nickname);
				$("#thimg").html('<img src="./image/'+data[2].proImg+'" id="secimg" style="height: 11.25rem; width: 11.25rem; border: 0.0625rem solid #fff; border-radius: 50%;">');
				$("#thmedal").html('<img src="./static/img/gold_medal.png" style="height: 2.5rem;">');
			}else{
				$("#sec").html('');
				$("#secimg").html('');
				$("#secmedal").html('');
				$("#fe").html('');
				$("#feimg").html('');
				$("#femedal").html('');
				$("#th").html('');
				$("#thimg").html('');
				$("#thmedal").html('');
			}
			
			
		}, 
		error : function(){
			$("#songview").html('');
			$("#sec").html('');
			$("#secimg").html('');
			$("#secmedal").html('');
			$("#fe").html('');
			$("#feimg").html('');
			$("#femedal").html('');
			$("#th").html('');
			$("#thimg").html('');
			$("#thmedal").html('');
		}
	});

} 

</script>  
</body>
</html>