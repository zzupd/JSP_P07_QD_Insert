package pkg.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConn {

	private Connection conn;
	private PreparedStatement pstmt;

	// DB접속 메서드
	public void mtdDBConn() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String path = "jdbc:mysql://localhost:3306/sampleData?";
			path += "useSSL=false&";
			path += "useUnicode=true&";
			path += "characterEncoding=UTF8&";
			path += "serverTimezon=Asia/Seoul&";
			path += "allowPublicKeyRetrieval=true&";
			path += "autoReconnect=true";
			String user = "root";
			String pwd = "1234";
			conn = DriverManager.getConnection(path, user, pwd);

			System.out.println("접속 OK!!");

		} catch (ClassNotFoundException e) {
			System.out.print(e.getMessage());
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}

	}

	// Data 입력 메서드
	public boolean mtdInsert(DataBean dataBean) {

		boolean chk = false;

		try {
			String sql = "insert into goodsList (goodsCode, goodsName, price, cnt) ";
			sql += "values (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dataBean.getGoodsCode());
			pstmt.setString(2, dataBean.getGoodsName());
			pstmt.setInt(3, dataBean.getPrice());
			pstmt.setInt(4, dataBean.getCnt());
			int rtnCnt = pstmt.executeUpdate();

			String resTxt = "";
			if (rtnCnt == 1) {
				chk = true;
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			
			// Scanner 객체의 소멸처럼 Connection 객체도 소멸할 수 있음.
			// 단, DB 접속구문에 autoReconnect=true 설정을 추가해야 함.
			System.out.println("conn 객체 소멸");
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println("Connection Close Err : " + e.getMessage());
			}
		}

		return chk;
	}

}
