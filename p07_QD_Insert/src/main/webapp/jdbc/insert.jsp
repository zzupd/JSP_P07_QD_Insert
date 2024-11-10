<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="dataBean" class="pkg.jdbc.DataBean" />
<jsp:setProperty name="dataBean" property="*" />

<jsp:useBean id="dbConn" class="pkg.jdbc.DBConn" />
    
<%
dbConn.mtdDBConn();
boolean chk = dbConn.mtdInsert(dataBean);
	
String resTxt = "";
if (chk) {
	resTxt = "데이터 입력 완료";
} else {
	resTxt = "입력 오류 발생";
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/style/style.css?v">
</head>
<body>
	<div id="wrap">

		<h3><%=resTxt %></h3>
		
		<div id="btnArea">
			<button type="button" id="backBtn">돌아가기</button>
		</div>

	</div>
	<!-- div#wrap -->
	<script src="/script/jquery-3.7.1.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>  
   
    

		
  