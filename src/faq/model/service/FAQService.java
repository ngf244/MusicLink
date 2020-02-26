package faq.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import faq.model.dao.FAQDAO;
import faq.model.vo.FAQ;

public class FAQService {

	public int insertFAQ(FAQ faq) {
		Connection conn = getConnection();
		int result = new FAQDAO().insertFAQ(conn, faq);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
	
		close(conn);
		
		return result;
	}

	public ArrayList<FAQ> selectList() {
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDAO().selectList(conn); 
		
		close(conn);
		return list;
	}

	public int deleteFAQ(String faqCode) {
		Connection conn = getConnection();
		int result = new FAQDAO().deleteFAQ(conn, faqCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int updateFAQ(FAQ faq) {
		Connection conn = getConnection();
		int result = new FAQDAO().updateFAQ(conn, faq);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

}
