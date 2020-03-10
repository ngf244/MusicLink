package payment.model.service;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import member.model.vo.Member;
import payment.model.dao.PaymentDAO;
import payment.model.vo.PayMent;

public class PaymentService {


	public int insertPayment(PayMent payment) {
		Connection conn = getConnection();
		PaymentDAO pmDAO = new PaymentDAO();
		
		int result = pmDAO.insertPayment(conn, payment);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
 
	public PayMent selectPayment(Member loginUser) {
		Connection conn = getConnection();
		PaymentDAO pmDAO = new PaymentDAO();
		PayMent pm = pmDAO.selectPayment(conn, loginUser);
		System.out.println("여긴 제대로 들어갑니까?젠장할ㅁㄴ엄ㄴ-ㅇ머ㅐㅔㅇ"+pm);
		return pm;
	}

	
	
}
