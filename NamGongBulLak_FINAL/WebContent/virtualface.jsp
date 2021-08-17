<%@page import="model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ProductBuyInfoDTO"%>
<%@page import="model.ProductBuyinfoDAO"%>
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
	<script src="./static/js/myVirtualFace.js"></script>
    <title>VirtualFace</title>
</head>
<body>
<% 
	MemberDTO memInfo = (MemberDTO)session.getAttribute("info");
	String id = memInfo.getId();
	ProductBuyinfoDAO dao = new ProductBuyinfoDAO();
	ArrayList<ProductBuyInfoDTO> list = dao.showVirtualFace(id);
	
	String[] selectedList = dao.selectedVirtualFace(id);
%>
    <div class="virtualface" style="width: 100%; height: 100vh; color: black;">
        <div style="height: 12.5rem;"></div>
        <div style="height: 43.75rem; width: 27.25rem; background-color: #707070; margin: 0 auto; border-radius: 1rem;font-size: 1.2rem;">
            <div style="font-size: 1.6rem; padding: 0.5rem 0;">������ ��������̽�</div>
            <div style="width: 8.5rem; height: 8.5rem; border: 0.125rem solid #fff; border-radius: 1rem; margin: 0 auto; display: flex; justify-content: center; align-items: center;">
                <!-- ������ ��������̽� -->
                <%
                	if (selectedList[0] == null) {
                %>
           		<div id = "selected" style="width: 7.5rem; height: 7.5rem; background-color: white; border-radius: 1rem; margin: 0.5rem auto; display: flex; justify-content: center; align-items: center; flex-wrap: wrap;">
                   	<img id="selectedImg" src="./static/img/<%= selectedList[0] %>" style="display:none; height: 5rem; width: 5rem;">
               		<br><span id="selectedName" style="display:none; margin: auto;"><%= selectedList[1] %></span>
                   	<span id="selectedNull">������<br>��������<br>�����ϼ���</span>
                </div>
				<%                    	
                	} else {
                %> 
                <div id="selected" style="width: 7.5rem; height: 7.5rem; background-color: white; border-radius: 1rem; margin: 0.5rem auto; display: flex; justify-content: center; align-items: center; flex-wrap: wrap;">
                    <img id="selectedImg" src="./static/img/<%= selectedList[0] %>" style="height: 5rem; width: 5rem;">
                    <br><span id="selectedName" style="margin: auto;"><%= selectedList[1] %></span>
                    <span id="selectedNull"></span>
                </div>
                <%
                	}
                %>
            </div>
            <br>
            <div style="font-size: 1.6rem; padding: 0.5rem 0;">���� ���� ��������̽�</div>
            <div style="width: 26.25rem; max-height: 26rem; border: 0.125rem solid #fff; border-radius: 1rem; margin: 0 auto; overflow: overlay; display: grid; grid-template-columns: 1fr 1fr 1fr;">
                <!-- ���� ���� ��������̽� -->
                <!-- �ݺ� -->
                <%
                	if (!list.isEmpty()) {
                		for(int i = 0; i < list.size(); i++) {
                %>
	                <div class="virtualFaceList" style="width: 7.5rem; height: 7.5rem; background-color: white; border-radius: 1rem; margin: 0.5rem auto; display: flex; justify-content: center; align-items: center; flex-wrap: wrap;">
	                    <img src="./static/img/<%= list.get(i).getP_filename() %>" style="height: 5rem; width: 5rem;">
	                    <br><span style="margin: auto;"><%= list.get(i).getP_name() %></span>
	                </div>
                <%
                		}
                	} else {
                %>
                	<div style="width: 25.5rem; font-size: 1.6rem; color: white; margin: auto;">
	                    	<br>��������̽���<br>�������ּ���!<br>&nbsp;
                	</div>
                <%
                	}
                %>
                
            </div>
            <!-- �����ϱ� ��ư -->
            <input type="button" value="�����ϱ�" id="saveVirtualFace" onclick="save();" style="margin-top: 0.5rem;">
        </div>
    </div>
</body>
</html>