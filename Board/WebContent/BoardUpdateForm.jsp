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
	
	<center>
	<h2>�Խñۼ���</h2>
	<%
		//�ش� �Խñ۹�ȣ�� ���Ͽ� �Խñ��� ����
		int num = Integer.parseInt(request.getParameter("num").trim());
	
		//�ϳ��� �Խñ��� ���� ������ ����
		BoardDAO bdao = new BoardDAO();
		BoardBean bean = bdao.getOneUpdateBoard(num);
	%>
	<form action="BoardUpdateProc.jsp" method="post">
	<table width="600" border="1" bgcolor="skyblue">
		<tr height="40">
			<td width="120" align="center">�ۼ���</td>
			<td width="180" align="center"><%=bean.getWrite() %></td>
			<td width="120" align="center">�ۼ���</td>
			<td width="180" align="center"><%=bean.getReg_date() %></td>
		</tr>
		<tr height="40">
			<td width="120" align="center">����</td>
			<td width="480" colspan="3"> &nbsp; <input type="text" name="subject" value="<%= bean.getSubject() %>" size="60"></td>
		</tr>
		<tr height="40">
			<td width="120" align="center">�н�����</td>
			<td width="480" colspan="3"> &nbsp; <input type="password" name="password" size="60"></td>
		</tr>
		<tr height="40">
			<td width="120" align="center">�۳���</td>
			<td width="480" colspan="3"> &nbsp; <textarea rows="10" cols="60" name="content"><%=bean.getContent() %></textarea></td>
		</tr>
		<tr height="40">
			<td colspan="4" align="center">
			<input type="hidden" name="num" value="<%=bean.getNum() %>">
			<input type="submit" value="�ۼ���">&nbsp;&nbsp;
			<input type="button" onclick="location.href='BoardList.jsp'" value="��ü�ۺ���">
			</td>
		</tr>
	</table>
	</form>
	</center>

</body>
</html>