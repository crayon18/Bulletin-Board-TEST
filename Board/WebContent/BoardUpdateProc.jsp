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
		request.setCharacterEncoding("UTF-8");
	%>
	
	<!--�����͸� �ѹ��� �޾ƿ��� ��Ŭ������ ����ϵ���  -->
	<jsp:useBean id = "boardbean" class= "Model.BoardBean">
		<jsp:setProperty name="boardbean" property = "*" />
	</jsp:useBean>
	
	<% 
		//������ ���̽��� ���� 
		BoardDAO bdao = new BoardDAO();
		
		//�ش� �Խñ��� �н����� ���� ����
		String pass = bdao.getPass(boardbean.getNum());
		
		//���� �н����� ���� update�� �ۼ��ߴ� pass���� ������ �� 
		if(pass.equals(boardbean.getPassword())){
			//������ �����ϴ� �޼ҵ� ȣ��
			bdao.updateBoard(boardbean);
			//������ �Ϸ�Ǹ� ��ü �Խñ� ���� 
			response.sendRedirect("BoardList.jsp");
		}else{//�н����尡 Ʋ���ٸ� 
	%>			
		<script type="text/javascript">	
			alert("�н����尡 ��ġ���� �ʽ��ϴ�. �ٽ� Ȯ���� ������ �ּ��� ");
			history.go(-1);
		</script>
	<% 		
		}
	%>
	
</body>
</html>