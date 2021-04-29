<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"  %>
    
<%	request.setCharacterEncoding("utf-8");

	//연결 정보와 SQL
	String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
	String user = "JSP";
	String passwd = "1111";
	
	//1. DB 연동 드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//2. 연결 객체 생성
	Connection con = DriverManager.getConnection(url, user, passwd);

	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
	String sql = "DELETE FROM LOGIN WHERE ID=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("id"));
	
	//5. SQL 실행
	int i = pstmt.executeUpdate();
	
	//6. 객체 해제
	pstmt.close();
	con.close();
	%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%=i %>행이 삭제되었습니다.
</body>
</html>