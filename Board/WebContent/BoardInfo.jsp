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
	int num = Integer.parseInt(request.getParameter("num").trim());//���� ������ ���������� �ٲ��ִ� �ҽ�

	//������ ���̽� ����
	BoardDAO bdao = new BoardDAO();
	//BoardBeanŸ�� ���� �ϳ��� ���ñ��� ���� �޴´�
	BoardBean bean = bdao.getOneBoard(num);
%>

</body>
</html>