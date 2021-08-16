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
        <!-- ��� �׺���̼� -->
        <div id="navi"></div>
        <!-- ���� ���� -->
        <div style="height: 1rem;"></div>
        <div style="display: flex; flex-direction: row; height: 51rem;">
            <div style="width: 100%; height: 51rem; margin: 0 1rem;">
                <!-- ����� ������ -->
                <div style="height: 14.5rem; background-color: rgba(207, 207, 207, 0.5); display: flex; flex-direction: row;">
                    <div style="width: 2.5rem; height: 100%;"></div>
                    <!-- ������ ���� -->
                    <div style="width: 12.5rem; height: 100%;">
                        <img src="./data/profile_image/iu3.jpg" style="height: 12.5rem; border: 0.0625rem solid #fff; border-radius: 50%; margin-top: 1rem;">
                    </div>
                    <div style="width: 14rem; height: 100%;">
                        <div>ID</div>
                        <div>NICKNAME</div>
                        <div>COUNTRY</div>
                        <!-- ���� -->
                        <div>
                            <img src="./static/img/gold_medal.png" style="height: 2.5rem;">
                            <img src="./static/img/silver_medal.png" style="height: 2.5rem;">
                            <img src="./static/img/silver_medal.png" style="height: 2.5rem;">
                        </div>
                    </div>
                    <div style="width: 12.75rem; height: 100%;">
                        <!-- ���̵� -->
                        <div>iu1004</div>
                        <!-- �г��� -->
                        <div>�������ֳ�</div>
                        <!-- ���� -->
                        <div><img src="./static/img/�±ر�.jpg" style="width: 6.75rem;"></div>
                        <!-- ������ -->
                        <div>���ѹα�</div>
                    </div>
                    <div style="width: 15.25rem; height: 100%;">
                        <!-- ȸ����� -->
                        <div>General Membership</div>
                        <div>
                            <input type="button" value="�������� ����">
                        </div>
                        <div>
                            <input type="button" value="���÷���" onclick="location.href='./replay.html'">
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
                <!-- ���̺� -->
                <div style="height: 35.5rem; background-color: rgba(207, 207, 207, 0.5); color: black; overflow:overlay;">
                    <!-- ���̺� ���� -->
                    <div style="font-size: 2rem; font-family: 'GmarketSansTTFBold'; display: grid; grid-template-columns: 5rem 10rem 18.75rem 4.5rem 8rem 10.75rem;">
                        <div>Num</div>
                        <div></div>
                        <div>SongInfo</div>
                        <div>Rank</div>
                        <div>Score</div>
                        <div>Date</div>
                    </div>
                    <!-- ���̺� ���� -->
                    <div style="font-size: 2rem; display: grid; grid-template-columns: 5rem 10rem 18.75rem 4.5rem 8rem 10.75rem;">
                        <!-- �ݺ� 1 -->
                        <!-- ��ȣ -->
                        <div>1</div>
                        <!-- �ٹ� �̹��� -->
                        <div><img src="./static/img/���϶�.jpg" style="height: 5rem; border: 0.0625rem solid #fff;"></div>
                        <!-- �뷡 ����/����/�ٹ��� -->
                        <div>
                            ���϶�<br><br>
                            <span style="font-size: 1.2rem;">������ (IU) | IU 5th Album 'LILAC'</span>
                        </div>
                        <!-- ���� -->
                        <div>14</div>
                        <!-- ���� -->
                        <div>64.57</div>
                        <!-- ���� ��� ��¥ -->
                        <div>2021.08.04</div>
                        <!-- �ݺ� 2 -->
                        <div>1</div>
                        <div><img src="./static/img/���϶�.jpg" style="height: 5rem; border: 0.0625rem solid #fff;"></div>
                        <div>���϶�<br><br><span style="font-size: 1.2rem;">������ (IU) | IU 5th Album 'LILAC'</span></div>
                        <div>14</div>
                        <div>64.57</div>
                        <div>2021.08.04</div>
                        <!-- �ݺ� 3 -->
                        <div>1</div>
                        <div><img src="./static/img/���϶�.jpg" style="height: 5rem; border: 0.0625rem solid #fff;"></div>
                        <div>���϶�<br><br><span style="font-size: 1.2rem;">������ (IU) | IU 5th Album 'LILAC'</span></div>
                        <div>14</div>
                        <div>64.57</div>
                        <div>2021.08.04</div>
                        <!-- �ݺ� 4 -->
                        <div>1</div>
                        <div><img src="./static/img/���϶�.jpg" style="height: 5rem; border: 0.0625rem solid #fff;"></div>
                        <div>���϶�<br><br><span style="font-size: 1.2rem;">������ (IU) | IU 5th Album 'LILAC'</span></div>
                        <div>14</div>
                        <div>64.57</div>
                        <div>2021.08.04</div>
                       
                    </div>
                </div>
            </div>
            <div style="width: 100%; height: 51rem; margin: 0 1rem;">
                <!-- ��Ʈ 1 -->
                <div style="height: 25rem; background-color: red;">
                    ��Ʈ1
                </div>
                <div style="height: 1rem;"></div>
                <!-- ��Ʈ 2 -->
                <div style="height: 25rem; background-color: blue;">
                    ��Ʈ2
                </div>
            </div>
        </div>
    </div>
</body>
</html>