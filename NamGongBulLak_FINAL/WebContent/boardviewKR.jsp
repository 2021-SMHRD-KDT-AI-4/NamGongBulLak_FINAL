<%@page import="model.MemberDTO"%>
<%@page import="model.CommentDAO"%>
<%@page import="model.CommentDTO"%>
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
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript">   
        $(document).ready(function() {
			$("#navi").load("./navigation.html");
		});
        sessionStorage.clear();
        sessionStorage.setItem("boardv", "boardvKR");
        console.log(sessionStorage.getItem("boardv"));
	</script>
    <title>BoardView</title>
</head>
<body>
<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	String id = info.getId();
	DanceBoardDAO dao = new DanceBoardDAO();
	int article_num = Integer.parseInt(request.getParameter("article_seq"));
	dao.plusViewCount(article_num);
	ArrayList<BoardViewDTO> boardList = dao.showBoard(article_num);
	ArrayList<BoardViewDTO> commentList = dao.showComments(article_num);
	String req_id = null;
	int req_article_seq = 0;
	String req_comments = null;
	try {
		req_id = request.getParameter("id");
		req_article_seq = Integer.parseInt(request.getParameter("art_seq"));
		req_comments = request.getParameter("comments");
		
		CommentDTO dto = new CommentDTO(req_id, req_comments, req_article_seq);
		CommentDAO commentDao = new CommentDAO();
		
		int cnt = commentDao.insertComment(dto);
		commentList = dao.showComments(article_num);
		System.out.println("2 : " + commentList.get(commentList.size()-1).getCommenter_img());
		if(cnt > 0) {
			System.out.println("업로드 성공");
		} else {
			System.out.println("업로드 실패");
		}
	} catch(NumberFormatException e) {
		
	}
	System.out.println("아이디 : " + req_id);
	System.out.println("게시물 번호 : " + req_article_seq);
	System.out.println("댓글 내용 : " + req_comments);
%>
    <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
        <!-- 상단 네비게이션 -->
        <div id="navi"></div>
        <!-- 메인 내용 -->
        <div style="width: 90.25rem; height: 51rem; margin: auto; display: flex; flex-direction: row; justify-content: space-between;">
            <div style="width: 56rem; height: 51rem; background-color: rgba(0,0,0,0.5); border: 0.0625rem solid white; border-radius: 1rem;">
                <div style="width: 54rem; height: 49rem; margin: 1rem;">
                    <div style="width: 52.75rem; height: 3.75rem; margin: 0 auto 1rem auto; display: flex; flex-direction: row;">
                        <div style="width: 3.75rem; height: 3.75rem; margin-right: 0.5rem;">
                            <!-- 노래 이미지 -->
                            <img src="./static/img/<%= boardList.get(0).getAlbum_filename() %>" style="width: 100%; height: 100%;">
                        </div>
                        <div style="width: 48.5rem; height: 3.75rem; display: flex; justify-content: left; align-items: center; font-family: 'GmarketSansTTFBold'; background-color: black;">
                            <!-- 노래 이름 / 가수 / 앨범 이름 -->
                             <%= boardList.get(0).getSong_title()%> - <%= boardList.get(0).getSong_singer()%> | <%= boardList.get(0).getAlbum_title() %>
                        </div>
                    </div>
                    <div style="width: 54rem; height: 30.375rem; margin-bottom: 0.5rem;">
                        <!-- 게시물 영상 -->
                        <video src="./static/video/<%= boardList.get(0).getUpload_filename() %>" controls autoplay style="width: 100%; height: 100%;"></video>
                    </div>
                    <div style="height: 1.75rem; text-align: left; margin-bottom: 0.5rem;">
                    	<!-- 게시물 제목 -->
                        <%= boardList.get(0).getContent()%>
                    </div>
                    <div style="height: 1rem; text-align: left; margin-bottom: 0.5rem; font-size: 1.0rem;">
                        	<!-- 게시물 조회수 / 작성일 -->
                        	 조회수 <%= boardList.get(0).getView_count() %>회 · <%= boardList.get(0).getArticle_date() %>
                    </div>
                    <div style="height: 3.75rem; display: flex; flex-direction: row;">
                        <div style="width: 3.75rem; height: 3.75rem; margin-right: 0.5rem;">
                            <!-- 작성자 프로필 이미지 -->
                            <img src="./data/profile_image/<%= boardList.get(0).getWriter_img() %>" style="width: 100%; height: 100%; border: 0.0625rem solid white; border-radius: 50%;">
                        </div>
                        <div style="width: 49.75rem; height: 3.75rem; display: flex; justify-content: left; align-items: center; font-family: 'GmarketSansTTFBold'; font-size: 1.2rem;">
                            <!-- 작성자 닉네임 -->
                        	<%= boardList.get(0).getWriter() %>
                        </div>
                    </div>
                    <div style="width: 49.75rem; height: 5.5rem; font-size: 1.2rem; overflow: overlay; margin-left: 4.25rem; text-align: left;">
                        <!-- 게시물 내용 -->
						<%= boardList.get(0).getContent() %>
                    </div>
                </div>
            </div>

            <div style="width: 33.25rem; height: 51rem; background-color: rgba(0,0,0,0.5); border: 0.0625rem solid white; border-radius: 1rem;">
                <div style="width: 31.25rem; height: 49rem; margin: 1rem;">
                    <div id="comment" style="height: 43.25rem; overflow: overlay; margin-bottom: 1.25rem;">
						<!-- 반복 -->
						<!-- 댓글1 -->
                        <% 
                       	if (!commentList.isEmpty()) {
                        	for(int i = 0; i < commentList.size(); i++) {
                    	%>
                        <div style="display: flex; flex-direction: row; margin-bottom: 1rem;">
                            <div style="width: 3.75rem; height: 3.75rem; border: 0.0625rem solid white; border-radius: 50%;">
								<!-- 사용자 프로필 이미지 -->
                                <img src="./data/profile_image/<%= commentList.get(i).getCommenter_img() %>" style="width: 100%; height: 100%; border-radius: 50%;">
                            </div>
                            <div style="text-align: left; background-color: #707070; border-radius: 1rem; font-size: 1.0rem; max-width: 21.125rem; padding: 0.5rem; margin: 1rem 0.5rem 0 0.5rem; height: fit-content;">
								<!-- 사용자 닉네임 -->
                                <span style="font-family: 'GmarketSansTTFBold';"><%= commentList.get(i).getCommenter() %></span><br>
								<!-- 댓글 내용 -->
                                <%= commentList.get(i).getComments() %>
                            </div>
                            <div style="font-size: 0.8rem; display: flex; align-items: flex-end;">
								<!-- 댓글 작성일 -->
                                <%= commentList.get(i).getComment_date() %>
                            </div>
                        </div>
                        <% 
	                    		} 
                     	} 
                        %>
    
                    </div>
                    <div style="height: 1.5rem; display: flex; flex-direction: row; justify-content: left; align-items: center; margin-left: 2rem; margin-bottom: 0.5rem;">
                        <input type="hidden" id="likeCheck" name="likeCheck" value="N">
                        <a href="javascript:like()"><img id="likeImg" src="./static/img/heart1.png" style="height: 1.5rem;">&nbsp;</a>
						<!-- 게시물 좋아요 수 -->
                        <span id="like_result" style="font-size: 1.2rem; font-family: 'GmarketSansTTFBold';"><%= boardList.get(0).getLike_count() %>개</span>&nbsp;&nbsp;
                        <img src="./static/img/comment.png" style="height: 1.5rem;">&nbsp;
						<!-- 게시물 댓글수 -->
                        <span style="font-size: 1.2rem; font-family: 'GmarketSansTTFBold';"><%= commentList.size() %>개</span>&nbsp;&nbsp;
                    </div>
                    <div style="width: 30.25rem; height: 2.5rem; margin: auto; display: flex; flex-direction: row; justify-content: space-between;">
						<!-- 댓글 등록 폼 -->
