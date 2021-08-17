<%@page import="model.RankingCountryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.RankingCountryDAO"%>
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
    <title>CountryRanking</title>
</head>
<body>
<%
	String country = request.getParameter("country");
	RankingCountryDAO RCdao = new RankingCountryDAO();
	ArrayList<RankingCountryDTO> RClist = RCdao.RankingCountry(country);
	ArrayList<RankingCountryDTO> RCHlist = RCdao.select_Cranking_home();
	ArrayList<RankingCountryDTO> CVlist = RCdao.showSum();
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
                <input type="button" value="Song" style="font-size: 1.2rem; border-radius: 1rem; border: 0.0625rem solid white; color: white; background-color: #707070; height: 2.5rem; margin-bottom: 2rem; width: 6.25rem; " onclick="location.href='ranking_songKR.jsp'">
                <input type="button" value="Country" style="font-size: 1.2rem; border-radius: 1rem; border: 0.0625rem solid white; color: white; background-color: black; height: 2.5rem; margin-bottom: 2rem; width: 8rem;" onclick="location.href='ranking_countryKR.jsp'">
            </div>
            <div style="width: 38.25rem;">
                <div style="height: 17.5rem;">
                
                    <div style="height: 100%; display: flex; flex-direction: row;">
                        <div style="width: 11.25rem;">
                            <div style="height: 12.5rem; display: flex; align-items: center; justify-content: center;">
                                <!-- 2위 국가 사진 -->
                                <% if(CVlist.get(1).getCountry().equals("korea")){ %>
                                <img src="./country/D.jpg" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                                <% }else if(CVlist.get(1).getCountry().equals("china")){ %>
                                <img src="./country/C.png" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                            	<% }else if(CVlist.get(1).getCountry().equals("japan")){ %>
                                <img src="./country/J.png" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                            	<% }else if(CVlist.get(1).getCountry().equals("usa")){ %>
                                <img src="./country/U.png" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                            	<% }else { %>
                            	<img src="./country/" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                            	<% } %>
                            </div>
                            <div style="height: 5rem; display: flex; align-items: center; justify-content: center;">
                                <img src="./static/img/gold_medal.png" style="height: 2.5rem;">
                                <%= CVlist.get(1).getCountry() %>
                            </div>
                        </div>
                        <div style="width: 17rem;">
                            <div style="height: 12.5rem; display: flex; align-items: center; justify-content: center;">
                                <!-- 1위 국가 사진 -->
                                <% if(CVlist.get(0).getCountry().equals("korea")){ %>
                                <img src="./country/D.jpg" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                                <% }else if(CVlist.get(0).getCountry().equals("china")){ %>
                                <img src="./country/C.png" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                            	<% }else if(CVlist.get(0).getCountry().equals("japan")){ %>
                                <img src="./country/J.png" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                            	<% }else if(CVlist.get(0).getCountry().equals("usa")){ %>
                                <img src="./country/U.png" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                            	<% }else { %>
                            	<img src="./country/" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                            	<% } %>
                            </div>
                            <div style="height: 5rem; display: flex; align-items: center; justify-content: center;">
                                <img src="./static/img/gold_medal.png" style="height: 2.5rem;">
                                <!-- 1위 국가 이름 -->
                                <%= CVlist.get(1).getCountry() %>
                                </div>
                        </div>
                        <div style="width: 10rem;">
                            <div style="height: 12.5rem; display: flex; align-items: center; justify-content: center;">
                                <!-- 3위 국가 사진 -->
                                <% if(CVlist.get(2).getCountry().equals("korea")){ %>
                                <img src="./country/D.jpg" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                                <% }else if(CVlist.get(2).getCountry().equals("china")){ %>
                                <img src="./country/C.png" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                            	<% }else if(CVlist.get(2).getCountry().equals("japan")){ %>
                                <img src="./country/J.png" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                            	<% }else if(CVlist.get(2).getCountry().equals("usa")){ %>
                                <img src="./country/U.png" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                            	<% }else { %>
                            	<img src="./country/" style="width: 11.25rem; border: 0.0625rem solid #fff;">
                            	<% } %>
                            </div>
                            <div style="height: 5rem; display: flex; align-items: center; justify-content: center;">
                                <img src="./static/img/gold_medal.png" style="height: 2.5rem;">
                                <!-- 3위 국가 이름 -->
                                <%= CVlist.get(2).getCountry() %>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="height: 33.5rem;margin: 0 2.5rem;">
                    <!-- 테이블 -->
                    <div style="height: 33.5rem; background-color: rgba(207, 207, 207, 0.5); color: black; overflow:overlay;">
                        <!-- 테이블 제목 -->
                        <div style="font-size: 2rem; font-family: 'GmarketSansTTFBold'; display: grid; grid-template-columns: 5rem 8.75rem 6.25rem 12rem;">
                            <div>순위</div>
                            <div>국가</div>
                            <div></div>
                            <div>점수</div>
                        </div>
                        <!-- 테이블 내용 -->
                        <div style="font-size: 2rem; display: grid; grid-template-columns: 5rem 8rem 7rem 12rem;">
                            <% for(int i=0; i<CVlist.size(); i++) { %>
                            <%-- <input outline:none; border:none;" type="hidden" id="country<%= i %>" name="country"  onclick="countryclick(<%=i%>)"> --%>
                            <!-- 순위 -->
                            <div><%= CVlist.get(i).getRank() %></div>
                            <!-- 국가 사진/국가명 -->
                            <div>
                            	<% if(CVlist.get(i).getCountry().equals("korea")){ %>
                                <img src="./country/D.jpg" style="width: 5rem; border: 0.0625rem solid #fff;">
                                <% }else if(CVlist.get(i).getCountry().equals("china")){ %>
                                <img src="./country/C.png" style="width: 5rem; border: 0.0625rem solid #fff;">
                            	<% }else if(CVlist.get(i).getCountry().equals("japan")){ %>
                                <img src="./country/J.png" style="width: 5rem; border: 0.0625rem solid #fff;">
                            	<% }else if(CVlist.get(i).getCountry().equals("usa")){ %>
                                <img src="./country/U.png" style="width: 5rem; border: 0.0625rem solid #fff;">
                            	<% }else { %>
                            	<img src="./country/" style="width: 5rem; border: 0.0625rem solid #fff;">
                            	<% } %>
                            </div>
                            <!-- 국가명 -->
                            <div><input style="font-family: 'GmarketSansTTFBold'; font-size: 2rem; background-color:transparent; outline:none; border:none;" type="button" id="country<%= i %>" name="country" value="<%= CVlist.get(i).getCountry() %>" onclick="countryclick(<%=i%>)"></div>
                            <%-- <div><%= CVlist.get(i).getCountry() %></div> --%>
                            <!-- 점수 -->
                            <div><%= CVlist.get(i).getSum() %></div>
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
                    <div id="countryRankingTable" style="font-size: 2rem; display: grid; grid-template-columns: 5rem 9.75rem 21.25rem 5rem 4.9rem 4.9rem 4.9rem;">
                        <% for(int i=0; i<RCHlist.size(); i++) { %>
	                        <!-- 순위 -->
	                        <div><%=i+1 %></div>
	                        <!-- 프로필 사진 -->
	                        <div>
	                            <img src="./data/profile_image/<%= RCHlist.get(i).getProfile_Img() %>" style="height: 6.25rem; width: 6.25rem; border: 0.0625rem solid #fff; border-radius: 50%;">
	                        </div>
	                        <!-- 닉네임 -->
	                        <div><%= RCHlist.get(i).getNickname() %></div>
	                        <!-- 점수 -->
	                        <div><%= RCHlist.get(i).getAccuracy() %></div>
	                        <!-- 엠블럼 -->
	                        <% if(RCHlist.get(i).getEmblem_1() == null && RCHlist.get(i).getEmblem_2() == null && RCHlist.get(i).getEmblem_3()== null){ %>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>
	                        <% }else if(RCHlist.get(i).getEmblem_1() != null && RCHlist.get(i).getEmblem_2() == null && RCHlist.get(i).getEmblem_3()== null){%>
	                       	   <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./data/emblem<%= RCHlist.get(i).getEmblem_1() %>" style="height: 3.75rem; width: 3.75rem;"></div>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>
		                    <% }else if(RCHlist.get(i).getEmblem_1() != null && RCHlist.get(i).getEmblem_2() != null && RCHlist.get(i).getEmblem_3()== null){%>    
	                       	   <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./data/emblem<%= RCHlist.get(i).getEmblem_1() %>" style="height: 3.75rem; width: 3.75rem;"></div>
	                       	   <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./data/emblem<%= RCHlist.get(i).getEmblem_2() %>" style="height: 3.75rem; width: 3.75rem;"></div>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>
	                        <% }else if(RCHlist.get(i).getEmblem_1() != null && RCHlist.get(i).getEmblem_2() != null && RCHlist.get(i).getEmblem_3() != null){%>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/<%= RCHlist.get(i).getEmblem_1() %>" style="height: 3.75rem; width: 3.75rem;"></div>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/<%= RCHlist.get(i).getEmblem_2() %>" style="height: 3.75rem; width: 3.75rem;"></div>
		                       <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./static/img/<%= RCHlist.get(i).getEmblem_3() %>" style="height: 3.75rem; width: 3.75rem;"></div>
	                        <% } %>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function countryclick(num){
	$.ajax({
		type : "post",
		data : {
			"country" : $('#country'+num).val()
		},
		url : "RankCountryService",
		dataType: "JSON",
		success : function(data){
			console.log(data);
			$("#countryRankingTable").html(data);
			for(var i = 0; i < data.length; i++){
				$("#countryRankingTable").append('<div>'+data[i].rank+'</div>'); 
				$("#countryRankingTable").append('<div><img src=">'+data[i].profile_Img+'" style="height: 6.25rem; width: 6.25rem; border: 0.0625rem solid #fff; border-radius: 50%;"></div>'); 
				$("#countryRankingTable").append('<div>'+data[i].nickname+'</div>'); 
				$("#countryRankingTable").append('<div>'+data[i].accuracy+'</div>');
				if(data[i].emblem_1 == null && data[i].emblem_2 == null && data[i].emblem_3 == null){
					$("#countryRankingTable").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>');
					$("#countryRankingTable").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>');
					$("#countryRankingTable").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>');
				}else if(data[i].emblem_1 != null && data[i].emblem_2 == null && data[i].emblem_3 == null ){
					$("#countryRankingTable").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./data/emblem'+data[i].emblem_1+'" style="height: 3.75rem; width: 3.75rem;"></div>');
					$("#countryRankingTable").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>');
					$("#countryRankingTable").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>');
				}else if(data[i].emblem_1 != null && data[i].emblem_2 != null && data[i].emblem_3 == null ){
					$("#countryRankingTable").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./data/emblem'+data[i].emblem_1+'" style="height: 3.75rem; width: 3.75rem;"></div>');
					$("#countryRankingTable").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./data/emblem'+data[i].emblem_2+'" style="height: 3.75rem; width: 3.75rem;"></div>');
					$("#countryRankingTable").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"></div>');
				}else if(data[i].emblem_1 != null && data[i].emblem_2 != null && data[i].emblem_3 != null ){
					$("#countryRankingTable").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./data/emblem'+data[i].emblem_1+'" style="height: 3.75rem; width: 3.75rem;"></div>');
					$("#countryRankingTable").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./data/emblem'+data[i].emblem_2+'" style="height: 3.75rem; width: 3.75rem;"></div>');
					$("#countryRankingTable").append('<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 1rem;"><img src="./data/emblem'+data[i].emblem_3+'" style="height: 3.75rem; width: 3.75rem;"></div>');
				}
				
			}	
		},
		error : function(){
			alert("실패");
		}
	});
}
</script>
</body>
</html>