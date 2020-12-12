<%@ page import="Model.BoardDAO" %>
<%@ page import="Model.BoardBean" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<!-- 데이터를 한번에 받아오는 빈 클래스를 사용 하도록 -->
	<jsp:useBean id="boardbean" class="Model.BoardBean">
		<jsp:setProperty name="boardbean" property="*"/>
	</jsp:useBean>
		
		
	<%
	
		//데이터 베이스 객체 생성
		BoardDAO bdao = new BoardDAO();
		bdao.reWriteBoard(boardbean);
		
		//답변 데이터를 모두 저장후 전체 게시글 보기를 설정
		response.sendRedirect("BoardList.jsp");
	%>
		
</body>
</html>