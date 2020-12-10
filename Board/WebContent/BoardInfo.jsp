<%@ page import =  "Model.BoardDAO"%>
<%@ page import =  "Model.BoardBean"%>
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
	int num = Integer.parseInt(request.getParameter("num").trim());//공백 제거후 정수형으로 바꿔주는 소스

	//데이터 베이스 접근
	BoardDAO bdao = new BoardDAO();
	//BoardBean타입 으로 하나의 개시글을 리턴 받는다
	BoardBean bean = bdao.getOneBoard(num);
%>

</body>
</html>