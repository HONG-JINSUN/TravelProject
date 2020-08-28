<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String uid = "kosea";
String pass = "kosea2019a";
String sql = "select * from review where AH_Num = 'A001'";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="f.js"></script> -->
</head>
<body>
	<table>
		<%
			try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, uid, pass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString("ID") + "</td>");
				out.println("<td>" + rs.getString("RE") + "</td>");
				out.println("</tr>");
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
		%>
	</table>
	<p>
	<p>
	<form action="review_update.jsp" method="post" name="re">
		리뷰 내용 : <input type="text" size="50" name="RE">
		<p>
			작성자 : <input type="text" size="10" name="ID"> 비밀번호 : <input
				type="password" size="10" name="PW"> <input type="submit"
				value="등록" onclick=""> <input type="reset" value="취소">
	</form>
</body>
</html>