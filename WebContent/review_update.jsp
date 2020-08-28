<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;

	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String uid = "kosea";
	String pass = "kosea2019a";

	String sql = "insert into review values ( ?, ?, ?, ?, ?)";
	String sql2 = "select max(R_Num) from review";

	int max = 0;%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, uid, pass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql2);
		while (rs.next()) {
			max = rs.getInt("max(R_Num)") + 1;
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null)
		rs.close();
			if (stmt != null)
		stmt.close();
			if (conn != null)
		conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	int R_Num = max;
	String AH_Num = "A001";
	String RE = request.getParameter("RE");
	String ID = request.getParameter("ID");
	String PW = request.getParameter("PW");

	out.println(R_Num);
	out.println(AH_Num);
	out.println(RE);
	out.println(ID);
	out.println(PW);

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, uid, pass);
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, R_Num);
		pstmt.setString(2, AH_Num);
		pstmt.setString(3, RE);
		pstmt.setString(4, ID);
		pstmt.setString(5, PW);
		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null)
		pstmt.close();
			if (conn != null)
		conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	response.sendRedirect("review.jsp");
	%>

</body>
</html>