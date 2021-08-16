<%@page import="model.MemberDTO"%>
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
    <script type="text/javascript">   
     
   </script>
    <title>PlayDanceResult</title>
</head>
<body>
<%

MemberDTO memInfo = (MemberDTO)session.getAttribute("info");
String[] data = null;
try{
	data = request.getParameter("data").split("/");
}catch(NullPointerException e){
	System.out.println("data가 없습니다");
}

//jjjjjjjjjjjjjjjjjjj
String[] songdata = request.getParameter("songdata").split("/");

String title = songdata[1];

String singer = songdata[0];

String albumImg = songdata[2];

float score = Float.parseFloat(request.getParameter("score"));
String[] mgdgrper = request.getParameter("mgdgrper").split("/");

System.out.println(songdata+"aaaaaaaaaaaaaaaaaaa");
float miss = Float.parseFloat(mgdgrper[0]);
float good = Float.parseFloat(mgdgrper[1]);
float great = Float.parseFloat(mgdgrper[2]);
float perfect = Float.parseFloat(mgdgrper[3]);

System.out.println(miss+"+"+good+"+"+great+"+"+perfect);

float sum = miss+good+great+perfect;

float p_m = (miss/sum)*100;
float p_gd = (good/sum)*100;
float p_gr = (great/sum)*100;
float p_per = (perfect/sum)*100;

String spm = String.format("%.1f", p_m);
String spgd = String.format("%.1f", p_gd);
String spgr = String.format("%.1f", p_gr);
String spper = String.format("%.1f", p_per);

String grade = null;

if(score>=75) {
   grade="A";
}else if(score>=50) {
   grade="B";
}else if(score>=25) {
   grade="C";
}else {
   grade="F";
}

String num = request.getParameter("num");

//jjjjjjjjjjjjjjjjjjjj
%>
   <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
        <!-- 상단 네비게이션 -->
        <div id="navi"></div>
        <!-- 메인 내용 -->
        <div style="height: 1.25rem;"></div>
        <!-- 사용자 닉네임 -->
        <span style="font-family: 'GmarketSansTTFBold'; font-size: 2rem;"><%= memInfo.getId() %>님의 PlayDance Results</span>
        <div style="width: 101.25rem; height: 42.5rem; background-color: rgba(112, 112, 112, 0.6); margin: auto; border: 0.25rem solid #fff; border-radius: 2rem; display: flex; flex-direction: row;">
            <div style="width: 33.75rem;">
                <div style="height: 2.5rem;"></div>
                
                <!-- jjjjjjjjjjjjjjjjjj -->
                <!-- 노래 앨범 이미지 -->
                <img src="./static/img/<%=albumImg %>" style="width: 22.5rem; height: 22.5rem;">
                <!-- 노래 이름 -->
                <br><span><%=title%> - <%=singer%></span>
                <!-- jjjjjjjjjjjjjjj -->
                
            </div>
            <div style="width: 33.75rem;">
                <div style="height: 4.5rem;"></div>
                <div style="height: 22.75rem; display: flex; flex-direction: row; justify-content: center;">
                    <div style="font-family: 'Bangtan'; font-size: 3.2rem; display: flex; flex-direction: column; justify-content: space-around; text-align: left;">
                        <span>MISS</span>
                        <span>GOOD</span>
                        <span>GREAT</span>
                        <span>PERFECT</span>
                    </div>
                    <div style="font-family: 'GmarketSansTTFBold'; font-size: 3.2rem; display: flex; flex-direction: column; justify-content: space-around; text-align: right; margin-left: 2rem;">
                        <!-- MISS -->
                        <span><%= p_m%>%</span>
                        <!-- GOOD -->
                        <span><%= p_gd%>%</span>
                        <!-- GREAT -->
                        <span><%= p_gr%>%</span>
                        <!-- PERFECT -->
                        <span><%= p_per%>%</span>
                    </div>
                </div>
                <div style="height: 3.5rem;"></div>
                <span style="font-family: 'Bangtan'; font-size: 8rem;">TOTAL</span>
            </div>
            <div style="width: 33.75rem;">
                <div style="height: 2rem;"></div>
                <!-- GRADE -->
                <span style="font-family: 'Bangtan'; font-size: 24rem; -webkit-text-stroke-width: 1rem; -webkit-text-stroke-color: black;">
                    <%=grade%>
                </span>
                <span style="font-family: 'Bangtan'; font-size: 8rem;">
                    <%=score%>
                </span>
            </div>
        </div>
        <div style="height: 1.25rem;"></div>
        
        
        <!-- 버튼 -->
        <input type="button" value="리플레이" onclick="asd()" style="margin: 0 0.75rem; width: 7.5rem; height: 3rem; background-color: black; color: white; font-size: 1.6rem; font-family: 'GmarketSansTTFBold'; border: 0.0625rem solid #fff; border-radius: 1rem;">
        
        <!-- jjjjjjjjjjjjjj -->
        <input type="button" value="다시하기" onclick="rt()" style="margin: 0 0.75rem; width: 7.5rem; height: 3rem; background-color: black; color: white; font-size: 1.6rem; font-family: 'GmarketSansTTFBold'; border: 0.0625rem solid #fff; border-radius: 1rem;">
        <!-- jjjjjjjjjjjjjj -->
        
        <input type="button" value="목록으로" style="margin: 0 0.75rem; width: 7.5rem; height: 3rem; background-color: black; color: white; font-size: 1.6rem; font-family: 'GmarketSansTTFBold'; border: 0.0625rem solid #fff; border-radius: 1rem;">
        
         <!-- jjjjjjjjjjjjjj -->
        <input type="button" value="홈으로" onclick="home()" style="margin: 0 0.75rem; width: 7.5rem; height: 3rem; background-color: black; color: white; font-size: 1.6rem; font-family: 'GmarketSansTTFBold'; border: 0.0625rem solid #fff; border-radius: 1rem;">
         <!-- jjjjjjjjjjjjjj -->
         
         
    </div>
   
    <!-- jjjjjjjjjjjjjj -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-3.5.1.min.js"></script>
      <script>
      
      
 <%--    var num = <%=num%>;
    function closes(num){
        if(num==1){
           setTimeout(function(){
              self.close();
           }
           ,5400);
        }
     }
    
    closes(num); --%>
    
    
      $(document).ready(function() {
         
      $("#navi").load("./navigationKR.jsp");
   });
      
 
    //setTimeout(sc(),5000);
    
   function asd(){
      /* alert("야 이거 된다"); */
      /* alert(${url.recordedMediaURL}); */
      /* alert("result 페이지 : "+localStorage.getItem("url")); */
      window.open(localStorage.getItem("url"));
   }
   
   function rt(){
      const url = "http://localhost:8082/Third_PJ/playdance.jsp?songdata=<%=singer%>/<%=title%>/<%=albumImg%>";
      const encoded = encodeURI(url);
      location.replace(encoded); 
   }
   
   function home(){
      var enkrs = sessionStorage.key(0);
      var enkr = sessionStorage.getItem(enkrs).length;
      var enkr1 = sessionStorage.getItem(enkrs).substring(enkr-2,enkr)
      console.log(enkr1);
      if(enkr1 == 'KR' || enkr1 == 'kr'){
           $(document).ready(function() {
              location.href="mainKR.jsp"; 
         });
       }else if(enkr1 == 'EN' || enkr1 == 'en'){
           $(document).ready(function() {
              location.replace("mainEN.jsp"); 
         });
       }
   }
    </script>
    <!-- jjjjjjjjjjjjjj -->
    
</body>
</html>