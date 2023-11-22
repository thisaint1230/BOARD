<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.example.DAO.BoardDAO, com.example.bean.BoardVO"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
	<script>
		function getDate() {
			const now = new Date();
			return document.getElementById('editdate').value=now.toISOString().slice(0,10);
		}
	</script>
</head>
<body>

<%
	BoardDAO boardDAO = new BoardDAO();
	String id=request.getParameter("id");	
	BoardVO u=boardDAO.getBoard(Integer.parseInt(id));
%>

<h1>Edit Form</h1>
<form action="editpost.jsp" method="post" onsubmit="getDate()">
<input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
<input type="hidden" name="editdate" id="editdate">
<table>
<tr><td>Title:</td><td><input type="text" name="title" value="<%= u.getTitle()%>"/></td></tr>
<tr><td>Writer:</td><td><input type="text" name="writer" value="<%= u.getWriter()%>" /></td></tr>
<tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"><%= u.getContent()%></textarea></td></tr>
	<tr>
		<td>Category:</td>
		<td>
			<label>
				<select name="category">
					<option value="자유" <%= u.getCategory().equals("자유") ? "selected" : "" %>>자유</option>
					<option value="질문" <%= u.getCategory().equals("질문") ? "selected" : "" %>>질문</option>
					<option value="답변" <%= u.getCategory().equals("답변") ? "selected" : "" %>>답변</option>
					<option value="공지" <%= u.getCategory().equals("공지") ? "selected" : "" %>>공지</option>
					<option value="기타" <%= u.getCategory().equals("기타") ? "selected" : "" %>>기타</option>
				</select>
			</label>
		</td>
	</tr>
<tr><td colspan="2"><input type="submit" value="Edit Post"/>
<input type="button" value="Cancel" onclick="history.back()"/></td></tr>
</table>
</form>

</body>
</html>