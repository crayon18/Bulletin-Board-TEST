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
	    ResultSet rs; //데이터 베이스의 테이블의 결과를 리턴 받아 자바에 저장해 주는 객체
	    Connection conn;//데이터베이스에 접근할수 있도록 설정 
	    PreparedStatement pstmt;//데이터 베이스에서 쿼리를 실행시켜주는 객체 

	 public void getcon() {
		//커넥션풀을 이용하여 데이터 베이스에 접근
			try {
				//외부에서 데이터를 읽어드려야 하기에
				Context initctx = new InitialContext();
				//톰켓 서버에 정보를 담아 놓은 곳으로 이동
				Context envctx = (Context) initctx.lookup("java:comp/env");
				//데이터 소스 객체를 선언
				DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
				//데이터 소스를 기준으로 커넥션을 연결해주시오
				conn = ds.getConnection();
				
			} catch (Exception e) {
				
			}
	 }
	 
	 
	//하나의 새로운 게시글이 넘어와서 저장되는 메소드
	public void insertBoard(BoardBean bean){
		getcon();
		//빈 클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		int ref = 0;// 글 그룹을 의미 = 쿼리를 실행시켜 가장큰 ref 값을 가져온후 +1을 더해주면 된다 
		int re_stop = 1;//새글이기에 = 부모 글이기에
		int re_level = 1;
		try {
			//가장큰 ref값을 읽어오는 쿼리 준비 
			String refSQL = "SELECT max(ref) FROM BOARD";
			//쿼리실행 객체 
			pstmt = conn.prepareStatement(refSQL);
			//쿼리를 실행후 결과를 리턴
			 rs = pstmt.executeQuery();	
			if(rs.next()){//결과 값이 있다면
				ref = rs.getInt(1)+1;//최대 값에 +1을 더해서 글 그룹을 설정	
			}
			//실제로 게시글 전체값을 테이블에 저장 
			String SQL = "INSERT INTO BOARD VALUES(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = conn.prepareStatement(SQL);
			//?의 값을 맵핑
			pstmt.setString(1, bean.getWrite());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_stop);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());		
			//쿼리를 실행하시오
			pstmt.executeUpdate();	
			//자원 반납
			conn.close();
			}catch(Exception e) {
				e.printStackTrace();	
			}	
 }
	
	//모든 게시글을 리턴해주는 메소드 작성
	public Vector<BoardBean> getAllBoard(){
		
		//리턴할 객체 선언
		Vector<BoardBean> v = new Vector();
		getcon();
		
		try {
			//쿼리 준비
			String SQL = "select * from board order by ref desc , re_stop asc";
			//쿼리 실행 객체 선언
			pstmt = conn.prepareStatement(SQL);
			//쿼리 실행후 결과 저장
			rs = pstmt.executeQuery();
			//데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출
			while(rs.next()) {
				//데이터를 패키징(가방 = boardbean클래스를 이용해서)해줌
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
				//패키징할 데이터를 백터에 저장
				v.add(bean);
			}
			conn.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//하나의 게시글을 리턴하는 메소드
	public BoardBean getOneBoard(int num) {
		
		//리턴 타입 선언
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