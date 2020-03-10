package payment.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;
import payment.model.vo.PayMent;

public class PaymentDAO {
	
	private Properties prop = new Properties();
	
	public PaymentDAO() {
		String fileName = PaymentDAO.class.getResource("/sql/payment/payment-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int insertPayment(Connection conn, PayMent payment) {
		PreparedStatement pstmt = null;
		int result = 0;
		String kko = "KAKAO";
		String query = prop.getProperty("insertPayment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, kko);
			pstmt.setInt(2, payment.getPayAmount());
			pstmt.setString(3, payment.getUserCode());
			
			result = pstmt.executeUpdate();
			
			System.out.println("query어떻게 넘어오냐"+query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	public PayMent selectPayment(Connection conn, Member loginUser) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PayMent pm = null;
		String query = prop.getProperty("selectPayment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUser.getUserCode());
			System.out.println("쉣 로그인찍혀라"+loginUser.getUserCode());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pm = new PayMent(rs.getInt("PAY_SUM"));
			}
			
			System.out.println("금액이 나와야합니다 제발"+pm);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("야이 젠장 마지막 DAO나와라ㅣ 얍"+pm);
		return pm;
	}
	
	
}
