package payment.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import payment.model.vo.PayMent;

public class PaymentDAO {
	
	private Properties prop = new Properties();
	
	public int selectPayment(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PayMent pm = null;
		
		String query = prop.getProperty("selectpayment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			pm = new PayMent(rs.getString("pay_code"),
							 rs.getString("pay_way"),
							 rs.getInt("pay_amount"),
							 rs.getDate("pay_day"),
							 rs.getString("user_code"));
			
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		
		return result;
	}

}
