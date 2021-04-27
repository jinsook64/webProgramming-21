<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//연결 정보와 SQL
	String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
	String user = "JINSOOK";
	String passwd = "1111";

	//1. DB 연동 드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//2. 연결 객체 생성
	Connection con = DriverManager.getConnection(url, user, passwd);

	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
	String sql = "SELECT * FROM LOGIN";
	Statement st = con.createStatement();
	
	//4. SQL 실행
	ResultSet rs = st.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<br>
	<h1 class="text-center font-weight-bold">로그인 정보</h1>
	<br>
	<table class="table table-hover">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>비밀번호</th>
		</tr>
<% 
	//5. 결과집합 처리 
	while (rs.next()){
		String id = rs.getString("ID");
		String name = rs.getString("NAME");
		String pwd = rs.getString("PWD");
%>	
		<tr>
			<td><a href="updateForm.jsp?id=<%=id %>"><%=id %></td>
			<td><%=name %></td>
			<td><%=pwd %></td>
		</tr>
<%} 
	//6. 연결 해제
	con.close();
	st.close();
	rs.close();
%>
	</table>
	</div>	
</body>
</html>