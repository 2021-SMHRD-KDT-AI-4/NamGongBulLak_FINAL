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
    <!-- ����Ʈ -->
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
    		//System.out.println("�Ѿ?1");
    		DanceBoardDAO dao = new DanceBoardDAO();
    		//System.out.println("�Ѿ?2");
    		ArrayList<BoardViewDTO> list = dao.board_view();
    		//System.out.println("�Ѿ?3");
    	%>
    	
    	
        <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
            <!-- ��� �׺���̼� -->
            <div id="navi"></div>
            <!-- ���� ���� -->
            <div style="width: 103rem; height: 49.25rem; margin: 0 auto; overflow: overlay; display: grid; grid-template-columns: 1fr 1fr 1fr 1fr;">
                
                <%
    				for(int i = 0; i < list.size(); i++){
    					//System.out.println(i);
    			%>
    		            <!-- �Խù� -->
    		            <a href = "board_view.jsp?article_seq=<%=list.get(i).getArticle_seq() %>">
    		            <div style="background-color: rgba(0,0,0,0.5); width: 25rem; height: 24.25rem; border: 0.0625rem solid white; border-radius: 1rem; margin-bottom: 0.5rem;">
    		                <div style="height: 23.375rem; width: 24.5rem; margin: auto; padding-top: 0.5rem;">
    		                    <div style="display: flex; flex-direction: row;">
    		                        <div style="margin: 0 0.5rem;">
    		                            <!-- �뷡 �̹��� -->
    		                            <img src="./static/img/<%= list.get(i).getAlbum_filename() %>" style="width: 3.75rem; height: 3.75rem;">
    		                        </div>
    		                        <div style="display: flex; flex-direction: column; justify-content: center;">
    		                            <!-- �뷡 �̸� -->
    		                            <span style="text-align: left; font-family: 'GmarketSansTTFBold'; font-size: 1.2rem;"><%= list.get(i).getSong_title() %></span>
    		                            <!-- ���� / �ٹ� �̸� -->
    		                            <span style="font-size: 0.8rem;"><%= list.get(i).getSong_singer() %> | <%= list.get(i).getSong_title() %></span>
    		                        </div>
    		                    </div>
    		                    <div style="margin: 0 auto 0.5rem; width: 24rem; height: 13.5rem;">
    		                        <!-- ���� ����� -->
    		                        <video src="./static/video/butter2.mp4" preload="metadata" style="width: 100%; height: 100%;"></video>
    		                    </div>
    		                    <div style="text-align: left; display: flex; flex-direction: row;">
    		                        <!-- ������ �̹��� -->
    		                        <img src="./data/profile_image/<%= list.get(i).getProfile_img() %>" style="width: 3.75rem; height: 3.75rem; border: 0.0625rem solid white; border-radius: 50%; margin-right: 0.5rem;">
    		                        <div style="height: 4.5rem; line-height: 1.25rem;">
    		                            <!-- �Խù� ���� -->
    		                            <span style="font-size: 1.2rem; font-family: 'GmarketSansTTFBold'; margin: 0;"><%= list.get(i).getSubject() %></span><br>
    		                            <!-- �ۼ��� �г��� -->
    		                            <span style="font-size: 0.8rem;">�ۼ��� : <%= list.get(i).getNickname() %></span><br>
    		                            <!-- ���ƿ� / ��ȸ �� / �ۼ��� -->
    		                            <span style="font-size: 0.8rem;">���ƿ�<%= list.get(i).getLike_count() %>�� �� ��ȸ�� <%= list.get(i).getView_count() %>ȸ �� <%= list.get(i).getArticle_date() %></span>
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