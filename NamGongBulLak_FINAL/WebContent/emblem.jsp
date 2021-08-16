<%@page import="model.MemberDTO"%>
<%@page import="model.EmblemInfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MemberDTO"%>
<%@page import="model.EmblemInfoDAO"%>
<%-- <%@page import="sun.awt.EmbeddedFrame"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- ÀÓÆ÷Æ® -->
<link rel="stylesheet" href="./static/css/style.css" />
<title>Emblem</title>
<script src="./static/js/jquery-3.5.1.min.js"></script>
<script src="./static/js/myEmblem.js"></script>
</head>
<body>
	<% 
		MemberDTO memInfo = (MemberDTO)session.getAttribute("info");
		EmblemInfoDAO emb = new EmblemInfoDAO();
		ArrayList<EmblemInfoDTO> list = emb.showEmblemInfo(memInfo.getId());
		
		String[] embList = emb.selectEmblem(memInfo.getId());
	%>
	<input type="hidden" id="len" value=<%=list.size() %>>
	<div class="emblem" style="width: 100%; height: 100vh; color: black;">
		<div style="height: 12.5rem;"></div>
		<div
			style="height: 43.75rem; width: 27.25rem; background-color: #707070; margin: 0 auto; border-radius: 1rem; font-size: 1.2rem;">
			<div style="font-size: 1.6rem; padding: 0.5rem 0;">ÀåÂøÇÒ ¿¥ºí·³</div>
			<div
				style="width: 26.25rem; height: 8.5rem; border: 0.125rem solid #fff; border-radius: 1rem; margin: 0 auto; display: flex; flex-direction: row; justify-content: space-between; align-items: center; padding: 0 0.25rem;">

				<!-- ÀåÂøÇÒ ¿¥ºí·³1 -->
				<div
					style="width: 7.5rem; height: 7.5rem; background-color: white; border-radius: 1rem; display: flex; justify-content: center; align-items: center; flex-wrap: wrap;">
					<img id="header_img1" src="./data/emblem/<%=embList[0] %>" onclick="removeimg1()"
						style="height: 5rem; width: 5rem;"> <br>
					<span style="margin: auto;">¿¥ºí·³1</span>
				</div>
				<!-- ÀåÂøÇÒ ¿¥ºí·³2 -->
				<div
					style="width: 7.5rem; height: 7.5rem; background-color: white; border-radius: 1rem; display: flex; justify-content: center; align-items: center; flex-wrap: wrap;">
					<img id="header_img2" src="./data/emblem/<%=embList[1] %>" onclick="removeimg2()"
						style="height: 5rem; width: 5rem;"> <br>
					<span style="margin: auto;">¿¥ºí·³2</span>
				</div>
				<!-- ÀåÂøÇÒ ¿¥ºí·³3 -->
				<div
					style="width: 7.5rem; height: 7.5rem; background-color: white; border-radius: 1rem; display: flex; justify-content: center; align-items: center; flex-wrap: wrap;">
					<img id="header_img3" src="./data/emblem/<%=embList[2] %>" onclick="removeimg3()"
						style="height: 5rem; width: 5rem;"> <br>
					<span style="margin: auto;">¿¥ºí·³3</span>
				</div>
			</div>

			<div style="font-size: 1.6rem; padding: 0.5rem 0;">º¸À¯ ÁßÀÎ ¿¥ºí·³</div>
			<div
				style="width: 26.25rem; max-height: 26rem; border: 0.125rem solid #fff; border-radius: 1rem; margin: 0 auto; overflow: overlay; display: grid; grid-template-columns: 1fr 1fr 1fr;">
				<!-- º¸À¯ ÁßÀÎ ¿¥ºí·³ -->
				<!-- ¹İº¹ -->
				<%
	            	for (int i = 0; i<list.size(); i++) {
						System.out.println(list.get(i).getEmblem_filename());
						System.out.println(list.get(i).getEmblem_code());
						//data[i] = list.get(i).getEmblem_filename();
		          %>
				<div
					style="width: 7.5rem; height: 7.5rem; background-color: white; border-radius: 1rem; margin: 0.5rem auto; display: flex; justify-content: center; align-items: center; flex-wrap: wrap;">
					<img src="./data/emblem/<%= list.get(i).getEmblem_filename() %>"
						id="img<%= i+1 %>" onclick="insert_img<%=i+1%>()"
						style="height: 5rem; width: 5rem;"> <br>
					<span style="margin: auto;">¿¥ºí·³1</span>
				</div>
				<% } %>

			</div>
			<!-- ÀúÀåÇÏ±â ¹öÆ° -->
			<input type="button" value="ÀúÀåÇÏ±â" id="saveEmblem" onclick="save();"
				style="margin-top: 0.5rem;">

		</div>
		
	</div>
	<script>
    
      
        function save() {
        	 	var header_img1 = $('#header_img1').attr("src").split('/')[3];
        	    var header_img2 = $('#header_img2').attr("src").split('/')[3];
        	    var header_img3 = $('#header_img3').attr("src").split('/')[3];
        	
            	window.location.href = "mypageKR.jsp?data="+header_img1+"/"+header_img2+"/"+header_img3;
        }
    </script>
</body>
</html>