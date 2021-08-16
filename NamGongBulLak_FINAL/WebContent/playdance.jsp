<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ����Ʈ -->
    <link rel="stylesheet" href="./static/css/style.css" />
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
			System.out.println("data�� �����ϴ�");
		}
		
	%>


<!-- jjjjjjjjjjjjjjjj -->
<input type="hidden" id="songdata" value="<%=singer%>/<%=title%>/<%=albumImg%>">
<!-- jjjjjjjjjjjjjjjj -->

    <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
        <!-- ��� �׺���̼� -->
        <div id="navi"></div>
        <!-- ���� ���� -->
        <div style="height: 1.25rem;"></div>
        <div style="height: 35.625rem; display: flex; flex-direction: row; font-family: 'Bangtan';">
            <!-- �� ���� -->
            <div style="height: 100%; width: 100%;">
                <!-- �� ���� �뷡 �̸� -->
                <!-- jjjjjjjjjjjjjjjj -->
                <div style="height: 3rem"><%=singer %> - <%=title %></div>
               
               
                <!-- �� ȭ�� -->
                <!-- jjjjjjjjjjjjjjjj -->
                <div style="background-color: black; height: 32.625rem; margin: 0 1rem;">
                   <!--  <video id="vod" src="./static/video/butter1.mp4" autoplay muted style="width: 928px; height: 522px"></video> -->
                	
                	 <video id="vod" src="./static/video/<%=title %>.mp4" width="928px" height="522px" muted = "muted"></video>
                	
                </div>
            </div>
            <!-- ����� ȭ�� -->
            <div style="height: 100%; width: 100%;">
                <!-- ����� �̸� -->
                <div style="height: 3rem"><%= memInfo.getId() %>���� ȭ��</div>
                <!-- ķ ȭ�� -->
                <div style="background-color: black; height: 32.625rem; margin: 0 1rem;">
                    <!-- <video id="cam"  autoplay muted style="width: 928px; height: 522px"></video> -->
                  	<video id="cam"  width="928px" height="522px"autoplay muted></video>
                   <!-- <video id="cam" src="./static/video/test111.mp4" width=928 height=524 autoplay  muted height="100%" width="100%" muted="muted"></video>-->
                </div>
            </div>
        </div>
        <div style="height: 3rem;"></div>
        <div style="background-color: red; height: 10.875rem; display: flex; flex-direction: row; margin: 0 3.5rem; align-items: center;">
            <div style="width: 50%;">
                ��ư
                <input type="button" value="ȭ�� ��ȯ">
                <input type="button" value="�ٽ��ϱ�">
                <input type="button" value="������">
            </div>
            Perfect, Great, Good, Miss
            <div style="width: 50%;">Smile~:)</div>
        </div> 
         <div style="background-color: blue; height: 3rem; margin: 0 3.5rem; display: flex; flex-direction: row; align-items: center;"> -->
            <!-- �������� -->
           <div style="width: 85%; background-color: yellow;">��������</div>
            <!-- ���� �ؽ�Ʈ?�̹���? ǥ�� -->
            <div style="width: 15%;">Score : 29.37</div>
            <div style="width: 15%;">SCORE : <p id="p"></p></div>
        <!-- </div> -->
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
	
    <!-- �ǽð� ���� ��� �ִ� ��� , �ö�ũ ���� ������� Ȱ��ȭ ��-->
      <script type="text/javascript">   
        
    	$(document).ready(function() {
			$("#navi").load("./navigationKR.jsp");
		});
        
	</script>
    <script type="text/javascript">
    
    let pd = document.getElementById("p") //��Ȯ�� �ǽð����� �����ִ� ��
    var cnt = 0; //��Ȯ�� ��տ� �ʿ��� ����
    var cnt2 = 0; //���� ������ ������ �ѱ�� �ϴ� ����
    
    
    //miss, good, great, perfect ����
    var m = 0;
    var gd = 0;
    var gr = 0;
    var per =0;
    
    /* ī�޶� ����ϱ� & ��Ʈ���� ���� */
    let vod = document.getElementById("vod");
    let cam = document.getElementById("cam");
    
    vod.play();
    cam.play();
    
  	//cam ��ǥ�� �Ÿ��� ���� ����
    var c1 = 1;
    var c2 = 1;
    var c3 = 1;
    var c4 = 1;

  	//vod ��ǥ�� �Ÿ��� ���� ����
    var v1 = 1;
    var v2 = 1;
    var v3 = 1;
    var v4 = 1;

  	//��ǥ�� �Ÿ��� �迭�� ���� ����
    var v_distans = [];
    var c_distans = [];
    
  	//��Ȯ�� ����� ���� ����
    var result = 0;
    var sum = 0;
    var avg = 0;
    var res_avg = 0;
    
    //ķ�� ������ �ּ� ���� ����
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
    
    //�ǽð����� ��Ȯ�� �Ǻ����ִ� �Լ�
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
    	const FPS = 6; // �ʴ� �����Ӽ� ���� -> ��� ��ȯ ������ ����Ʈ, 7������ �̻� �ϸ� �ö�ũ ���� ����
    	function processVideo() {
    		
    	    let begin = Date.now();
    	    cap1.read(src1);
    	    cap2.read(src2);
    	    //console.log(src1.data);
    	    sendData1(src1.data); // ������ ������ ����
    	    sendData2(src2.data); // ������ ������ ����
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
    	 	    }else if(result<0.5){
    	 	    	gd++;
    	 	    }else if(result<0.75){
    	 	    	gr++;
    	 	    }else if(result<=1){
    	 	    	per++
    	 	    }
    	 	    
    	    }
    	   
    	    //���󳡳��°��� �����ϱ� ���� cnt2 
    	    if(isNaN(result)){
    	    	cnt2++;
    	    	//������ �������ϸ� ������ �Ѿ�⶧����
    	    	//��� �����ֱ�
    	    }
    	    
    	    //���󳡳��� �����Ϳ� ������ �̵�
    	    if(isNaN(result)&&cnt2==80){//14->10�� 7->5��
    	    	var score = (avg*100).toFixed(1);
    	    	
    	    // ������ ����
    	    //jjjjjjjjjjjjjjjjjjjjj
    	    	var songdata = document.getElementById("songdata").value;
	    	    	//const url = "http://localhost:8081/Third_PJs/RankingService?score="+score+"&songdata="+songdata+"&mgdgrper="+m+"/"+gd+"/"+gr+"/"+per;
	    			//const encoded = encodeURI(url);
	    	    	//window.open(encoded);
    	    	console.log("1");
    	    	const url1 = "http://localhost:8082/Third_PJ/resultScreen.jsp?score="+score+"&mgdgrper="+m+"/"+gd+"/"+gr+"/"+per+"&songdata="+songdata+"&num=1";
                const encoded1 = encodeURI(url1);
    	    	
    	    	const url = "http://localhost:8082/Third_PJ/resultScreen.jsp?score="+score+"&mgdgrper="+m+"/"+gd+"/"+gr+"/"+per+"&songdata="+songdata;
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
	
    	    	 //��â���� ����
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
    
  	//�Ÿ��� ���� ���ϴ� �Լ�
    function ab(a,b){
    	if(a>=b){
    		return b/a;
    	}else if(a<b){
    		return (2*a-b)/a;
    	}
    }
  	
    //��Ȯ�� ����ϴ� �Լ�
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
    
    let requestURL1 = "http://127.0.1.2:5000/test2"; //vod �ö�ũ ���� �ּ�
    let requestURL2 = "http://127.0.1.3:5000/test2"; //cam �ö�ũ ���� �ּ�
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
    
<!-- OpenCV�� ����Ǵ� �ڹ� ��ũ��Ʈ -->
<script async src="https://docs.opencv.org/3.4.0/opencv.js" onload="onOpenCvReady1()" type="text/javascript"></script>
<script type="text/javascript">


<!-- ����� webcam ��ȭ�κ� -->
$(document).ready(function() {
	
	const videoOutput = document.getElementById('cam');
	
	const recordedVideo = document.getElementById('recorded-video');

	let mediaStream = null;
	let mediaRecorder = null;
	let recordedMediaURL = null;

	// ������ ī�޶�� ���� �Է��� ����� �� �ֵ��� ��û
	navigator.mediaDevices.getUserMedia({
		video : true
	}).then(function(newMediaStream) {
		mediaStream = newMediaStream;
		
		
		// ī�޶��� �Է��� �ǽð����� ���� �±׿��� Ȯ��
		videoOutput.srcObject = mediaStream;
		videoOutput.onloadedmetadata = function(e) {
			videoOutput.play();
		};
			
		let recordedChunks = [];
		// 1.MediaStream�� �Ű������� MediaRecorder �����ڸ� ȣ��
		mediaRecorder = new MediaRecorder(mediaStream, {
			mimeType : 'video/webm;',
		});

		// 2. ���޹޴� �����͸� ó���ϴ� �̺�Ʈ �ڵ鷯 ���
		mediaRecorder.ondataavailable = function(event) {
			if (event.data && event.data.size > 0) {
				console.log('ondataavailable');
				recordedChunks.push(event.data);
			}
		};

	   // 3. ��ȭ ���� �̺�Ʈ �ڵ鷯 ���
		mediaRecorder.onstop = function() {
			// createObjectURL�� ������ url�� ������� ������ revokeObjectURL �Լ��� ��������մϴ�.
			// �׷��� ������ �޸� ���� ������ �߻��մϴ�.
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
	
	// �������� ���� �������� �Ѿ�� ��ȭ�� �����Ѵ�.
	 window.onblur = blurMe;
		
		function blurMe(){
			if (mediaRecorder) {
				// 5. ��ȭ ����
				mediaRecorder.stop();
			
			}
			
			// ��ȭ ������ �Ͼ �� 2�� �� �ٿ�ε� ����
			setTimeout(function(){
	        	// 2�� �� �۵��ؾ��� �ڵ�
			          if (recordedMediaURL) {
			            const link = document.createElement('a');
			            console.log("link : ", link)
			            document.body.appendChild(link);
			            link.href = recordedMediaURL;
			            link.download = 'record_UserCam_test.webm'; //����� ��ȭ���� ���ϸ�
			            link.click();
			            //document.body.removeChild(link);
			          }
	        	}, 2000);
		}
});
</script>
</body>
</html>