package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//������ ���̽� �� Ŀ�ؼ�Ǯ�� ����ϵ��� ���� �ϴ� �޼ҵ�
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context)initctx.lookup("java:comp/env"); //�ڹ��� ȯ�濡�� �о���ÿ�
			DataSource ds = (DataSource)envctx.lookup("jdbc/pool");
			//datasource
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
