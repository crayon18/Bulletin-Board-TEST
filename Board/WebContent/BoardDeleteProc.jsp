<%@ page import = "Model.BoardDAO" %>
<%@ page import = "Model.BoardBean" %>
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
	String pass = request.getParameter("password");
	int num = Integer.parseInt(request.getParameter("num"));
	
	//������ ���̽� ����
	BoardDAO bdao = new BoardDAO();
	String password = bdao.getPass(num);
	
	//���� �н����� ���� delete form ���� �Է¹��� �н����带 ���Ѵ�
	if(pass.equals(password)){
		
		//�н����尡 �Ѵ� ���ٸ�
		bdao.deleteBoard(num);
		
		response.sendRedirect("BoardList.jsp");
		}else{
		%>
		<script>
			alert("�н����尡 �ٸ��ϴ� �ٽ� Ȯ�����ּ���")
			history.go(-1)
		</script>
<%
	}
%>

</body>
</html>