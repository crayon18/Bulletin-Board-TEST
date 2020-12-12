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
	
	//데이터 베이스 연결
	BoardDAO bdao = new BoardDAO();
	String password = bdao.getPass(num);
	
	//기존 패스워드 값과 delete form 에서 입력받은 패스워드를 비교한다
	if(pass.equals(password)){
		
		//패스워드가 둘다 같다면
		bdao.deleteBoard(num);
		
		response.sendRedirect("BoardList.jsp");
		}else{
		%>
		<script>
			alert("패스워드가 다릅니다 다시 확인해주세요")
			history.go(-1)
		</script>
<%
	}
%>

</body>
</html>