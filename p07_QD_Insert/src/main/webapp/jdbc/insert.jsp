<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
String goodsCode = request.getParameter("goodsCode");
String goodsName = request.getParameter("goodsName");
int price = Integer.parseInt(request.getParameter("price"));
int cnt = Integer.parseInt(request.getParameter("cnt"));

Connection conn = null;
PreparedStatement pstmt = null;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	String path="jdbc:mysql://localhost:3306/sampleData?";
	path += "useSSL=false&";
	path += "useUnicode=true&";
	path += "characterEncoding=UTF8&";
	path += "serverTimezon=Asia/Seoul&";
	path += "allowPublicKeyRetrieval=true";
	String user = "root";
	String pwd = "1234";
	conn = DriverManager.getConnection(path, user, pwd);
	
	// out.print("Connection OK!!");
	
	String sql = "insert into goodsList (goodsCode, goodsName, price, cnt) ";
	sql += "values (?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, goodsCode);
	pstmt.setString(2, goodsName);
	pstmt.setInt(3, price);
	pstmt.setInt(4, cnt);
	int rtnCnt = pstmt.executeUpdate();
	
	String resTxt = "";
	if (rtnCnt == 1) {
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
<%

} catch (ClassNotFoundException e) {
	out.print(e.getMessage());
} catch (SQLException e) {
	out.print(e.getMessage());
} finally {
	
	try { if(conn != null) conn.close(); } catch(Exception e) { }
	
}
%>    
%>    
    

		
  