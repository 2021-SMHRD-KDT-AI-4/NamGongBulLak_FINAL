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
			$("#navi").load("./navigationKR.jsp");
		});
        $(document).ready(function() {
			$("#payment").load("./paymentKR.jsp");
		});
        sessionStorage.clear();
        sessionStorage.setItem("store", "storeKR");
        console.log(sessionStorage.getItem("store"));
	</script>
    <title>Store</title>
</head>
<body>
    <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
        <!-- 상단 네비게이션 -->
        <div id="navi"></div>
        <!-- 메인 내용 -->
        <div style="height: 1.25rem"></div>
        <div style="width: 79.5rem; height: 48rem; background-color: rgba(0,0,0,0.5); margin: auto; padding: 1.25rem 1rem 1.25rem 1.25rem; border-radius: 1rem; overflow: overlay">
            <!-- SPECIAL -->
            <div style="height: 1.75rem; font-family: 'GmarketSansTTFBold'; font-size: 2.0rem; margin-bottom: 2rem;">[&nbsp;&nbsp;S P E C I A L&nbsp;&nbsp;]</div>
            <div style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr 1fr;">
                
                <!-- 상품1 -->
                <div style="width: 12.5rem; height: 15rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 2.5rem;">
                    <input type="checkbox" id="btnPayment">
                    <div class='product' style="width: 12.5rem; height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.7); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="width: 7.5rem; height: 7.5rem; margin: 0 auto 1rem auto; padding-top: 1.25rem;">
                            <!-- 상품 이미지 -->
                            <img src="./static/img/premium.png" style="width: 100%; height: 100%;">
                        </div>
                        <!-- 상품 이름 -->
                        <span style="font-size: 1.2rem; color: black;" id="prpr" value="premium">PREMIUM 회원</span>
                    </div>
                    <!-- 상품 hover 시 -->
                    <div class="hoverProduct" style="height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.5); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="height: 5.5rem;"></div>
                        <div>
                            <label for="btnPayment">
                                <!-- 구입하기 버튼 -->
                                <div id="pr1" style="width: 7.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; margin: auto; display: flex; justify-content: center; align-items: center; color: black;">구입하기</div>
                            </label>
                            <div id="payment"></div>
                        </div>
                    </div>
                    <div style="height: 2.5rem; background-color: black; border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem; border-bottom: 0.0625rem solid white;">
                        <div style="height: 0.5rem;"></div>
                        <!-- 상품 가격 -->
                        <span style="font-size: 1.2rem;" id="prprice" value="7000">7000원/월</span>
                    </div>
                </div>

            </div>

            <!-- MUSIC -->
            <div style="height: 1.75rem; font-family: 'GmarketSansTTFBold'; font-size: 2.0rem; margin-bottom: 2rem;">[&nbsp;&nbsp;M U S I C&nbsp;&nbsp;]</div>
            <div style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr 1fr;">
                
                <!-- 상품1 -->
                <div style="width: 12.5rem; height: 15rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 2.5rem;">
                    <input type="checkbox" id="btnPayment">
                    <div class='product' style="width: 12.5rem; height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.7); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="width: 7.5rem; height: 7.5rem; margin: 0 auto 1rem auto; padding-top: 1.25rem;">
                            <!-- 상품 이미지 -->
                            <img src="./static/img/music.png" style="width: 100%; height: 100%;">
                        </div>
                        <!-- 상품 이름 -->
                        <span style="font-size: 1.2rem; color: black;" id="spr55" value="spr5">노래 이용권 (5회)</span>
                    </div>
                    <!-- 상품 hover 시 -->
                    <div class="hoverProduct" style="height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.5); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="height: 5.5rem;"></div>
                        <div>
                            <label for="btnPayment">
                                <!-- 구입하기 버튼 -->
                                <div id="pr2" style="width: 7.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; margin: auto; display: flex; justify-content: center; align-items: center; color: black;">구입하기</div>
                            </label>
                            <div id="payment"></div>
                        </div>
                    </div>
                    <div style="height: 2.5rem; background-color: black; border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem; border-bottom: 0.0625rem solid white;">
                        <div style="height: 0.5rem;"></div>
                        <!-- 상품 가격 -->
                        <span style="font-size: 1.2rem;" id="spr5price" value="4800">4,800원</span>
                    </div>
                </div>

                <!-- 상품1 -->
                <div style="width: 12.5rem; height: 15rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 2.5rem;">
                    <input type="checkbox" id="btnPayment">
                    <div class='product' style="width: 12.5rem; height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.7); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="width: 7.5rem; height: 7.5rem; margin: 0 auto 1rem auto; padding-top: 1.25rem;">
                            <!-- 상품 이미지 -->
                            <img src="./static/img/music.png" style="width: 100%; height: 100%;">
                        </div>
                        <!-- 상품 이름 -->
                        <span style="font-size: 1.2rem; color: black;" id="spr5" value="spr5">노래 이용권 (3회)</span>
                    </div>
                    <!-- 상품 hover 시 -->
                    <div class="hoverProduct" style="height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.5); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="height: 5.5rem;"></div>
                        <div>
                            <label for="btnPayment">
                                <!-- 구입하기 버튼 -->
                                <div id="pr3" style="width: 7.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; margin: auto; display: flex; justify-content: center; align-items: center; color: black;">구입하기</div>
                            </label>
                            <div id="payment"></div>
                        </div>
                    </div>
                    <div style="height: 2.5rem; background-color: black; border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem; border-bottom: 0.0625rem solid white;">
                        <div style="height: 0.5rem;"></div>
                        <!-- 상품 가격 -->
                        <span style="font-size: 1.2rem;" id="spr5price" value="2900">2,900원</span>
                    </div>
                </div>

                <!-- 상품1 -->
                <div style="width: 12.5rem; height: 15rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 2.5rem;">
                    <input type="checkbox" id="btnPayment">
                    <div class='product' style="width: 12.5rem; height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.7); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="width: 7.5rem; height: 7.5rem; margin: 0 auto 1rem auto; padding-top: 1.25rem;">
                            <!-- 상품 이미지 -->
                            <img src="./static/img/music.png" style="width: 100%; height: 100%;">
                        </div>
                        <!-- 상품 이름 -->
                        <span style="font-size: 1.2rem; color: black;" id="spr1" value="spr1">노래 이용권 (1회)</span>
                    </div>
                    <!-- 상품 hover 시 -->
                    <div class="hoverProduct" style="height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.5); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="height: 5.5rem;"></div>
                        <div>
                            <label for="btnPayment">
                                <!-- 구입하기 버튼 -->
                                <div id="pr4" style="width: 7.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; margin: auto; display: flex; justify-content: center; align-items: center; color: black;">구입하기</div>
                            </label>
                            <div id="payment"></div>
                        </div>
                    </div>
                    <div style="height: 2.5rem; background-color: black; border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem; border-bottom: 0.0625rem solid white;">
                        <div style="height: 0.5rem;"></div>
                        <!-- 상품 가격 -->
                        <span style="font-size: 1.2rem;" id="spr1price" value="1000">1,000원</span>
                    </div>
                </div>

            </div>

            <!-- VIRTUAL FACE -->
            <div style="height: 1.75rem; font-family: 'GmarketSansTTFBold'; font-size: 2.0rem; margin-bottom: 2rem;">[&nbsp;&nbsp;V I R T U A L&nbsp;&nbsp;F A C E&nbsp;&nbsp;]</div>
            <div style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr 1fr;">
                
                <!-- 상품1 -->
                <div style="width: 12.5rem; height: 15rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 2.5rem;">
                    <input type="checkbox" id="btnPayment">
                    <div class='product' style="width: 12.5rem; height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.7); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="width: 7.5rem; height: 7.5rem; margin: 0 auto 1rem auto; padding-top: 1.25rem;">
                            <!-- 상품 이미지 -->
                            <img src="./static/img/virtual_face_1.png" style="width: 100%; height: 100%;">
                        </div>
                        <!-- 상품 이름 -->
                        <span style="font-size: 1.2rem; color: black;" id="vf1" value="vf1">츄르를 좋아해</span>
                    </div>
                    <!-- 상품 hover 시 -->
                    <div class="hoverProduct" style="height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.5); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="height: 5.5rem;"></div>
                        <div>
                            <label for="btnPayment">
                                <!-- 구입하기 버튼 -->
                                <div id="pr5" style="width: 7.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; margin: auto; display: flex; justify-content: center; align-items: center; color: black;">구입하기</div>
                            </label>
                            <div id="payment"></div>
                        </div>
                    </div>
                    <div style="height: 2.5rem; background-color: black; border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem; border-bottom: 0.0625rem solid white;">
                        <div style="height: 0.5rem;"></div>
                        <!-- 상품 가격 -->
                        <span style="font-size: 1.2rem;" id="vf1price" value="1000">1,000원</span>
                    </div>
                </div>

                <!-- 상품1 -->
                <div style="width: 12.5rem; height: 15rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 2.5rem;">
                    <input type="checkbox" id="btnPayment">
                    <div class='product' style="width: 12.5rem; height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.7); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="width: 7.5rem; height: 7.5rem; margin: 0 auto 1rem auto; padding-top: 1.25rem;">
                            <!-- 상품 이미지 -->
                            <img src="./static/img/virtual_face_2.png" style="width: 100%; height: 100%;">
                        </div>
                        <!-- 상품 이름 -->
                        <span style="font-size: 1.2rem; color: black;" id="vf2" value="vf2">나만 없어 고양이</span>
                    </div>
                    <!-- 상품 hover 시 -->
                    <div class="hoverProduct" style="height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.5); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="height: 5.5rem;"></div>
                        <div>
                            <label for="btnPayment">
                                <!-- 구입하기 버튼 -->
                                <div id="pr6" style="width: 7.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; margin: auto; display: flex; justify-content: center; align-items: center; color: black;">구입하기</div>
                            </label>
                            <div id="payment"></div>
                        </div>
                    </div>
                    <div style="height: 2.5rem; background-color: black; border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem; border-bottom: 0.0625rem solid white;">
                        <div style="height: 0.5rem;"></div>
                        <!-- 상품 가격 -->
                        <span style="font-size: 1.2rem;" id="vf2price" value="1000">1,000원</span>
                    </div>
                </div>

                <!-- 상품1 -->
                <div style="width: 12.5rem; height: 15rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 2.5rem;">
                    <input type="checkbox" id="btnPayment">
                    <div class='product' style="width: 12.5rem; height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.7); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="width: 7.5rem; height: 7.5rem; margin: 0 auto 1rem auto; padding-top: 1.25rem;">
                            <!-- 상품 이미지 -->
                            <img src="./static/img/virtual_face_3.png" style="width: 100%; height: 100%;">
                        </div>
                        <!-- 상품 이름 -->
                        <span style="font-size: 1.2rem; color: black;" id="vf3" value="vf3">햄스터 아님 고양이</span>
                    </div>
                    <!-- 상품 hover 시 -->
                    <div class="hoverProduct" style="height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.5); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="height: 5.5rem;"></div>
                        <div>
                            <label for="btnPayment">
                                <!-- 구입하기 버튼 -->
                                <div id="pr7" style="width: 7.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; margin: auto; display: flex; justify-content: center; align-items: center; color: black;">구입하기</div>
                            </label>
                            <div id="payment"></div>
                        </div>
                    </div>
                    <div style="height: 2.5rem; background-color: black; border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem; border-bottom: 0.0625rem solid white;">
                        <div style="height: 0.5rem;"></div>
                        <!-- 상품 가격 -->
                        <span style="font-size: 1.2rem;" id="vf3price" value="1000">1,000원</span>
                    </div>
                </div>

                <!-- 상품1 -->
                <div style="width: 12.5rem; height: 15rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 2.5rem;">
                    <input type="checkbox" id="btnPayment">
                    <div class='product' style="width: 12.5rem; height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.7); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="width: 7.5rem; height: 7.5rem; margin: 0 auto 1rem auto; padding-top: 1.25rem;">
                            <!-- 상품 이미지 -->
                            <img src="./static/img/virtual_face_4.png" style="width: 100%; height: 100%;">
                        </div>
                        <!-- 상품 이름 -->
                        <span style="font-size: 1.2rem; color: black;" id="vf4" value="vf4">찾아줄개</span>
                    </div>
                    <!-- 상품 hover 시 -->
                    <div class="hoverProduct" style="height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.5); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="height: 5.5rem;"></div>
                        <div>
                            <label for="btnPayment">
                                <!-- 구입하기 버튼 -->
                                <div id="pr8" style="width: 7.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; margin: auto; display: flex; justify-content: center; align-items: center; color: black;">구입하기</div>
                            </label>
                            <div id="payment"></div>
                        </div>
                    </div>
                    <div style="height: 2.5rem; background-color: black; border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem; border-bottom: 0.0625rem solid white;">
                        <div style="height: 0.5rem;"></div>
                        <!-- 상품 가격 -->
                        <span style="font-size: 1.2rem;" id="vf=4price" value="1000">1,000원</span>
                    </div>
                </div>

                <!-- 상품1 -->
                <div style="width: 12.5rem; height: 15rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 2.5rem;">
                    <input type="checkbox" id="btnPayment">
                    <div class='product' style="width: 12.5rem; height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.7); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="width: 7.5rem; height: 7.5rem; margin: 0 auto 1rem auto; padding-top: 1.25rem;">
                            <!-- 상품 이미지 -->
                            <img src="./static/img/virtual_face_5.png" style="width: 100%; height: 100%;">
                        </div>
                        <!-- 상품 이름 -->
                        <span style="font-size: 1.2rem; color: black;" id="vf5" value="vf5">춤추는곰돌</span>
                    </div>
                    <!-- 상품 hover 시 -->
                    <div class="hoverProduct" style="height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.5); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="height: 5.5rem;"></div>
                        <div>
                            <label for="btnPayment">
                                <!-- 구입하기 버튼 -->
                                <div id="pr9" style="width: 7.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; margin: auto; display: flex; justify-content: center; align-items: center; color: black;">구입하기</div>
                            </label>
                            <div id="payment"></div>
                        </div>
                    </div>
                    <div style="height: 2.5rem; background-color: black; border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem; border-bottom: 0.0625rem solid white;">
                        <div style="height: 0.5rem;"></div>
                        <!-- 상품 가격 -->
                        <span style="font-size: 1.2rem;" id="vf5price" value="1000">1,000원</span>
                    </div>
                </div>

                <!-- 상품1 -->
                <div style="width: 12.5rem; height: 15rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 2.5rem;">
                    <input type="checkbox" id="btnPayment">
                    <div class='product' style="width: 12.5rem; height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.7); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="width: 7.5rem; height: 7.5rem; margin: 0 auto 1rem auto; padding-top: 1.25rem;">
                            <!-- 상품 이미지 -->
                            <img src="./static/img/virtual_face_6.png" style="width: 100%; height: 100%;">
                        </div>
                        <!-- 상품 이름 -->
                        <span style="font-size: 1.2rem; color: black;" id="vf6" value="vf6">토끼가 껑춤껑춤</span>
                    </div>
                    <!-- 상품 hover 시 -->
                    <div class="hoverProduct" style="height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.5); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="height: 5.5rem;"></div>
                        <div>
                            <label for="btnPayment">
                                <!-- 구입하기 버튼 -->
                                <div id="pr10" style="width: 7.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; margin: auto; display: flex; justify-content: center; align-items: center; color: black;">구입하기</div>
                            </label>
                            <div id="payment"></div>
                        </div>
                    </div>
                    <div style="height: 2.5rem; background-color: black; border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem; border-bottom: 0.0625rem solid white;">
                        <div style="height: 0.5rem;"></div>
                        <!-- 상품 가격 -->
                        <span style="font-size: 1.2rem;" id="vf6price" value="1000">1,000원</span>
                    </div>
                </div>

                <!-- 상품1 -->
                <div style="width: 12.5rem; height: 15rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 2.5rem;">
                    <input type="checkbox" id="btnPayment">
                    <div class='product' style="width: 12.5rem; height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.7); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="width: 7.5rem; height: 7.5rem; margin: 0 auto 1rem auto; padding-top: 1.25rem;">
                            <!-- 상품 이미지 -->
                            <img src="./static/img/virtual_face_7.png" style="width: 100%; height: 100%;">
                        </div>
                        <!-- 상품 이름 -->
                        <span style="font-size: 1.2rem; color: black;" id="vf7" value="vf7">내가 그린 기린 그림</span>
                    </div>
                    <!-- 상품 hover 시 -->
                    <div class="hoverProduct" style="height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.5); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="height: 5.5rem;"></div>
                        <div>
                            <label for="btnPayment">
                                <!-- 구입하기 버튼 -->
                                <div id="pr11" style="width: 7.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; margin: auto; display: flex; justify-content: center; align-items: center; color: black;">구입하기</div>
                            </label>
                            <div id="payment"></div>
                        </div>
                    </div>
                    <div style="height: 2.5rem; background-color: black; border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem; border-bottom: 0.0625rem solid white;">
                        <div style="height: 0.5rem;"></div>
                        <!-- 상품 가격 -->
                        <span style="font-size: 1.2rem;" id="vf7price" value="1000">1,000원</span>
                    </div>
                </div>

                <!-- 상품1 -->
                <div style="width: 12.5rem; height: 15rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 2.5rem;">
                    <input type="checkbox" id="btnPayment">
                    <div class='product' style="width: 12.5rem; height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.7); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="width: 7.5rem; height: 7.5rem; margin: 0 auto 1rem auto; padding-top: 1.25rem;">
                            <!-- 상품 이미지 -->
                            <img src="./static/img/virtual_face_8.png" style="width: 100%; height: 100%;">
                        </div>
                        <!-- 상품 이름 -->
                        <span style="font-size: 1.2rem; color: black;" id="vf8" value="vf8">마우스패드 아니고 팬더</span>
                    </div>
                    <!-- 상품 hover 시 -->
                    <div class="hoverProduct" style="height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.5); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="height: 5.5rem;"></div>
                        <div>
                            <label for="btnPayment">
                                <!-- 구입하기 버튼 -->
                                <div id="pr12" style="width: 7.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; margin: auto; display: flex; justify-content: center; align-items: center; color: black;">구입하기</div>
                            </label>
                            <div id="payment"></div>
                        </div>
                    </div>
                    <div style="height: 2.5rem; background-color: black; border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem; border-bottom: 0.0625rem solid white;">
                        <div style="height: 0.5rem;"></div>
                        <!-- 상품 가격 -->
                        <span style="font-size: 1.2rem;" id="vf8price" value="1000">1,000원</span>
                    </div>
                </div>

                <!-- 상품1 -->
                <div style="width: 12.5rem; height: 15rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 2.5rem;">
                    <input type="checkbox" id="btnPayment">
                    <div class='product' style="width: 12.5rem; height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.7); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="width: 7.5rem; height: 7.5rem; margin: 0 auto 1rem auto; padding-top: 1.25rem;">
                            <!-- 상품 이미지 -->
                            <img src="./static/img/virtual_face_9.png" style="width: 100%; height: 100%;">
                        </div>
                        <!-- 상품 이름 -->
                        <span style="font-size: 1.2rem; color: black;" id="vf9" value="vf9">어디서 많이 봤는데</span>
                    </div>
                    <!-- 상품 hover 시 -->
                    <div class="hoverProduct" style="height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.5); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="height: 5.5rem;"></div>
                        <div>
                            <label for="btnPayment">
                                <!-- 구입하기 버튼 -->
                                <div id="pr13" style="width: 7.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; margin: auto; display: flex; justify-content: center; align-items: center; color: black;">구입하기</div>
                            </label>
                            <div id="payment"></div>
                        </div>
                    </div>
                    <div style="height: 2.5rem; background-color: black; border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem; border-bottom: 0.0625rem solid white;">
                        <div style="height: 0.5rem;"></div>
                        <!-- 상품 가격 -->
                        <span style="font-size: 1.2rem;" id="vf9price" value="1000">1,000원</span>
                    </div>
                </div>

                <!-- 상품1 -->
                <div style="width: 12.5rem; height: 15rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 2.5rem;">
                    <input type="checkbox" id="btnPayment">
                    <div class='product' style="width: 12.5rem; height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.7); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="width: 7.5rem; height: 7.5rem; margin: 0 auto 1rem auto; padding-top: 1.25rem;">
                            <!-- 상품 이미지 -->
                            <img src="./static/img/virtual_face_10.png" style="width: 100%; height: 100%;">
                        </div>
                        <!-- 상품 이름 -->
                        <span style="font-size: 1.2rem; color: black;" id="vf10" value="vf10">너는 나의 포로</span>
                    </div>
                    <!-- 상품 hover 시 -->
                    <div class="hoverProduct" style="height: 12.5rem; border-bottom: 0.0625rem solid white; background-color: rgba(255,255,255,0.5); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">
                        <div style="height: 5.5rem;"></div>
                        <div>
                            <label for="btnPayment">
                                <!-- 구입하기 버튼 -->
                                <div id="pr14" style="width: 7.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; margin: auto; display: flex; justify-content: center; align-items: center; color: black;">구입하기</div>
                            </label>
                            <div id="payment"></div>
                        </div>
                    </div>
                    <div style="height: 2.5rem; background-color: black; border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem; border-bottom: 0.0625rem solid white;">
                        <div style="height: 0.5rem;"></div>
                        <!-- 상품 가격 -->
                        <span style="font-size: 1.2rem;" id="vf10price" value="1000">1,000원</span>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- 상품 값 저장 -->
        <input type="hidden" id="prv1" value="Premium">
        <input type="hidden" id="prv1price" value="7000">
        <input type="hidden" id="prv2" value="노래이용권(5회)">
        <input type="hidden" id="prv2price" value="4800">
        <input type="hidden" id="prv3" value="노래이용권(3회)">
        <input type="hidden" id="prv3price" value="2900">
        <input type="hidden" id="prv4" value="노래이용권(1회)">
        <input type="hidden" id="prv4price" value="1000">
        <input type="hidden" id="prv5" value="vf1">
        <input type="hidden" id="prv5price" value="1000">
        <input type="hidden" id="prv6" value="vf2">
        <input type="hidden" id="prv6price" value="1000">
        <input type="hidden" id="prv7" value="vf3">
        <input type="hidden" id="prv7price" value="1000">
        <input type="hidden" id="prv8" value="vf4">
        <input type="hidden" id="prv8price" value="1000">
        <input type="hidden" id="prv9" value="vf5">
        <input type="hidden" id="prv9price" value="1000">
        <input type="hidden" id="prv10" value="vf6">
        <input type="hidden" id="prv10price" value="1000">
        <input type="hidden" id="prv11" value="vf7">
        <input type="hidden" id="prv11price" value="1000">
        <input type="hidden" id="prv12" value="vf8">
        <input type="hidden" id="prv12price" value="1000">
        <input type="hidden" id="prv13" value="vf9">
        <input type="hidden" id="prv13price" value="1000">
        <input type="hidden" id="prv14" value="vf10">
        <input type="hidden" id="prv14price" value="1000">
        
        <!-- 상품 값 보내기 -->
        <script type="text/javascript">
        
        $("#pr1").click(function(){
        	var prs = document.getElementById("prv1").value;
        	var price = document.getElementById("prv1price").value;
    		$.ajax({
    			url:"paymentKR.jsp",
    			type:"get",
    			data:{"prs":prs,
    				"price":price},
    			success: function(data){
    				console.log(prs+"a");
    			},
    			error:function(){
    				console.log('실패');
    			}
    		});
    		
    	});
        
        $("#pr2").click(function(){
        	var prs = document.getElementById("prv2").value;
        	var price = document.getElementById("prv2price").value;
    		$.ajax({
    			url:"paymentKR.jsp",
    			type:"get",
    			data:{"prs":prs},
    			success: function(data){
    				console.log(prs+"a");
    			},
    			error:function(){
    				console.log('실패');
    			}
    		});
    	});
        $("#pr3").click(function(){
        	var prs = document.getElementById("prv3").value;
        	var price = document.getElementById("prv3price").value;
    		$.ajax({
    			url:"paymentKR.jsp",
    			type:"get",
    			data:{"prs":prs},
    			success: function(data){
    				console.log(prs+"a");
    			},
    			error:function(){
    				console.log('실패');
    			}
    		});
    	});
        $("#pr4").click(function(){
        	var prs = document.getElementById("prv4").value;
        	var price = document.getElementById("prv4price").value;
    		$.ajax({
    			url:"paymentKR.jsp",
    			type:"get",
    			data:{"prs":prs},
    			success: function(data){
    				console.log(prs+"a");
    			},
    			error:function(){
    				console.log('실패');
    			}
    		});
    	});
        $("#pr5").click(function(){
        	var prs = document.getElementById("prv5").value;
        	var price = document.getElementById("prv5price").value;
    		$.ajax({
    			url:"paymentKR.jsp",
    			type:"get",
    			data:{"prs":prs},
    			success: function(data){
    				console.log(prs+"a");
    			},
    			error:function(){
    				console.log('실패');
    			}
    		});
    	});
        $("#pr6").click(function(){
        	var prs = document.getElementById("prv6").value;
        	var price = document.getElementById("prv6price").value;
    		$.ajax({
    			url:"paymentKR.jsp",
    			type:"get",
    			data:{"prs":prs},
    			success: function(data){
    				console.log(prs+"a");
    			},
    			error:function(){
    				console.log('실패');
    			}
    		});
    	});
        $("#pr7").click(function(){
        	var prs = document.getElementById("prv7").value;
        	var price = document.getElementById("prv7price").value;
    		$.ajax({
    			url:"paymentKR.jsp",
    			type:"get",
    			data:{"prs":prs},
    			success: function(data){
    				console.log(prs+"a");
    			},
    			error:function(){
    				console.log('실패');
    			}
    		});
    	});
        $("#pr8").click(function(){
        	var prs = document.getElementById("prv8").value;
        	var price = document.getElementById("prv8price").value;
    		$.ajax({
    			url:"paymentKR.jsp",
    			type:"get",
    			data:{"prs":prs},
    			success: function(data){
    				console.log(prs+"a");
    			},
    			error:function(){
    				console.log('실패');
    			}
    		});
    	});
        $("#pr9").click(function(){
        	var prs = document.getElementById("prv9").value;
        	var price = document.getElementById("prv9price").value;
    		$.ajax({
    			url:"paymentKR.jsp",
    			type:"get",
    			data:{"prs":prs},
    			success: function(data){
    				console.log(prs+"a");
    			},
    			error:function(){
    				console.log('실패');
    			}
    		});
    	});
        $("#pr10").click(function(){
        	var prs = document.getElementById("prv10").value;
        	var price = document.getElementById("prv10price").value;
    		$.ajax({
    			url:"paymentKR.jsp",
    			type:"get",
    			data:{"prs":prs},
    			success: function(data){
    				console.log(prs+"a");
    			},
    			error:function(){
    				console.log('실패');
    			}
    		});
    	});
        $("#pr11").click(function(){
        	var prs = document.getElementById("prv11").value;
        	var price = document.getElementById("prv11price").value;
    		$.ajax({
    			url:"paymentKR.jsp",
    			type:"get",
    			data:{"prs":prs},
    			success: function(data){
    				console.log(prs+"a");
    			},
    			error:function(){
    				console.log('실패');
    			}
    		});
    	});
        $("#pr12").click(function(){
        	var prs = document.getElementById("prv12").value;
        	var price = document.getElementById("prv12price").value;
    		$.ajax({
    			url:"paymentKR.jsp",
    			type:"get",
    			data:{"prs":prs},
    			success: function(data){
    				console.log(prs+"a");
    			},
    			error:function(){
    				console.log('실패');
    			}
    		});
    	});
        $("#pr13").click(function(){
        	var prs = document.getElementById("prv13").value;
        	var price = document.getElementById("prv13price").value;
    		$.ajax({
    			url:"paymentKR.jsp",
    			type:"get",
    			data:{"prs":prs},
    			success: function(data){
    				console.log(prs+"a");
    			},
    			error:function(){
    				console.log('실패');
    			}
    		});
    	});
        $("#pr14").click(function(){
        	var prs = document.getElementById("prv14").value;
        	var price = document.getElementById("prv14price").value;
    		$.ajax({
    			url:"paymentKR.jsp",
    			type:"get",
    			data:{"prs":prs},
    			success: function(data){
    				console.log(prs+"a");
    			},
    			error:function(){
    				console.log('실패');
    			}
    		});
    	});
        
        </script>
</body>
</html>