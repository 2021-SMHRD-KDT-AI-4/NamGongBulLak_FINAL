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
    <!-- ����Ʈ -->
    <link rel="stylesheet" href="./static/css/style.css" />
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">   
        $(document).ready(function() {
			$("#navi").load("./navigationKR.jsp");
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
        <!-- ��� �׺���̼� -->
        <div id="navi"></div>
        <!-- ���� ���� -->
        <div style="height: 1rem;"></div>
        <div style="height: 51rem; margin: 0 7rem; display: flex; flex-direction: row;">
            <div style="width: 8.25rem;">
                <div style="height: 20rem;"></div>
                <!-- �뷡��, ������ ���� ��ư -->
                <input type="button" value="Song" style="font-size: 1.2rem; border-radius: 1rem; border: 0.0625rem solid white; color: white; background-color: black; height: 2.5rem; margin-bottom: 2rem; width: 6.25rem; " onclick="location.href='ranking_songKR.jsp'">
                <input type="button" value="Country" style="font-size: 1.2rem; border-radius: 1rem; border: 0.0625rem solid white; color: white; background-color: #707070; height: 2.5rem; margin-bottom: 2rem; width: 8rem;" onclick="location.href='ranking_countryKR.jsp'">
            </div>
            <div style="width: 38.25rem;">
                <div style="height: 17.5rem;">
                    <div style="height: 100%; display: flex; flex-direction: row;">
                    
                        <div style="width: 12.5rem; height: 17.5rem;">
                        	<div style="width: 12.5rem; height: 12.5rem;  display: flex; justify-content: left; align-items: center;">
	                            <div id="secimg" style="width: 11.25rem; height: 11.25rem;">
	                                <!-- 2�� ������ ���� -->
	                                <img src="./data/profile_image/<%= RSFHlist.get(1).getProfile_Img() %>" id="secimg" style="height: 100%; width: 100%; border: 0.0625rem solid #fff; border-radius: 50%;">
	                            </div>
                        	</div>
                            <div style="width: 12.5rem; height: 5rem;">
                               	<!-- 2�� ���޴� -->
                                <div id="secmedal" style="width: 11.25rem; height: 5rem; display: flex; flex-direction: columns; align-items: center; justify-content: center;">
                                	<img src="./static/img/medal/silver.png" style="width: 2.5rem; height: 2.5rem;">
	                               	<!-- 2�� �г��� -->
	                                <div id="sec" style="height: 2.5rem; display: flex; align-items: center;">
	                                	<%= RSFHlist.get(1).getNickname() %>
	                                </div>
                                </div>
                            </div>
                        </div>
                        
                        <div style="width: 12.5rem; height: 17.5rem;">
                        	<div style="width: 12.5rem; height: 12.5rem;  display: flex; justify-content: center; align-items: center;">
	                            <div id="feimg" style="width: 12.5rem; height: 12.5rem;">
	                                <!-- 1�� ������ ���� -->
	                                <img src="./data/profile_image/<%= RSFHlist.get(0).getProfile_Img() %>" id="secimg" style="height: 100%; width: 100%; border: 0.0625rem solid #fff; border-radius: 50%;">
	                            </div>
                        	</div>
                            <div style="width: 12.5rem; height: 5rem;">
                               	<!-- 1�� �ݸ޴� -->
                                <div id="femedal" style="width: 12.5rem; height: 5rem; display: flex; flex-direction: columns; align-items: center; justify-content: center;">
                                	<img src="./static/img/medal/gold.png" style="width: 2.5rem; height: 2.5rem;">
	                               	<!-- 1�� �г��� -->
	                                <div id="fe" style="height: 2.5rem; display: flex; align-items: center;">
	                                	<%= RSFHlist.get(0).getNickname() %>
	                                </div>
                                </div>
                            </div>
                        </div>
                        
                        <div style="width: 12.5rem; height: 17.5rem;">
                        	<div style="width: 12.5rem; height: 12.5rem;  display: flex; justify-content: flex-end; align-items: center;">
	                            <div id="thimg" style="width: 10rem; height: 10rem;">
	                                <!-- 3�� ������ ���� -->
	                                <img src="./data/profile_image/<%= RSFHlist.get(2).getProfile_Img() %>" id="secimg" style="height: 100%; width: 100%; border: 0.0625rem solid #fff; border-radius: 50%;">
	                            </div>
                        	</div>
                            <div style="width: 12.5rem; height: 5rem;">
                               	<!-- 3�� ���޴� -->
                                <div id="thmedal" style="width: 10rem; height: 5rem; display: flex; flex-direction: columns; align-items: center; justify-content: flex-end;">
                                	<img src="./static/img/medal/bronze.png" style="width: 2.5rem; height: 2.5rem;">
	                               	<!-- 3�� �г��� -->
	                                <div id="th" style="height: 2.5rem; display: flex; align-items: center;">
	                                	<%= RSFHlist.get(2).getNickname() %>
	                                </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div style="height: 33.5rem;margin: 0 2.5rem;">
                    <!-- ���̺� -->
                    <div style="height: 33.25rem; background-color: rgba(207, 207, 207, 0.7); color: white; overflow:overlay; border-radius: 1rem;">
                        <!-- ���̺� ���� -->
                        <div style="height: 2.5rem; font-size: 1.2rem; font-family:'GmarketSansTTFBold'; display: grid; grid-template-columns: 5rem 10rem 18.25rem; border-bottom: 0.25rem solid white; background-color: #707070;">
                            <div style="display: flex; justify-content: flex-end; align-items: center;">��ȣ</div>
                            <div></div>
                            <div style="display: flex; justify-content: left; align-items: center;">������</div>
                        </div>
                        <!-- ���̺� ���� -->
                        <% for(int i=0; i<dancelist.size(); i++) { %>
                        <div class="songs" id="song<%= i %>" style="height: 7.5rem; font-size: 1.2rem; display: grid; grid-template-columns: 5rem 10rem 18.25rem; border-bottom: 0.0625rem solid white">
                            <!-- ��ȣ -->
                            <div style="display: flex; justify-content: flex-end; align-items: center;"><%= dancelist.get(i).getSong_seq() %></div>
                            <!-- �ٹ� �̹��� -->
                            <div style="margin: auto; width: 5rem; height: 5rem;"><img src="./static/img/<%= dancelist.get(i).getAlbum_filename() %>" style="width: 100%; height: 100%; border: 0.0625rem solid #fff;"></div>
                            <!-- �뷡 ����/����/�ٹ��� -->
                            <div style="display: flex; justify-content: left; align-items: center;">
	                            <div style="text-align: left;">
	                            	<input style="color: white; font-size: 1.2rem; background-color:transparent; outline:none; border:none;" type="button" id="songtitle<%= i %>" name="songtitle" value="<%= dancelist.get(i).getSong_title() %>" onclick="songclick(<%=i%>)"><br>
	                               	<span style="font-size: 1.0rem;"><%= dancelist.get(i).getSong_singer() %> | <%= dancelist.get(i).getAlbum_title() %></span>
	                            </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
            <div style="width: 57rem; margin-left: 2.5rem;">
                <!-- ���̺� -->
                <div style="height: 51rem; width: 57rem; background-color: rgba(207, 207, 207, 0.7); color: white; overflow:overlay; border-radius: 1rem;">
                    <!-- ���̺� ���� -->
                    <div style="height: 2.5rem; font-size: 1.2rem; font-family: 'GmarketSansTTFBold'; display: grid; grid-template-columns: 5rem 9.75rem 18.75rem 6rem 17.5rem; border-bottom: 0.25rem solid white; background-color: #707070;">
                        <div style="display: flex; justify-content: flex-end; align-items: center;">����</div>
                        <div></div>
                        <div style="display: flex; justify-content: left; align-items: center;">�г���</div>
                        <div style="display: flex; justify-content: center; align-items: center;">����</div>
                        <div style="display: flex; justify-content: left; align-items: center;">����</div>
                    </div>
                    <!-- ���̺� ���� -->
                    <div id="songview">
	                <% for(int i=0; i<RSFHlist.size(); i++) { %>
	                	<div style="height: 7.5rem; font-size: 1.2rem; display: grid; grid-template-columns: 5rem 9.75rem 18.75rem 6rem 5rem 5rem 5rem; border-bottom: 0.0625rem solid white;">
	                       <!-- ���� -->
	                       <div style="display: flex; justify-content: flex-end; align-items: center;"><%= RSFHlist.get(i).getRank() %></div>
	                       <!-- ������ ���� -->
	                       <div style="margin: auto; width: 6.25rem; height: 6.25rem;">
	                           <img src="./data/profile_image/<%= RSFHlist.get(i).getProfile_Img() %>" style="height: 100%; width: 100%; border: 0.0625rem solid #fff; border-radius: 50%;">
	                       </div>
	                       <!-- �г��� -->
	                       <div style="display: flex; justify-content: left; align-items: center;"><%= RSFHlist.get(i).getNickname() %></div>
	                       <!-- ���� -->
	                       <div style="display: flex; justify-content: center; align-items: center;"><%= RSFHlist.get(i).getAccuracy() %></div>
	                       <!-- ���� -->
	                       <% if((RSFHlist.get(i).getEmblem_1().equals("0")) && (RSFHlist.get(i).getEmblem_2().equals("0")) && (RSFHlist.get(i).getEmblem_3().equals("0"))){ %>
		                       <div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>
		                       <div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>
		                       <div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>
	                       <% }else if(!(RSFHlist.get(i).getEmblem_1().equals("0")) && (RSFHlist.get(i).getEmblem_2().equals("0")) && (RSFHlist.get(i).getEmblem_3().equals("0"))){%>
	                       	   <div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/<%= RSFHlist.get(i).getEmblem_1() %>" style="height: 100%; width: 100%;"></div>
		                       <div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>
		                       <div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>
		                   <% }else if(!(RSFHlist.get(i).getEmblem_1().equals("0")) && !(RSFHlist.get(i).getEmblem_2().equals("0")) && (RSFHlist.get(i).getEmblem_3().equals("0"))){%>    
	                       	   <div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/<%= RSFHlist.get(i).getEmblem_1() %>" style="height: 100%; width: 100%;"></div>
	                       	   <div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/<%= RSFHlist.get(i).getEmblem_2() %>" style="height: 100%; width: 100%;"></div>
		                       <div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>
	                       <% }else if(!(RSFHlist.get(i).getEmblem_1().equals("0")) && !(RSFHlist.get(i).getEmblem_2().equals("0")) && !(RSFHlist.get(i).getEmblem_3().equals("0"))){%>
		                       <div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/<%= RSFHlist.get(i).getEmblem_1() %>" style="height: 100%; width: 100%;"></div>
		                       <div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/<%= RSFHlist.get(i).getEmblem_2() %>" style="height: 100%; width: 100%;"></div>
		                       <div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/<%= RSFHlist.get(i).getEmblem_3() %>" style="height: 100%; width: 100%;"></div>
	                        <% } %>
	                	</div>
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
				var s = '';
				s += '<div style="height: 7.5rem; font-size: 1.2rem; display: grid; grid-template-columns: 5rem 9.75rem 18.75rem 6rem 5rem 5rem 5rem; border-bottom: 0.0625rem solid white;">'; 
				s += '<div style="display: flex; justify-content: flex-end; align-items: center;">'+data[i].rank+'</div>'; 
				s += '<div style="margin: auto; width: 6.25rem; height: 6.25rem;"><img src="./data/profile_image/'+data[i].profile_Img+'" style="height: 100%; width: 100%; border: 0.0625rem solid #fff; border-radius: 50%;"></div>'; 
				s += '<div style="display: flex; justify-content: left; align-items: center;">'+data[i].nickname+'</div>'; 
				s += '<div style="display: flex; justify-content: center; align-items: center;">'+data[i].accuracy+'</div>'; 
				if(data[i].emblem_1 == "0" && data[i].emblem_2 == "0" && data[i].emblem_3 == "0"){
					s += '<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>';
					s += '<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>';
					s += '<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>';
				}else if(data[i].emblem_1 != "0" && data[i].emblem_2 == "0" && data[i].emblem_3 == "0"){
					s += '<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/'+data[i].emblem_1+'" style="height: 100%; width: 100%;"></div>';
					s += '<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>';
					s += '<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>';
				}else if(data[i].emblem_1 != "0" && data[i].emblem_2 != "0" && data[i].emblem_3 == "0"){
					s += '<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/'+data[i].emblem_1+'" style="height: 100%; width: 100%;"></div>';
					s += '<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/'+data[i].emblem_2+'" style="height: 100%; width: 100%;"></div>';
					s += '<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>';
				}else if(data[i].emblem_1 != "0" && data[i].emblem_2 != "0" && data[i].emblem_3 != "0"){
					s += '<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/'+data[i].emblem_1+'" style="height: 100%; width: 100%;"></div>';
					s += '<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/'+data[i].emblem_2+'" style="height: 100%; width: 100%;"></div>';
					s += '<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/'+data[i].emblem_3+'" style="height: 100%; width: 100%;"></div>';
				}
				s += '</div>';
				$("#songview").append(s);
			}
			/* for(var i = 0; i < data.length; i++){
				$("#songview").append('<div style="height: 7.5rem; font-size: 1.2rem; display: grid; grid-template-columns: 5rem 9.75rem 18.75rem 6rem 5rem 5rem 5rem; border-bottom: 0.0625rem solid white;">'); 
				$("#songview").append('<div style="display: flex; justify-content: flex-end; align-items: center;">'+data[i].rank+'</div>'); 
				$("#songview").append('<div style="margin: auto; width: 6.25rem; height: 6.25rem;"><img src="./data/profile_image/'+data[i].profile_Img+'" style="height: 100%; width: 100%; border: 0.0625rem solid #fff; border-radius: 50%;"></div>'); 
				$("#songview").append('<div style="display: flex; justify-content: left; align-items: center;">'+data[i].nickname+'</div>'); 
				$("#songview").append('<div style="display: flex; justify-content: center; align-items: center;">'+data[i].accuracy+'</div>'); 
				if(data[i].emblem_1 == "0" && data[i].emblem_2 == "0" && data[i].emblem_3 == "0"){
					$("#songview").append('<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>');
					$("#songview").append('<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>');
					$("#songview").append('<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>');
				}else if(data[i].emblem_1 != "0" && data[i].emblem_2 == "0" && data[i].emblem_3 == "0"){
					$("#songview").append('<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/'+data[i].emblem_1+'" style="height: 100%; width: 100%;"></div>');
					$("#songview").append('<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>');
					$("#songview").append('<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>');
				}else if(data[i].emblem_1 != "0" && data[i].emblem_2 != "0" && data[i].emblem_3 == "0"){
					$("#songview").append('<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/'+data[i].emblem_1+'" style="height: 100%; width: 100%;"></div>');
					$("#songview").append('<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/'+data[i].emblem_2+'" style="height: 100%; width: 100%;"></div>');
					$("#songview").append('<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"></div>');
				}else if(data[i].emblem_1 != "0" && data[i].emblem_2 != "0" && data[i].emblem_3 != "0"){
					$("#songview").append('<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/'+data[i].emblem_1+'" style="height: 100%; width: 100%;"></div>');
					$("#songview").append('<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/'+data[i].emblem_2+'" style="height: 100%; width: 100%;"></div>');
					$("#songview").append('<div style="display: flex; justify-content: left; align-items: center; margin: auto 1.25rem auto 0; width: 3.75rem; height: 3.75rem;"><img src="./static/img/emblem/'+data[i].emblem_3+'" style="height: 100%; width: 100%;"></div>');
				}
				$("#songview").append('</div>');
			} */
			if(data.length == 1){
				$("#sec").html('');
				$("#secimg").html('');
				$("#secmedal").html('');
				$("#fe").html(data[0].nickname);
				$("#feimg").html('<img src="./data/profile_image/'+data[0].profile_Img+'" id="secimg" style="height: 100%; width: 100%; border: 0.0625rem solid #fff; border-radius: 50%;">');
				$("#femedal").html('<img src="./static/img/medal/gold.png" style="height: 2.5rem;">');
				$("#th").html('');
				$("#thimg").html('');
				$("#thmedal").html('');
			}else if(data.length == 2){
				$("#sec").html(data[1].nickname);
				$("#secimg").html('<img src="./data/profile_image/'+data[1].profile_Img+'" id="secimg" style="height: 100%; width: 100%; border: 0.0625rem solid #fff; border-radius: 50%;">');
				$("#secmedal").html('<img src="./static/img/medal/silver.png" style="height: 2.5rem;">');
				$("#fe").html(data[0].nickname);
				$("#feimg").html('<img src="./data/profile_image/'+data[0].profile_Img+'" id="secimg" style="height: 100%; width: 100%; border: 0.0625rem solid #fff; border-radius: 50%;">');
				$("#femedal").html('<img src="./static/img/medal/gold.png" style="height: 2.5rem;">');
				$("#th").html('');
				$("#thimg").html('');
				$("#thmedal").html('');
			}else if(data.length >= 3){
				$("#sec").html(data[1].nickname);
				$("#secimg").html('<img src="./data/profile_image/'+data[1].profile_Img+'" id="secimg" style="height: 100%; width: 100%; border: 0.0625rem solid #fff; border-radius: 50%;">');
				$("#secmedal").html('<img src="./static/img/medal/silver.png" style="height: 2.5rem;"><div id="sec" style="height: 2.5rem; display: flex; align-items: center;">'+data[1].nickname+'</div>');
				$("#fe").html(data[0].nickname);
				$("#feimg").html('<img src="./data/profile_image/'+data[0].profile_Img+'" id="secimg" style="height: 100%; width: 100%; border: 0.0625rem solid #fff; border-radius: 50%;">');
				$("#femedal").html('<img src="./static/img/medal/gold.png" style="height: 2.5rem;"><div id="fe" style="height: 2.5rem; display: flex; align-items: center;">'+data[0].nickname+'</div>');
				$("#th").html(data[2].nickname);
				$("#thimg").html('<img src="./data/profile_image/'+data[2].profile_Img+'" id="secimg" style="height: 100%; width: 100%; border: 0.0625rem solid #fff; border-radius: 50%;">');
				$("#thmedal").html('<img src="./static/img/medal/bronze.png" style="height: 2.5rem;"><div id="th" style="height: 2.5rem; display: flex; align-items: center;">'+data[2].nickname+'</div>');
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