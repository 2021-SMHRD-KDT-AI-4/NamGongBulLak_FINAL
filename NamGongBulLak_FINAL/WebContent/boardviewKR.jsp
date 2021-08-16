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
    <!-- ����Ʈ -->
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
			System.out.println("���ε� ����");
		} else {
			System.out.println("���ε� ����");
		}
	} catch(NumberFormatException e) {
		
	}
	System.out.println("���̵� : " + req_id);
	System.out.println("�Խù� ��ȣ : " + req_article_seq);
	System.out.println("��� ���� : " + req_comments);
%>
    <div style="background-color: rgba(0,0,0,0.5); width: 100%; height: 100vh;">
        <!-- ��� �׺���̼� -->
        <div id="navi"></div>
        <!-- ���� ���� -->
        <div style="width: 90.25rem; height: 51rem; margin: auto; display: flex; flex-direction: row; justify-content: space-between;">
            <div style="width: 56rem; height: 51rem; background-color: rgba(0,0,0,0.5); border: 0.0625rem solid white; border-radius: 1rem;">
                <div style="width: 54rem; height: 49rem; margin: 1rem;">
                    <div style="width: 52.75rem; height: 3.75rem; margin: 0 auto 1rem auto; display: flex; flex-direction: row;">
                        <div style="width: 3.75rem; height: 3.75rem; margin-right: 0.5rem;">
                            <!-- �뷡 �̹��� -->
                            <img src="./static/img/<%= boardList.get(0).getAlbum_filename() %>" style="width: 100%; height: 100%;">
                        </div>
                        <div style="width: 48.5rem; height: 3.75rem; display: flex; justify-content: left; align-items: center; font-family: 'GmarketSansTTFBold'; background-color: black;">
                            <!-- �뷡 �̸� / ���� / �ٹ� �̸� -->
                             <%= boardList.get(0).getSong_title()%> - <%= boardList.get(0).getSong_singer()%> | <%= boardList.get(0).getAlbum_title() %>
                        </div>
                    </div>
                    <div style="width: 54rem; height: 30.375rem; margin-bottom: 0.5rem;">
                        <!-- �Խù� ���� -->
                        <video src="./static/video/<%= boardList.get(0).getUpload_filename() %>" controls autoplay style="width: 100%; height: 100%;"></video>
                    </div>
                    <div style="height: 1.75rem; text-align: left; margin-bottom: 0.5rem;">
                    	<!-- �Խù� ���� -->
                        <%= boardList.get(0).getContent()%>
                    </div>
                    <div style="height: 1rem; text-align: left; margin-bottom: 0.5rem; font-size: 1.0rem;">
                        	<!-- �Խù� ��ȸ�� / �ۼ��� -->
                        	 ��ȸ�� <%= boardList.get(0).getView_count() %>ȸ �� <%= boardList.get(0).getArticle_date() %>
                    </div>
                    <div style="height: 3.75rem; display: flex; flex-direction: row;">
                        <div style="width: 3.75rem; height: 3.75rem; margin-right: 0.5rem;">
                            <!-- �ۼ��� ������ �̹��� -->
                            <img src="./data/profile_image/<%= boardList.get(0).getWriter_img() %>" style="width: 100%; height: 100%; border: 0.0625rem solid white; border-radius: 50%;">
                        </div>
                        <div style="width: 49.75rem; height: 3.75rem; display: flex; justify-content: left; align-items: center; font-family: 'GmarketSansTTFBold'; font-size: 1.2rem;">
                            <!-- �ۼ��� �г��� -->
                        	<%= boardList.get(0).getWriter() %>
                        </div>
                    </div>
                    <div style="width: 49.75rem; height: 5.5rem; font-size: 1.2rem; overflow: overlay; margin-left: 4.25rem; text-align: left;">
                        <!-- �Խù� ���� -->
						<%= boardList.get(0).getContent() %>
                    </div>
                </div>
            </div>

            <div style="width: 33.25rem; height: 51rem; background-color: rgba(0,0,0,0.5); border: 0.0625rem solid white; border-radius: 1rem;">
                <div style="width: 31.25rem; height: 49rem; margin: 1rem;">
                    <div id="comment" style="height: 43.25rem; overflow: overlay; margin-bottom: 1.25rem;">
						<!-- �ݺ� -->
						<!-- ���1 -->
                        <% 
                       	if (!commentList.isEmpty()) {
                        	for(int i = 0; i < commentList.size(); i++) {
                    	%>
                        <div style="display: flex; flex-direction: row; margin-bottom: 1rem;">
                            <div style="width: 3.75rem; height: 3.75rem; border: 0.0625rem solid white; border-radius: 50%;">
								<!-- ����� ������ �̹��� -->
                                <img src="./data/profile_image/<%= commentList.get(i).getCommenter_img() %>" style="width: 100%; height: 100%; border-radius: 50%;">
                            </div>
                            <div style="text-align: left; background-color: #707070; border-radius: 1rem; font-size: 1.0rem; max-width: 21.125rem; padding: 0.5rem; margin: 1rem 0.5rem 0 0.5rem; height: fit-content;">
								<!-- ����� �г��� -->
                                <span style="font-family: 'GmarketSansTTFBold';"><%= commentList.get(i).getCommenter() %></span><br>
								<!-- ��� ���� -->
                                <%= commentList.get(i).getComments() %>
                            </div>
                            <div style="font-size: 0.8rem; display: flex; align-items: flex-end;">
								<!-- ��� �ۼ��� -->
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
						<!-- �Խù� ���ƿ� �� -->
                        <span id="like_result" style="font-size: 1.2rem; font-family: 'GmarketSansTTFBold';"><%= boardList.get(0).getLike_count() %>��</span>&nbsp;&nbsp;
                        <img src="./static/img/comment.png" style="height: 1.5rem;">&nbsp;
						<!-- �Խù� ��ۼ� -->
                        <span style="font-size: 1.2rem; font-family: 'GmarketSansTTFBold';"><%= commentList.size() %>��</span>&nbsp;&nbsp;
                    </div>
                    <div style="width: 30.25rem; height: 2.5rem; margin: auto; display: flex; flex-direction: row; justify-content: space-between;">
						<!-- ��� ��� �� -->
<!--                         <form action="WriteComment" method="get"> -->
							<!-- ���̵� / �Խù� ��ȣ -->
                        	<input type="text" id="id" name="id" value="<%= id %>" style="display: none;">
                        	<input type="text" id="article_seq" name="article_seq" value="<%= article_num %>" style="display: none;">
							<!-- ��� ���� -->
                            <input type="text" id="comments" name="comments" placeholder="��� �ޱ�.." style="width: 25.5rem; height: 2.5rem; background-color: white; border: 0.0625rem solid black; border-radius: 1rem; color: black; font-size: 1.2rem;">
							<!-- ��� ��ư -->
                            <input type="button" onclick="uploadComment()" value="�Խ�" style="width: 3.75rem; height: 2.5rem; background-color: black; border: 0.0625rem solid white; border-radius: 1rem; color: white; font-size: 1.2rem; font-family: 'GmarketSansTTFBold';">
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
				console.log('����');
				$('#comment').load(window.location.href + ' #comment');
			},
			error : function(a, b, c){
				//��� ���н� �߻��ϴ� �Լ�(�ݹ�)
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
		            $('#like_result').html(data + "��");
		            $("#likeImg").attr("src", "./static/img/heart2.png")
		        },
		        error : function(){
		        	alert("����");
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
		            $('#like_result').html(data + "��");
		            $("#likeImg").attr("src", "./static/img/heart1.png");
				},
				error : function(){
					alert("����");
				}
			});
			$("#likeCheck").val("N");
		}
	}
</script>
</html>