package payment.model.service;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import payment.model.dao.PaymentDAO;
import payment.model.vo.PayMent;

public class PaymentService {

	public PayMent UpdatePayment() {
		Connection conn = getConnection();
		PaymentDAO pmDAO = new PaymentDAO();
		
		
		
		
		return null;
	}

	public PayMent selectPayment(String userCode) {
		Connection conn = getConnection();
		PaymentDAO pmDAO = new PaymentDAO();
		
		int result = pmDAO.selectPayment(conn, userCode);
		
		return result;
	}
	
}