<!--                         <form action="WriteComment" method="get"> -->
							<!-- 아이디 / 게시물 번호 -->
                        	<input type="text" id="id" name="id" value="<%= id %>" style="display: none;">
                        	<input type="text" id="article_seq" name="article_seq" value="<%= article_num %>" style="display: none;">
							<!-- 댓글 내용 -->
                            <input type="text" id="comments" name="comments" placeholder="댓글 달기.." style="width: 25.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; color: black; font-size: 1.2rem;">
							<!-- 등록 버튼 -->
                            <input type="button" onclick="uploadComment()" value="게시" style="width: 3.75rem; height: 2.5rem; background-color: black; border: 0.0625rem solid white; border-radius: 1rem; color: white; font-size: 1.2rem; font-family: 'GmarketSansTTFBold';">
<!--                         </form> -->
                    </div>

                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
	function uploadComment() {
		var url = "./boardviewKR.jsp?article_seq=" + <%= article_num %>;
		$.ajax({
			type: 'post',
			url: url,
			dataType: 'text',
			data: {
				'id' :$('#id').val(),
				'art_seq' : $('#article_seq').val(),
				'comments' : $('#comments').val()
			},
			success: function(data) {
				console.log('성공');
				$('#comment').load(window.location.href + ' #comment');
			},
			error : function(a, b, c){
				//통신 실패시 발생하는 함수(콜백)
				alert(a + b + c);
			}
		});
	};
	function like(){
		if($("#likeCheck").val() == "N"){
			$.ajax({
		    	type : "post",
		        data : {
		        	"article_seq" : $('#article_seq').val()
		        	},
		        url : "LikeService",
		        dataType : "text",
		        success : function(data){
		            $('#like_result').html(data + "개");
		            $("#likeImg").attr("src", "./static/img/heart2.png")
		        },
		        error : function(){
		        	alert("실패");
		        }
			});
			$("#likeCheck").val("Y");
		}else if($("#likeCheck").val() == "Y"){
			$.ajax({
				type : "post",
				data : {
					"article_seq" : $('#article_seq').val()
				},
				url : "DislikeService",
				dataType : "text",
				success : function(data){
					location.reload(); 
		            $('#like_result').html(data + "개");
		            $("#likeImg").attr("src", "./static/img/heart1.png");
				},
				error : function(){
					alert("실패");
				}
			});
			$("#likeCheck").val("N");
		}
	}
</script>
</html>