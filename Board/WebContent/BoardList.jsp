<%@page import="java.util.Vector"%>
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
		//��ü �Խñ��� ������ jsp������ ���� �;��Ѵ�
		BoardDAO bdao = new BoardDAO();
	
		//��ü �Խñ��� ���� �޾��ִ� �ҽ�
		Vector<BoardBean> vec = bdao.getAllBoard();
		
	%>

	<center>
	<h2>��ü�Խñ� ����</h2>
	<table width="700" border="1" bgcolor="skyblue">
		<tr height="40">
			<td width="50" align="center">��ȣ</td>
			<td width="300" align="center">����</td>
			<td width="100" align="center">�ۼ���</td>
			<td width="150" align="center">�ۼ���</td>
			<td width="100" align="center">��ȸ��</td>
		</tr>
	<%
	
	for(int i = 0; i <vec.size(); i++){
		BoardBean bean = vec.get(i); //���Ϳ� ����Ǿ��ִ� ��Ŭ������ �ϳ��� ����
		
	%>
			<tr height="40">
			<td width="50" align="center"><%=i+1 %></td>
			<td width="300" align="left"><a href="BoardInfo.jsp?num=<%=bean.getNum()%>">
			<%=bean.getSubject() %></a></td>
			<td width="100" align="center"><%=bean.getWrite() %></td>
			<td width="150" align="center"><%=bean.getReg_date() %></td>
			<td width="100" align="center"><%=bean.getReadcount() %></td>
			</tr>
	<%}%>
	
	<tr height="40">
	<td align="center" colspan="5">
	<input type="button" value="�۾���" onclick="location.href='BoardWriteForm.jsp'">
	</td>
	</tr>
	</table>
	</center>

</body>
</html>