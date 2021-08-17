<%@page import="model.ProductBuyinfoDAO"%>
<%@page import="model.MyDanceinfoDTO"%>
<%@page import="model.EmblemInfoDAO"%>
<%@page import="model.mdiDTO"%>
<%@page import="model.MyDanceinfoDAO"%>
<%@page import="model.EmblemInfoDAO"%>
<%@page import="model.MyDanceinfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 임포트 -->
<link rel="stylesheet" href="./static/css/style.css" />
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#navi").load("./navigationKR.jsp");
	});
	$(document).ready(function() {
		$("#emblem").load("./emblem.jsp");
	});
	$(document).ready(function() {
		$("#virtualface").load("./virtualface.jsp");
	});
</script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<title>MyPage</title>

<style>

</style>
</head>
<body >
	<%
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		EmblemInfoDAO embDAO = new EmblemInfoDAO();
		ProductBuyinfoDAO proDAO = new ProductBuyinfoDAO();
		MemberDTO memInfo = (MemberDTO)session.getAttribute("info");
		String id = memInfo.getId();
		MyDanceinfoDTO danceInfo = (MyDanceinfoDTO)session.getAttribute("danceinfo");
		String[] data = null;
		String data2 = null;
		String[] embList = embDAO.selectEmblem(id);
		String[] selectedList = proDAO.selectedVirtualFace(id);
		//System.out.println("1 : " + embList[0] + "/ 2 : " + embList[1] + "/ 3 : " + embList[2]);
		try{
			data = request.getParameter("data").split("/");
			data2 = request.getParameter("data2");
		}catch(NullPointerException e){
			System.out.println("data가 없습니다");
		}
		
		if(data!=null){
			embDAO.updateEmblem(data[0], data[1], data[2], memInfo.getId());
			embList = embDAO.selectEmblem(id);
			proDAO.updateVirtualFace(data2, id);
			selectedList = proDAO.selectedVirtualFace(id);
		}
	%>
	<div style="background-color: rgba(0, 0, 0, 0.5); width: 100%; height: 100vh;" class="container">
		<!-- 상단 네비게이션 -->
		<div id="navi"></div>
		<!-- 메인 내용 -->
		<div style="height: 1rem; "></div>
		<div style="display: flex; flex-direction: row; height: 51rem;">
			<div style="width: 100%; height: 51rem; margin: 0 1rem; ">
				<!-- 사용자 프로필 -->
				<div style="width: 57rem; height: 14.5rem; border-radius: 1em; background-color: rgba(207, 207, 207, 0.5); display: flex; flex-direction: row;">
					<div style="width: 2.5rem; height: 14.5rem;"></div>
					<!-- 프로필 사진 -->
					<div style="width: 12.5rem; height: 12.5rem;">
						<img src="./data/profile_image/<%= memInfo.getProfile_img() %>"
							style="width: 100%; height: 100%; border: 0.0625rem solid #fff; border-radius: 50%; margin-top: 1rem;">
					</div>
					<div style="width: 14.25rem; height: 14.5rem; font-family: 'GmarketSansTTFBold';">
						<div style="margin-bottom: 1.25rem; margin-top: 1.25rem;">ID</div>
						<div style="margin-bottom: 1.25rem">NICKNAME</div>
						<div style="margin-bottom: 1.25rem">COUNTRY</div>
						<!-- 엠블럼 -->
						<div style="width: 14.25rem; display: flex; justify-content: center; align-items: center;">
							<%
								if(!(embList[0].equals("0"))){ 
							%>
								<div style="width: 2.5rem; height: 2.5rem;">
									<img src="./static/img/emblem/<%= embList[0] %>" style="width: 100%; height: 100%;">
								</div>
							<%
								} else {
							%>
								<div style="width: 2.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 0.5rem; color: black; font-size: 1.0rem; display: flex; justify-content: center; align-items: center;">
									1
								</div>
							<%
								}
							%>
							<%
								if(!(embList[1].equals("0"))){ 
							%>
								<div style="width: 2.5rem; height: 2.5rem;">
									<img src="./static/img/emblem/<%= embList[1] %>" style="width: 100%; height: 100%;">
								</div>
							<%
								} else {
							%>
								<div style="width: 2.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 0.5rem; color: black; font-size: 1.0rem; display: flex; justify-content: center; align-items: center;">
									2
								</div>
							<%
								}
							%>
							<%
								if(!(embList[2].equals("0"))){ 
							%>
								<div style="width: 2.5rem; height: 2.5rem;">
									<img src="./static/img/emblem/<%= embList[2] %>" style="width: 100%; height: 100%;">
								</div>
							<%
								} else {
							%>
								<div style="width: 2.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 0.5rem; color: black; font-size: 1.0rem; display: flex; justify-content: center; align-items: center;">
									3
								</div>
							<%
								}
							%>
                          	<%
                          		if (!(selectedList[0] == null)) {
                          	%>
                          		<div style="width: 3.75rem; height: 3.75rem;">
                            		<img src="./static/img/<%= selectedList[0] %>" style="height: 100%; width: 100%; border-radius: 1rem;">
                          		</div>
                          	<%
                          		} else {
                          	%>
	                           	<div style="width: 3.75rem; height: 3.75rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; color: black; font-size: 1.0rem; display: flex; justify-content: center; align-items: center;">
	                           		버츄얼<br>페이스
	                           	</div>
                          	<%
                          		}
                          	%>
						</div>
					</div>
					<div style="width: 12.75rem; height: 14.5rem;">
						<div style="margin-bottom: 1.25rem; margin-top: 1.25rem;"><%= memInfo.getId() %></div>
						<div style="margin-bottom: 0.25rem"><%= memInfo.getNickname() %></div>
						<div style="width: 8.5rem; height:5.5rem; margin: auto;"><img src="./static/img/<%= memInfo.getCountry() %>.jpg" style="width: 100%; height: 100%;"><%-- <%= country %> --%></div>
						<div style="margin-top: 0.25rem"><%= memInfo.getCountry() %></div>
					</div>
					<div style="width: 15.25rem; height: 100%; ">
						<!-- 회원등급 -->
						<div style="margin-bottom: 0.5rem; margin-top: 0.5rem;">
							<%
								if (memInfo.getPremium().equals("1")) {
							%>
									프리미엄회원
							<%
								} else {
							%>
									일반회원
							<%
								}
							%>
						</div>
						<div style="margin-bottom: 0.5rem;">
							<input style="width: 10rem; border-radius: 1rem; height: 2rem; background-color: black; color:white; border: 0.0625rem solid white; margin: auto; display: flex; justify-content: center; align-items: center; margin-bottom: 0.5rem; font-size: 1.2rem;" type="button" value="개인정보 수정" 
								onclick="location.href='./edit_profile.jsp'">
						</div>
						<div style="margin-bottom: 0.5rem;">
							<input style="width: 10rem; border-radius: 1rem; height: 2rem; background-color: black; color:white; border: 0.0625rem solid white; font-size: 1.2rem;" type="button" value="리플레이"
								onclick="location.href='./replay.jsp'">
						</div>
						<div>
							<input type="checkbox" id="btnEmblem"> 
							<label for="btnEmblem">
								<div style="width: 10rem; border-radius: 1rem; height: 2rem; background-color: black; border: 0.0625rem solid white; margin: 0 auto; margin-bottom: 0.5rem; display: flex; justify-content: center; align-items: center; font-size: 1.2rem;">
									엠블럼 수정
								</div>
							</label>
							<div id="emblem"></div>
						</div>
						<div>
                            <input type="checkbox" id="btnVirtualFace">
                            <label for="btnVirtualFace">    
                                <div style="width: 10rem; border-radius: 1rem; height: 2rem; background-color: black; border: 0.0625rem solid white; margin: 0 auto; margin-bottom: 0.5rem; display: flex; justify-content: center; align-items: center; font-size: 1.2rem;">
                                	버츄얼페이스 수정
                                </div>
                            </label>
                            <div id="virtualface"></div>
                        </div>
					</div>
				</div>
				<div style="height: 1rem;"></div>
				<!-- 테이블 -->
				<%
					MyDanceinfoDAO danceDAO = new MyDanceinfoDAO();
					ArrayList<mdiDTO> list = danceDAO.select(id);
					
				%>
				<div style="height: 35.5rem;  text-align: center; border-radius: 1em; background-color: rgba(207, 207, 207, 0.5); color: black; overflow: overlay;">
					<!-- 테이블 제목 -->
					<div style="font-size: 1.5rem; font-family: 'GmarketSansTTFBold'; display: grid; grid-template-columns: 5rem 10rem 18.75rem 4.5rem 8rem 10.75rem;">
						<div style="border-bottom: 3px solid white; color:white;"><strong>번호</strong></div>
						<div style="border-bottom: 3px solid white; color:white;"><strong>앨범</strong></div>
						<div style="border-bottom: 3px solid white; color:white; text-align:left"><strong>곡정보</strong></div>
						<div style="border-bottom: 3px solid white; color:white;"><strong>순위</strong></div>
						<div style="border-bottom: 3px solid white; color:white;"><strong>점수</strong></div>
						<div style="border-bottom: 3px solid white; color:white;"><strong>날짜</strong></div>
					</div>
					<!-- 테이블 내용 -->
					<div style="font-size: 1.2rem; font-family: 'GmarketSansTTFBold'; color:white; display: grid; grid-template-columns: 5rem 10rem 18.75rem 4.5rem 8rem 10.75rem; ">
						<!-- 반복 1 -->
						<%
							for (int i=0; i<list.size(); i++) {
						%>
						<!-- 번호 -->
						<div style="border-bottom: 1px solid white; margin-top:25px;"><%= i+1 %></div>
						<!-- 앨범 이미지 -->
						<div style="border-bottom: 1px solid white;">
							<img src="./static/img/la.jpg"
								style="height: 5rem; border: 0.0625rem solid #fff; ">
						</div>
						<!-- 노래 제목/가수/앨범명 -->
						<div style="border-bottom: 1px solid white; margin-top:15px; text-align:left;">
							<%= list.get(i).getSong_title() %><br><span style="font-size: 1.2rem; font-size:15px">
							<%= list.get(i).getSong_singer()  %></span>
						</div>
						<!-- 순위 -->
						<div style="border-bottom: 1px solid white; margin-top:25px; font-size:20px">
						14
						</div>
						<!-- 점수 -->
						<div style="border-bottom: 1px solid white; margin-top:25px; font-size:20px">
						<%= list.get(i).getUser_accuracy() %>
						</div>
						<!-- 점수 경신 날짜 -->
						<div style="border-bottom: 1px solid white; margin-top:25px; font-size:20px">2021.08.04</div>
						<% } %>
					</div>
				</div>
			</div>
			<div style="width: 100%; height: 50rem; margin: 0 1rem;">
				<!-- 차트 1 -->
						<%
							ArrayList<MyDanceinfoDTO> acclist = danceDAO.avgAcc();
							ArrayList<MyDanceinfoDTO> mylist = danceDAO.myAcc(memInfo.getId());
						%>
				<div style="background-color: white; border-radius: 1em; display: block; width: 900px; height: 45%;">
						<div style="height: 100%; width: 80%; float: left;">
						<canvas id="myChart1"></canvas>
						</div>
						<div style="color: black; float: left; margin-top:13px; font-size:25px" >전체 평균 점수</div>
						<div style="float: none;">
						<p id="avg1" style="color:#28A0FF; font-size:30px"></p>
						</div>
						
				</div>
				<div style="height: 1rem;  font-size: 1rem; margin-top: 0px; "></div>
				<!-- 차트 2 -->
				<div style="background-color: white; border-radius: 1em; display: block; width: 900px; height: 45%;">
						<div style="height: 100%; width: 80%; float: left;">
						<canvas id="myChart2"></canvas>
						</div>
						<div style="color: black; float: left; margin-top:13px; font-size:25px" >내 평균 점수</div>
						<div style="float: left; margin: 4.5rem;">
						<p id="avg2" style="color:#28A0FF; font-size:30px"></p>
						</div>
						<div style="color: black; float: left; font-size:25px; width:150px" ></div>
						
						
				</div>
				
			</div>
		</div>
	</div>
	<script>
	
	

		/* 정확도 평균 구하기 + 날짜 */ 
		// 각 유저 데이터에서 영상사용자정확도, 날짜 등 가져와서 배열에 집어놓고
		// 아래 라벨과 데이터셋에 집어넣는방식
		
		
		var userAccuracys = new Array();
		var userPlaydate = new Array();
		
		<% for (int i = 0; i < acclist.size(); i++) { %>
		
		userAccuracys.push(<%= acclist.get(i).getUser_accuracy() %>);
		
		userPlaydate.push('<%= acclist.get(i).getPlay_date() %>');
		
		<% } %>
		
		var ctx1 = document.getElementById('myChart1');
		var myChart1 = new Chart(ctx1, {
			type : 'line',
			data : {
				labels : [ userPlaydate[0], userPlaydate[1], userPlaydate[2], userPlaydate[3], userPlaydate[4], userPlaydate[5], userPlaydate[6] ], // << playDate 값 넣기
				datasets : [ {
					label : '순위 변동',
					data : [ userAccuracys[0], userAccuracys[1], userAccuracys[2], userAccuracys[3], userAccuracys[4], userAccuracys[5], userAccuracys[6] ], // << 정확도 넣기
					 backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ], 
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			}
		});
		window.addEventListener('load', (event) => {
			  const canvas1 = document.getElementById('myChart1');
			  const ctx1 = canvas1.getContext('2d');
			  function screenSize() {
			    canvas1.height = "100vh";
			    canvas1.width = "100vw";
			  }
			});
		
		var sum1 = 0;
		for (var i=0; i<userAccuracys.length; i++) {
			sum1 += userAccuracys[i];
		}
		var avg1 = parseInt(sum1 / userAccuracys.length);
		console.log(avg1);
		document.getElementById('avg1').innerHTML = avg1;
	</script>
	<script>
		/* 정확도 평균 구하기 */
		var myAccuracys = new Array();
		var myPlaydate = new Array();
		
		<% for (int i = 0; i < mylist.size(); i++) { %>
		
		myAccuracys.push(<%= mylist.get(i).getUser_accuracy() %>);
		
		myPlaydate.push('<%= mylist.get(i).getPlay_date() %>');
		
		<% } %>
		
		 // 날짜
		// 각 유저 데이터에서 영상사용자정확도, 날짜 등 가져와서 배열에 집어놓고
		// 아래 라벨과 데이터셋에 집어넣는방식
		
	
		
		var ctx2 = document.getElementById('myChart2');
		var myChart2 = new Chart(ctx2, {
			type : 'line',
			data : {
				labels : [ myPlaydate[0], myPlaydate[1], myPlaydate[2], myPlaydate[3], myPlaydate[4], myPlaydate[5], myPlaydate[6] ], // << playDate 값 넣기
				datasets : [ {
					label : '순위 변동',
					data : [ myAccuracys[0], myAccuracys[1], myAccuracys[2], myAccuracys[3], myAccuracys[4], myAccuracys[5], myAccuracys[6] ], // << 정확도 넣기
					 /* backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ], 
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ] ,*/
					borderWidth : 1
				} ]
			}
		});
		window.addEventListener('load', (event) => {
			  const canvas2 = document.getElementById('myChart2');
			  const ctx2 = canvas2.getContext('2d');
			  function screenSize() {
			    canvas2.height = "100vh";
			    canvas2.width = "100vw";
			  }
			});
		
		var sum2 = 0;
		for (var i=0; i<myAccuracys.length; i++) {
			sum2 += myAccuracys[i];
		}
		var avg2 = parseInt(sum2 / myAccuracys.length);
		console.log(avg2);
		document.getElementById('avg2').innerHTML = avg2;
	</script>
</body>
</html>