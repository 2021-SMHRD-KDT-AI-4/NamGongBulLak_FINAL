<%@page import="model.BoardViewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DanceBoardDAO"%>
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
        sessionStorage.setItem("board", "boardEN");
        console.log(sessionStorage.getItem("board"));
        
        </script>
        <title>Board</title>
    </head>
    <body>

    	<%
    		//System.out.println("넘어가?1");
    		DanceBoardDAO dao = new DanceBoardDAO();
    		//System.out.println("넘어가?2");
    		ArrayList<BoardViewDTO> list = dao.board_view();
    		//System.out.println("넘어가?3");
    	%>
    	
    	
        <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
            <!-- 상단 네비게이션 -->
            <div id="navi"></div>
            <!-- 메인 내용 -->
            <div style="width: 103rem; height: 49.25rem; margin: 0 auto; overflow: overlay; display: grid; grid-template-columns: 1fr 1fr 1fr 1fr;">
                
                <%
    				for(int i = 0; i < list.size(); i++){
    					//System.out.println(i);
    			%>
    		            <!-- 게시물 -->
    		            <a href = "board_view.jsp?article_seq=<%=list.get(i).getArticle_seq() %>">
    		            <div style="background-color: rgba(0,0,0,0.5); width: 25rem; height: 24.25rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 0.5rem;">
    		                <div style="height: 23.375rem; width: 24.5rem; margin: auto; padding-top: 0.5rem;">
    		                    <div style="display: flex; flex-direction: row;">
    		                        <div style="margin: 0 0.5rem;">
    		                            <!-- 노래 이미지 -->
    		                            <img src="./static/img/<%= list.get(i).getAlbum_filename() %>" style="width: 3.75rem; height: 3.75rem;">
    		                        </div>
    		                        <div style="display: flex; flex-direction: column; justify-content: center;">
    		                            <!-- 노래 이름 -->
    		                            <span style="text-align: left; font-family: 'GmarketSansTTFBold'; font-size: 1.2rem;"><%= list.get(i).getSong_title() %></span>
    		                            <!-- 가수 / 앨범 이름 -->
    		                            <span style="font-size: 0.8rem;"><%= list.get(i).getSong_singer() %> | <%= list.get(i).getSong_title() %></span>
    		                        </div>
    		                    </div>
    		                    <div style="margin: 0 auto 0.5rem; width: 24rem; height: 13.5rem;">
    		                        <!-- 영상 썸네일 -->
    		                        <video src="./static/video/butter2.mp4" preload="metadata" style="width: 100%; height: 100%;"></video>
    		                    </div>
    		                    <div style="text-align: left; display: flex; flex-direction: row;">
    		                        <!-- 프로필 이미지 -->
    		                        <img src="./data/profile_image/<%= list.get(i).getProfile_img() %>" style="width: 3.75rem; height: 3.75rem; border: 0.0625rem solid white; border-radius: 50%; margin-right: 0.5rem;">
    		                        <div style="height: 4.5rem; line-height: 1.25rem;">
    		                            <!-- 게시물 제목 -->
    		                            <span style="font-size: 1.2rem; font-family: 'GmarketSansTTFBold'; margin: 0;"><%= list.get(i).getSubject() %></span><br>
    		                            <!-- 작성자 닉네임 -->
    		                            <span style="font-size: 0.8rem;">작성자 : <%= list.get(i).getNickname() %></span><br>
    		                            <!-- 좋아요 / 조회 수 / 작성일 -->
    		                            <span style="font-size: 0.8rem;">좋아요<%= list.get(i).getLike_count() %>개 · 조회수 <%= list.get(i).getView_count() %>회 · <%= list.get(i).getArticle_date() %></span>
    		                        </div>
    		                    </div>
    		                </div>
    		            </div>
    		            </a>
    	        <% 
    				}
    			%>
                
            </div>
        <input type="button" value="Create a Post" onclick="location.href='./board_writeEN.jsp'" style="height: 2.5rem; margin-top: 0.5rem; background-color: black; border: 0.0625rem solid white; border-radius: 0.5rem; color: white;">
    </div>
</body>
</html>