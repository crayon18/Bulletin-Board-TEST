package Model;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDAO{
	    ResultSet rs; //������ ���̽��� ���̺��� ����� ���� �޾� �ڹٿ� ������ �ִ� ��ü
	    Connection conn;//�����ͺ��̽��� �����Ҽ� �ֵ��� ���� 
	    PreparedStatement pstmt;//������ ���̽����� ������ ��������ִ� ��ü 

	 public void getcon() {
		//Ŀ�ؼ�Ǯ�� �̿��Ͽ� ������ ���̽��� ����
			try {
				//�ܺο��� �����͸� �о����� �ϱ⿡
				Context initctx = new InitialContext();
				//���� ������ ������ ��� ���� ������ �̵�
				Context envctx = (Context) initctx.lookup("java:comp/env");
				//������ �ҽ� ��ü�� ����
				DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
				//������ �ҽ��� �������� Ŀ�ؼ��� �������ֽÿ�
				conn = ds.getConnection();
				
			} catch (Exception e) {
				
			}
	 }
	 
	 
	//�ϳ��� ���ο� �Խñ��� �Ѿ�ͼ� ����Ǵ� �޼ҵ�
	public void insertBoard(BoardBean bean){
		getcon();
		//�� Ŭ������ �Ѿ���� �ʾҴ� �����͵��� �ʱ�ȭ ���־�� �մϴ�.
		int ref = 0;// �� �׷��� �ǹ� = ������ ������� ����ū ref ���� �������� +1�� �����ָ� �ȴ� 
		int re_stop = 1;//�����̱⿡ = �θ� ���̱⿡
		int re_level = 1;
		try {
			//����ū ref���� �о���� ���� �غ� 
			String refSQL = "SELECT max(ref) FROM BOARD";
			//�������� ��ü 
			pstmt = conn.prepareStatement(refSQL);
			//������ ������ ����� ����
			 rs = pstmt.executeQuery();	
			if(rs.next()){//��� ���� �ִٸ�
				ref = rs.getInt(1)+1;//�ִ� ���� +1�� ���ؼ� �� �׷��� ����	
			}
			//������ �Խñ� ��ü���� ���̺� ���� 
			String SQL = "INSERT INTO BOARD VALUES(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = conn.prepareStatement(SQL);
			//?�� ���� ����
			pstmt.setString(1, bean.getWrite());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_stop);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());		
			//������ �����Ͻÿ�
			pstmt.executeUpdate();	
			//�ڿ� �ݳ�
			conn.close();
			}catch(Exception e) {
				e.printStackTrace();	
			}	
 }
	
	//��� �Խñ��� �������ִ� �޼ҵ� �ۼ�
	public Vector<BoardBean> getAllBoard(){
		
		//������ ��ü ����
		Vector<BoardBean> v = new Vector();
		getcon();
		
		try {
			//���� �غ�
			String SQL = "select * from board order by ref desc , re_stop asc";
			//���� ���� ��ü ����
			pstmt = conn.prepareStatement(SQL);
			//���� ������ ��� ����
			rs = pstmt.executeQuery();
			//������ ������ ����� �𸣱⿡ �ݺ����� �̿��Ͽ� �����͸� ����
			while(rs.next()) {
				//�����͸� ��Ű¡(���� = boardbeanŬ������ �̿��ؼ�)����
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWrite(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_stop(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				//��Ű¡�� �����͸� ���Ϳ� ����
				v.add(bean);
			}
			conn.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//�ϳ��� �Խñ��� �����ϴ� �޼ҵ�
	public BoardBean getOneBoard(int num) {
		
		//���� Ÿ�� ����
		BoardBean bean = new BoardBean();
		getcon();
		
		try {
			String SQL = "select * from board where num=?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWrite(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_stop(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	
}