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
	<!-- �����͸� �ѹ��� �޾ƿ��� �� Ŭ������ ��� �ϵ��� -->
	<jsp:useBean id="boardbean" class="Model.BoardBean">
		<jsp:setProperty name="boardbean" property="*"/>
	</jsp:useBean>
		
		
	<%
	
		//������ ���̽� ��ü ����
		BoardDAO bdao = new BoardDAO();
		bdao.reWriteBoard(boardbean);
		
		//�亯 �����͸� ��� ������ ��ü �Խñ� ���⸦ ����
		response.sendRedirect("BoardList.jsp");
	%>
		
</body>
</html>