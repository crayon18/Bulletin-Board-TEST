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
		int num = Integer.parseInt(request.getParameter("num"));//���� ������ ���������� �ٲ�
		
		//������ ���̽� ����
		BoardDAO bdao = new BoardDAO();
		
		//boardbeanŸ������ �ϳ��� �Խñ��� ����
		BoardBean bean  = bdao.getOneBoard(num);
	%>

<center>
	<h2>�Խñ� ����</h2>
	<table width="600" border="1" bgcolor="skyblue">
		<tr height="40">
			<td align="center" width="120">�۹�ȣ</td>
			<td align="center" width="180"><%=bean.getNum() %></td>
			<td align="center" width="120">��ȸ��</td>
			<td align="center" width="180"><%=bean.getReadcount() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120">�ۼ���</td>
			<td align="center" width="180"><%=bean.getWrite() %></td>
			<td align="center" width="120">�ۼ���</td>
			<td align="center" width="180"><%=bean.getReg_date() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120">�̸���</td>
			<td align="center" colspan="3"><%=bean.getEmail()%></td>
		</tr>
			<tr height="40">
			<td align="center" width="120">����</td>
			<td align="center" colspan="3"><%=bean.getSubject()%></td>
		</tr>
			<tr height="40">
			<td align="center" width="120">�۳���</td>
			<td align="center" colspan="3"><%=bean.getContent()%></td>
		</tr>
			<tr height="40">
			<td align="center" colspan="4">
			<input type="button" value="��۾���" 
			onclick="location.href='BoardReWriteForm.jsp?num=<%=bean.getNum()%>&ref=<%=bean.getRef() %>&re_stop=<%=bean.getRe_stop()%>&re_level=<%=bean.getRe_level()%>'">
			<input type="button" value="�����ϱ�" onclick="location.href='BoardUpdateForm.jsp?num=<%=bean.getNum() %>'">
			<input type="button" value="�����ϱ�" onclick="location.href='BoardDeleteForm.jsp?num=<%=bean.getNum() %>'">
			<input type="button" value="��Ϻ���" onclick="location.href='BoardList.jsp?num=<%=bean.getNum() %>'">
			</td>
		</tr>
	</table>
</center>
	
</body>
</html>