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
        $(document).ready(function() {
			$("#emblem").load("./emblem.html");
		});
        sessionStorage.clear();
        sessionStorage.setItem("mypage", "mypageEN");
        console.log(sessionStorage.getItem("mypage"));
	</script>
    <title>MyPage</title>
</head>
<body>
    <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
        <!-- 상단 네비게이션 -->
        <div id="navi"></div>
        <!-- 메인 내용 -->
        <div style="height: 1rem;"></div>
        <div style="display: flex; flex-direction: row; height: 51rem;">
            <div style="width: 100%; height: 51rem; margin: 0 1rem;">
                <!-- 사용자 프로필 -->
                <div style="height: 14.5rem; background-color: rgba(207, 207, 207, 0.5); display: flex; flex-direction: row;">
                    <div style="width: 2.5rem; height: 100%;"></div>
                    <!-- 프로필 사진 -->
                    <div style="width: 12.5rem; height: 100%;">
                        <img src="./data/profile_image/iu3.jpg" style="height: 12.5rem; border: 0.0625rem solid #fff; border-radius: 50%; margin-top: 1rem;">
                    </div>
                    <div style="width: 14rem; height: 100%;">
                        <div>ID</div>
                        <div>NICKNAME</div>
                        <div>COUNTRY</div>
                        <!-- 엠블럼 -->
                        <div>
                            <img src="./static/img/gold_medal.png" style="height: 2.5rem;">
                            <img src="./static/img/silver_medal.png" style="height: 2.5rem;">
                            <img src="./static/img/silver_medal.png" style="height: 2.5rem;">
                        </div>
                    </div>
                    <div style="width: 12.75rem; height: 100%;">
                        <!-- 아이디 -->
                        <div>iu1004</div>
                        <!-- 닉네임 -->
                        <div>아이유애나</div>
                        <!-- 국기 -->
                        <div><img src="./static/img/태극기.jpg" style="width: 6.75rem;"></div>
                        <!-- 국가명 -->
                        <div>대한민국</div>
                    </div>
                    <div style="width: 15.25rem; height: 100%;">
                        <!-- 회원등급 -->
                        <div>General Membership</div>
                        <div>
                            <input type="button" value="개인정보 수정">
                        </div>
                        <div>
                            <input type="button" value="리플레이" onclick="location.href='./replay.html'">
                        </div>
                        <div>
                            <input type="checkbox" id="btnEmblem">
                            <label for="btnEmblem">    
                                <div style="width: 10rem; height: 2.5rem; background-color: black; border: 0.0625rem solid white; margin: auto; display: flex; justify-content: center; align-items: center;">Emblem Fix</div>
                            </label>
                            <div id="emblem"></div>
                        </div>
                    </div>
                </div>
                <div style="height: 1rem;"></div>
                <!-- 테이블 -->
                <div style="height: 35.5rem; background-color: rgba(207, 207, 207, 0.5); color: black; overflow:overlay;">
                    <!-- 테이블 제목 -->
                    <div style="font-size: 2rem; font-family: 'GmarketSansTTFBold'; display: grid; grid-template-columns: 5rem 10rem 18.75rem 4.5rem 8rem 10.75rem;">
                        <div>Num</div>
                        <div></div>
                        <div>SongInfo</div>
                        <div>Rank</div>
                        <div>Score</div>
                        <div>Date</div>
                    </div>
                    <!-- 테이블 내용 -->
                    <div style="font-size: 2rem; display: grid; grid-template-columns: 5rem 10rem 18.75rem 4.5rem 8rem 10.75rem;">
                        <!-- 반복 1 -->
                        <!-- 번호 -->
                        <div>1</div>
                        <!-- 앨범 이미지 -->
                        <div><img src="./static/img/라일락.jpg" style="height: 5rem; border: 0.0625rem solid #fff;"></div>
                        <!-- 노래 제목/가수/앨범명 -->
                        <div>
                            라일락<br><br>
                            <span style="font-size: 1.2rem;">아이유 (IU) | IU 5th Album 'LILAC'</span>
                        </div>
                        <!-- 순위 -->
                        <div>14</div>
                        <!-- 점수 -->
                        <div>64.57</div>
                        <!-- 점수 경신 날짜 -->
                        <div>2021.08.04</div>
                        <!-- 반복 2 -->
                        <div>1</div>
                        <div><img src="./static/img/라일락.jpg" style="height: 5rem; border: 0.0625rem solid #fff;"></div>
                        <div>라일락<br><br><span style="font-size: 1.2rem;">아이유 (IU) | IU 5th Album 'LILAC'</span></div>
                        <div>14</div>
                        <div>64.57</div>
                        <div>2021.08.04</div>
                        <!-- 반복 3 -->
                        <div>1</div>
                        <div><img src="./static/img/라일락.jpg" style="height: 5rem; border: 0.0625rem solid #fff;"></div>
                        <div>라일락<br><br><span style="font-size: 1.2rem;">아이유 (IU) | IU 5th Album 'LILAC'</span></div>
                        <div>14</div>
                        <div>64.57</div>
                        <div>2021.08.04</div>
                        <!-- 반복 4 -->
                        <div>1</div>
                        <div><img src="./static/img/라일락.jpg" style="height: 5rem; border: 0.0625rem solid #fff;"></div>
                        <div>라일락<br><br><span style="font-size: 1.2rem;">아이유 (IU) | IU 5th Album 'LILAC'</span></div>
                        <div>14</div>
                        <div>64.57</div>
                        <div>2021.08.04</div>
                       
                    </div>
                </div>
            </div>
            <div style="width: 100%; height: 51rem; margin: 0 1rem;">
                <!-- 차트 1 -->
                <div style="height: 25rem; background-color: red;">
                    차트1
                </div>
                <div style="height: 1rem;"></div>
                <!-- 차트 2 -->
                <div style="height: 25rem; background-color: blue;">
                    차트2
                </div>
            </div>
        </div>
    </div>
</body>
</html>