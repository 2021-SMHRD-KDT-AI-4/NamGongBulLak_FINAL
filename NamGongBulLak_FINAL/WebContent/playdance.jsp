<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 임포트 -->
    <link rel="stylesheet" href="./static/css/style.css" />
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <title>PlayDance</title>
</head>
<style>

.section {
	margin: 15px;
}
</style>
<body>
<%
//jjjjjjjjjjjjjjjjjjjjjjjjjjj
request.setCharacterEncoding("EUC-KR");
String[] song_data = request.getParameter("songdata").split("/");
String title = null;
String singer = null;
String albumImg = null;
if(song_data!=null){
	singer = song_data[0];
	title = song_data[1];
	albumImg = song_data[2];
	System.out.println(title);
}
//jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj
%>

<%
	
		MemberDTO memInfo = (MemberDTO)session.getAttribute("info");
		String[] data = null;
		try{
			data = request.getParameter("data").split("/");
		}catch(NullPointerException e){
			System.out.println("data가 없습니다");
		}
		
	%>


<!-- jjjjjjjjjjjjjjjj -->
<input type="hidden" id="songdata" value="<%=singer%>/<%=title%>/<%=albumImg%>">
<!-- jjjjjjjjjjjjjjjj -->
    <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
        <!-- 상단 네비게이션 -->
        <div id="navi"></div>
        <!-- 메인 내용 -->
        <div style="height: 1.25rem;"></div>
        <div style="height: 35.625rem; display: flex; flex-direction: row; font-family: 'Bangtan';">
            <!-- 댄스 영상 -->
            <div style="height: 100%; width: 100%;">
                <!-- 댄스 영상 노래 이름 -->
                <!-- jjjjjjjjjjjjjjjj -->
                <div style="height: 3rem"><%=singer %> - <%=title %></div>
               
               
                <!-- 댄스 화면 -->
                <!-- jjjjjjjjjjjjjjjj -->
                <div style="background-color: black; height: 32.625rem; margin: 0 1rem;">
                   <!--  <video id="vod" src="./static/video/butter1.mp4" autoplay muted style="width: 928px; height: 522px"></video> -->
                	
                	 <video id="vod" src="./static/video/<%=title %>.mp4" width="928px" height="522px"></video>
                	 
                </div>
            </div>
            <!-- 사용자 화면 -->
            <div style="height: 100%; width: 100%;">
                <!-- 사용자 이름 -->
                <div style="height: 3rem"><%= memInfo.getId() %>님의 화면</div>
                <!-- 캠 화면 -->
                <div style="background-color: black; height: 32.625rem; margin: 0 1rem;">
                    <!-- <video id="cam"  autoplay muted style="width: 928px; height: 522px"></video> -->
                  	<video id="cam"  width="928px" height="522px"autoplay muted></video>
                   <!-- <video id="cam" src="./static/video/test111.mp4" width=928 height=524 autoplay  muted height="100%" width="100%" muted="muted"></video>-->
                </div>
            </div>
        </div>
        <div style="height: 1.25rem;"></div>
        
        <div style="height: 10.75rem; display: flex; flex-direction: row; margin: 0 3.5rem; align-items: center;">
           	<div style="width: 43.75rem;"></div>
           	<div style="width: 26.25rem; margin-right: 2.75rem">
           		<div style="height: 6.25rem"></div>
           		<div style="height: 4.5rem; display: flex; font-family: 'GmarketSansTTFBold'; font-size: 2.8rem;">
           			<div style="width: 13.75rem; height: 4.5rem;">
           				SCORE :
           				</div>
           			<div style="width: 12.5rem; height: 4.5rem;">
           				<p id="p" style="margin-block-start: 0; margin-block-end: 0;"></p>
           			</div>
           		</div>
           	</div>
	        <div style="width: 18.25rem; height: 10.75rem;">
	        	<div style="width: 18.25rem; height: 3.25rem;"></div>
	        	<div style="width: 18.25rem; height: 3rem;">
	        		<img id="barImg" src="./static/img/playdance/miss_bar.png" style="width: 100%; height: 100%;">
	        	</div>
	        </div>
	        <div style="width: 10rem; height: 10rem;">
	        	<img id="smileImg" src="./static/img/playdance/miss.png" style="width: 100%; height: 100%;">
	        </div>
        </div> 
    <!-- </div>
    
    	<div class="section">
		<video id="video-output"></video>
		<br/>
	
	</div> -->
	
	<!-- <div class="section">
	
		<video id="recorded-video" controls></video>
		<br />
	</div> -->
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-3.5.1.min.js"></script>
	
    <!-- 실시간 점수 띄워 주는 기능 , 플라스크 서버 열어야지 활성화 됨-->
      <script type="text/javascript">   
        
    	$(document).ready(function() {
			$("#navi").load("./navigationKR.jsp");
		});
        
	</script>
    <script type="text/javascript">
    let pd = document.getElementById("p") //정확도 실시간으로 보여주는 곳
	let barImg = document.getElementById("barImg");
	let smileImg = document.getElementById("smileImg");
	
    var cnt = 0; //정확도 평균에 필요한 변수
    var cnt2 = 0; //영상 끝나면 페이지 넘기게 하는 변수
    
    
    //miss, good, great, perfect 변수
    var m = 0;
    var gd = 0;
    var gr = 0;
    var per =0;
    
    /* 카메라 허용하기 & 스트리밍 시작 */
    let vod = document.getElementById("vod");
    let cam = document.getElementById("cam");
    
    vod.play();
    cam.play();
    
  	//cam 좌표간 거리를 담을 변수
    var c1 = 1;
    var c2 = 1;
    var c3 = 1;
    var c4 = 1;

  	//vod 좌표간 거리를 담을 변수
    var v1 = 1;
    var v2 = 1;
    var v3 = 1;
    var v4 = 1;

  	//좌표간 거리를 배열로 담을 변수
    var v_distans = [];
    var c_distans = [];
    
  	//정확도 결과를 담을 변수
    var result = 0;
    var sum = 0;
    var avg = 0;
    var res_avg = 0;
    
    //캠이 있으면 주석 빼고 실행
     function a(stream) {
    	 cam.srcObject = stream;
    	 cam.play();
    } 
      
   navigator.mediaDevices.getUserMedia({ video: true, audio: false })
    .then(function(stream) {
    	cam.srcObject = stream;
    	cam.play();
    })
    .catch(function(err) {
        console.log("An error occurred! " + err);
    });
    
    //실시간으로 정확도 판별해주는 함수
    function onOpenCvReady1(){
    	
    	sum = 0;
    	avg = 0;
    	result = 0;
    	
    	let height1 = vod.height;
    	let height2 = cam.height;
    	let width1 = vod.width;
    	let width2 = cam.width;
    	let src1 = new cv.Mat(height1, width1, cv.CV_8UC4); // 8 byte 4 channel
    	let src2 = new cv.Mat(height2, width2, cv.CV_8UC4); // 8 byte 4 channel
    	let dst1 = new cv.Mat(height1, width1, cv.CV_8UC1); // 8 byte 1 channel
    	let dst2 = new cv.Mat(height2, width2, cv.CV_8UC1); // 8 byte 1 channel
    	let cap1 = new cv.VideoCapture(vod);
    	let cap2 = new cv.VideoCapture(cam);
    	const FPS = 6; // 초당 프레임수 조절 -> 흑백 변환 프레임 레이트, 7프레임 이상 하면 플라스크 서버 터짐
    	function processVideo() {
    		
    	    let begin = Date.now();
    	    cap1.read(src1);
    	    cap2.read(src2);
    	    //console.log(src1.data);
    	    sendData1(src1.data); // 서버로 데이터 전송
    	    sendData2(src2.data); // 서버로 데이터 전송
    	    cv.cvtColor(src1, dst1, cv.COLOR_RGBA2GRAY);
    	    cv.cvtColor(src2, dst2, cv.COLOR_RGBA2GRAY);
    	    //cv.imshow("canvasOutput1", dst1);
    	    //cv.imshow("canvasOutput2", dst2);
    	    // schedule next one.
    	    let delay = 1000/FPS - (Date.now() - begin);
    	    setTimeout(processVideo, delay);
    	    result = acc_cal(v_distans,c_distans);
    	    if(!isNaN(result)&&result>0.1){
    	    	cnt++;
    	    	
    	    	sum+=result;
    	    	avg = sum/cnt;
    	    	pd.innerHTML = avg*100;

    	    	cnt2 = 0;
    	 	    //console.log(result);
    	 	    //console.log(cnt);
    	 	    
    	 	    if(result<0.25){
    	 	    	m++;
					barImg.setAttribute("src", "./static/img/playdance/miss_bar.png");
					smileImg.setAttribute("src", "./static/img/playdance/miss.png");
    	 	    }else if(result<0.5){
    	 	    	gd++;
					barImg.setAttribute("src", "./static/img/playdance/good_bar.png");
					smileImg.setAttribute("src", "./static/img/playdance/good.png");
    	 	    }else if(result<0.75){
    	 	    	gr++;
					barImg.setAttribute("src", "./static/img/playdance/great_bar.png");
					smileImg.setAttribute("src", "./static/img/playdance/great.png");
    	 	    }else if(result<=1){
    	 	    	per++
					barImg.setAttribute("src", "./static/img/playdance/perfect_bar.png");
					smileImg.setAttribute("src", "./static/img/playdance/perfect.png");
    	 	    }
    	 	    
    	    }
    	   
    	    //영상끝나는것을 측정하기 위한 cnt2 
    	    if(isNaN(result)){
    	    	cnt2++;
    	    	//측정을 하지못하면 페이지 넘어가기때문에
    	    	//경고문 적어주기
    	    }
    	    
    	    //영상끝나고 데이터와 페이지 이동
    	    if(isNaN(result)&&cnt2==80){//14->10초 7->5초
    	    	var score = (avg*100).toFixed(1);
    	    	
    	    // 탭으로 열기
    	    //jjjjjjjjjjjjjjjjjjjjj
    	    	var songdata = document.getElementById("songdata").value;
	    	    	//const url = "http://localhost:8081/Third_PJs/RankingService?score="+score+"&songdata="+songdata+"&mgdgrper="+m+"/"+gd+"/"+gr+"/"+per;
	    			//const encoded = encodeURI(url);
	    	    	//window.open(encoded);
    	    	console.log("1");
    	    	const url1 = "http://localhost:8083/NamGongBulLak_FINAL/resultScreen.jsp?score="+score+"&mgdgrper="+m+"/"+gd+"/"+gr+"/"+per+"&songdata="+songdata+"&num=1";
                const encoded1 = encodeURI(url1);
    	    	
    	    	const url = "http://localhost:8083/NamGongBulLak_FINAL/resultScreen.jsp?score="+score+"&mgdgrper="+m+"/"+gd+"/"+gr+"/"+per+"&songdata="+songdata;
				const encoded = encodeURI(url);
    	    		//window.open("http://localhost:8081/Third_PJs/RankingService?score="+score+"&mgdgrper="+m+"/"+gd+"/"+gr+"/"+per+"&songdata="+songdata);
    	    	
    	    		
    	      window.open(encoded1);
    	      //setTimeout(function(){window.open('http://localhost:8082/Third_PJ/mainKR.jsp', '_self').close()},5000);
    	    		
    	    		
    	    	/* window.open(encoded);
    	    	
    	    	setTimeout(function(){
                    window.close(encoded1);
                     }, 5000);
    	    	  */
    	    	 
			//jjjjjjjjjjjjjjjjj
	
    	    	 //새창으로 열기
    	    	/* window.open("http://localhost:8082/Third_PJ/RankingService?score="+score+"&mgdgrper="+m+"/"+gd+"/"+gr+"/"+per,"new","width="+screen.width+",height="+screen.height+",fullscreen=yes");  */
    	    	
    	    /* 	  setTimeout(function(){
    	    		top.window.close();
    	    	}, 5000);   */
    	    	
    	    /* 	setTimeout(function close(){
    	    		   window.open('', '_self', '');
    	    		   window.close();
    	    		   return false;
    	    	}, 5000); */ 
    	    	
    	    	/* setTimeout(function(){top.window.opener = top;top.window.open('','_parent','');top.window.close();}, 5000); */
    	    }

    	}	
    	// schedule first one.
    	setTimeout(processVideo, 0);
    }
    
  	//거리간 비율 구하는 함수
    function ab(a,b){
    	if(a>=b){
    		return b/a;
    	}else if(a<b){
    		return (2*a-b)/a;
    	}
    }
  	
    //정확도 계산하는 함수
    function acc_cal(v_distans,c_distans){
    	  v1 = v_distans[0];
          v2 = v_distans[1];
          v3 = v_distans[2];
          v4 = v_distans[3];
          c1 = c_distans[0];
          c2 = c_distans[1];
          c3 = c_distans[2];
          c4 = c_distans[3];
          console.log(v1);
          acc1 = ab(v1,c1);
          acc2 = ab(v2,c2);
          acc3 = ab(v3,c3);
          acc4 = ab(v4,c4);
          
          acc_result = (acc1+acc2+acc3+acc4)/4
          
          return acc_result
    }
    
    let requestURL1 = "http://127.0.1.2:5000/test2"; //vod 플라스크 서버 주소
    let requestURL2 = "http://127.0.1.3:5000/test2"; //cam 플라스크 서버 주소
    function sendData1(data){
    	const xhr1 = new XMLHttpRequest();
        xhr1.open('POST', requestURL1);
        xhr1.onload = () => {
           v_distans= (xhr1.response).split("/")
        };
        xhr1.send(data);
        console.log(v_distans+"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        return v_distans;
    }
    function sendData2(data){
    	const xhr2 = new XMLHttpRequest();
        xhr2.open('POST', requestURL2);
        xhr2.onload = () => {
           c_distans= (xhr2.response).split("/")
        };
        xhr2.send(data);
        return c_distans;
    }
    
    </script>
    
<!-- OpenCV로 실행되는 자바 스크립트 -->
<script async src="https://docs.opencv.org/3.4.0/opencv.js" onload="onOpenCvReady1()" type="text/javascript"></script>
<script type="text/javascript">


<!-- 사용자 webcam 녹화부분 -->
$(document).ready(function() {
	
	const videoOutput = document.getElementById('cam');
	
	const recordedVideo = document.getElementById('recorded-video');

	let mediaStream = null;
	let mediaRecorder = null;
	let recordedMediaURL = null;

	// 유저의 카메라로 부터 입력을 사용할 수 있도록 요청
	navigator.mediaDevices.getUserMedia({
		video : true
	}).then(function(newMediaStream) {
		mediaStream = newMediaStream;
		
		
		// 카메라의 입력을 실시간으로 비디오 태그에서 확인
		videoOutput.srcObject = mediaStream;
		videoOutput.onloadedmetadata = function(e) {
			videoOutput.play();
		};
			
		let recordedChunks = [];
		// 1.MediaStream을 매개변수로 MediaRecorder 생성자를 호출
		mediaRecorder = new MediaRecorder(mediaStream, {
			mimeType : 'video/webm;',
		});

		// 2. 전달받는 데이터를 처리하는 이벤트 핸들러 등록
		mediaRecorder.ondataavailable = function(event) {
			if (event.data && event.data.size > 0) {
				console.log('ondataavailable');
				recordedChunks.push(event.data);
			}
		};

	   // 3. 녹화 중지 이벤트 핸들러 등록
		mediaRecorder.onstop = function() {
			// createObjectURL로 생성한 url을 사용하지 않으면 revokeObjectURL 함수로 지워줘야합니다.
			// 그렇지 않으면 메모리 누수 문제가 발생합니다.
			if (recordedMediaURL) {
				URL.revokeObjectURL(recordedMediaURL);
			}
			const blob = new Blob(recordedChunks, {
				type : 'video/webm;'
			});
			
			recordedMediaURL = URL.createObjectURL(blob);
			localStorage.setItem('url',recordedMediaURL);
			
		};

		mediaRecorder.start();
	});
	
	// 페이지가 다음 페이지로 넘어가면 녹화를 중지한다.
	 window.onblur = blurMe;
		
		function blurMe(){
			if (mediaRecorder) {
				// 5. 녹화 중지
				mediaRecorder.stop();
			
			}
			
			// 녹화 중지가 일어난 후 2초 뒤 다운로드 진행
			setTimeout(function(){
	        	// 2초 후 작동해야할 코드
			          if (recordedMediaURL) {
			            const link = document.createElement('a');
			            console.log("link : ", link)
			            document.body.appendChild(link);
			            link.href = recordedMediaURL;
			            link.download = 'record_UserCam_test.webm'; //저장될 녹화영상 파일명
			            link.click();
			            //document.body.removeChild(link);
			          }
	        	}, 2000);
		}
});

</script>
</body>
</html>