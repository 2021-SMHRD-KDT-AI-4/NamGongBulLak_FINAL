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
    <title>Payment</title>
</head>
<body>
<%
String prs = request.getParameter("prs");
String price = request.getParameter("price");

%>
    <div class="payment" style="width: 100%; height: 100vh; color: black;">
        <div style="height: 15rem;"></div>
            <div style="width: 22.5rem; height: 14rem; background-color: #707070; border: 0.0625rem solid white; border-radius: 1rem; margin: auto;">
                <div style="height: 3.75rem;"></div>
                <div style="height: 3.75rem; color: white;">
                    <span style="font-family: 'GmarketSansTTFBold';">������ ��ǰ</span>��(��)<br>�����Ͻðڽ��ϱ�?
                </div>
                <div style="height: 2rem"></div>
                <div style="width: 13.75rem; height: 2rem; display: flex; flex-direction: row; justify-content: space-between; margin: auto;">
                    <input type="button" value="��" onclick="yes();" style="width: 3.75rem; height: 2rem; background-color: #cfcfcf; border: 0.0625rem solid white; border-radius: 0.5rem;">
                    <input type="button" value="�ƴϿ�" onclick="no();" style="width: 3.75rem; height: 2rem; background-color: #cfcfcf; border: 0.0625rem solid white; border-radius: 0.5rem;">
                </div>
            </div>
        </div>
    <script>
        function yes() {
            window.location.href = "./storeKR.jsp";
        }
        function no() {
            window.location.href = "./storeKR.jsp";
        }
    </script>
</body>
</html>