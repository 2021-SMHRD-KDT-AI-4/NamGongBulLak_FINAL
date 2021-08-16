<%@page import="model.MainRankingDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MainRankingDAO"%>
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
			$("#navi").load("./navigationEN.jsp");
		});
        sessionStorage.clear();
        sessionStorage.setItem("main", "mainEN");
        console.log(sessionStorage.getItem("main"));
	</script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <title>Main</title>
</head>
<body>
<%
MainRankingDAO dao = new MainRankingDAO();

ArrayList<String> c_list = dao.load_country();

ArrayList<Integer> c_rank = new ArrayList<Integer>();

for(int i =0; i<c_list.size(); i++){
	c_rank.add(dao.sumacc(c_list.get(i)));
}
int max = 0;

for(int i =0; i<c_rank.size(); i++){
	if(c_rank.get(i)>max){
		max = c_rank.get(i);
	}
}

String country = "";

for(int i =0; i<c_rank.size(); i++){
	if(c_rank.get(i)==max){
		country = c_list.get(i);
	}
}
ArrayList<MainRankingDTO> dto = dao.load_top3_acc(country);

for(int i=0; i<dto.size(); i++){
	System.out.println(dto.get(i).getNickname()+"/"+dto.get(i).getUser_accuracy());
}

String flag = "";

if(country.equals("korea")){
	flag="태극기";
}else if(country.equals("usa")){
	flag="usa";
}else if(country.equals("japan")){
	flag="japan";
}else if(country.equals("china")){
	flag="china";
}

String na = "";

if(country.equals("korea")){
	na="KOREA";
}else if(country.equals("usa")){
	na="U.S.A";
}else if(country.equals("japan")){
	na="JAPAN";
}else if(country.equals("china")){
	na="CHINA";
}



%>
    <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
        <!-- 상단 네비게이션 -->
        <div id="navi"></div>
        <!-- 메인 내용 -->
        <div style="height: 100%; display: flex;">
            <div style="width: 50%; height: 100%;">
                <div style="width: 50rem; height: 50rem; margin: 1.5rem 5.5rem 1.5rem 4.5rem; background-color: rgba(0,0,0,0.5); border: 0.125rem solid white; border-radius: 2rem;">
                    <div style="height: 10rem; margin-top: 3rem; display: flex; margin-bottom: 2rem;">
                        <div style="width: 50%; height: 100%;">
                            <div style="width: 16.25rem; height: 10rem; margin-left: 7.5rem; margin-right: 1.25rem;">
                                <!-- 우승 국가 이미지 -->
                                <img src="./static/img/<%=flag %>.jpg" style="width: 100%; height: 100%;">
                            </div>
                        </div>
                        <div style="width: 50%; height: 100%; display: flex; flex-direction: column; justify-content: center; align-items: flex-start; font-family: 'GmarketSansTTFBold';">
                            <!-- 시즌 / 우승 국가 이름 -->
                            <span><%=dto.get(0).getSeason() %> SEASON CHAMPION COUNTRY</span><br>
                            <span style="font-size: 2.0rem;"><%=na %></span>
                        </div>
                    </div>

                    <!-- 1위 -->
                    <div style="height: 10rem; display: flex; margin-bottom: 1.25rem;">
                        <div style="width: 15%; height: 100%;">
                            <div style="width: 3.75rem; height: 3.75rem; margin: 3.125rem 0  3.125rem 3.75rem;">
                                <!-- 메달 이미지 -->
                                <img src="./static/img/gold_medal.png" style="width: 100%; height: 100%;">
                            </div>
                        </div>
                        <div style="width: 25%; height: 100%;">
                            <div style="width: 10rem; height: 10rem; margin: 0 1.25rem;">
                                <!-- 프로필 이미지 -->
                                <img src="./data/profile_image/iu3.jpg" style="width: 100%; height: 100%; border: 0.0625rem solid white; border-radius: 50%;">
                            </div>
                        </div>
                        <div style="width: 60%; height: 100%; display: flex; flex-direction: column; justify-content: center; align-items: flex-start;">
                            <!-- 닉네임 / 점수 -->
                            <span>NICKNAME : <%=dto.get(0).getNickname() %></span><br>
                            <span>SCORE : <%=dto.get(0).getUser_accuracy() %></span>
                        </div>
                    </div>

                    <!-- 2위 -->
                    <div style="height: 10rem; display: flex; margin-bottom: 1.25rem;">
                        <div style="width: 15%; height: 100%;">
                            <div style="width: 3.75rem; height: 3.75rem; margin: 3.125rem 0  3.125rem 3.75rem;">
                                <!-- 메달 이미지 -->
                                <img src="./static/img/gold_medal.png" style="width: 100%; height: 100%;">
                            </div>
                        </div>
                        <div style="width: 25%; height: 100%;">
                            <div style="width: 10rem; height: 10rem; margin: 0 1.25rem;">
                                <!-- 프로필 이미지 -->
                                <img src="./data/profile_image/iu3.jpg" style="width: 100%; height: 100%; border: 0.0625rem solid white; border-radius: 50%;">
                            </div>
                        </div>
                        <div style="width: 60%; height: 100%; display: flex; flex-direction: column; justify-content: center; align-items: flex-start;">
                            <!-- 닉네임 / 점수 -->
                            <span>NICKNAME : <%=dto.get(1).getNickname() %></span><br>
                            <span>SCORE : <%=dto.get(1).getUser_accuracy() %></span>
                        </div>
                    </div>

                    <!-- 3위 -->
                    <div style="height: 10rem; display: flex; margin-bottom: 1.25rem;">
                        <div style="width: 15%; height: 100%;">
                            <div style="width: 3.75rem; height: 3.75rem; margin: 3.125rem 0  3.125rem 3.75rem;">
                                <!-- 메달 이미지 -->
                                <img src="./static/img/gold_medal.png" style="width: 100%; height: 100%;">
                            </div>
                        </div>
                        <div style="width: 25%; height: 100%;">
                            <div style="width: 10rem; height: 10rem; margin: 0 1.25rem;">
                                <!-- 프로필 이미지 -->
                                <img src="./data/profile_image/iu3.jpg" style="width: 100%; height: 100%; border: 0.0625rem solid white; border-radius: 50%;">
                            </div>
                        </div>
                        <div style="width: 60%; height: 100%; display: flex; flex-direction: column; justify-content: center; align-items: flex-start;">
                            <!-- 닉네임 / 점수 -->
                            <span>NICKNAME : <%=dto.get(2).getNickname() %></span><br>
                            <span>SCORE : <%=dto.get(2).getUser_accuracy() %></span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 웹페이지 소개글 이미지 -->
            <div style="width: 50%; height: 100%;">
                <img src="./static/img/main_sample3.png" style="height: 53rem; width: 100%;">
            </div>
        </div>
    </div>
</body>
</htmml>