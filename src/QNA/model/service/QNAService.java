package QNA.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import QNA.model.dao.QNADAO;
import QNA.model.vo.QnA;

public class QNAService {

	public int getListCount() {
		Connection conn = getConnection();
		int result = new QNADAO().getListCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<QnA> selectList(int currentPage) {
		Connection conn = getConnection();
		ArrayList<QnA> list = new QNADAO().selectList(conn, currentPage);
		close(conn);
		return list;
	}

	public int insertQnA(QnA qna, String userId) {
		Connection conn = getConnection();
		QNADAO dao = new QNADAO();
		
		int result = dao.insertQnA(conn, qna, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		System.out.println("service"+result);
		return result;
	}

	public QnA selectQnA(String qnaCode) {
		Connection conn = getConnection();
		QNADAO dao = new QNADAO();
		
		QnA qna = null;
		qna = dao.selectQnA(conn, qnaCode);
		
		if(qna != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return qna;
	}

	public int deleteQnA(String qnaCode) {
		Connection conn = getConnection();
		int result = new QNADAO().deleteQnA(conn, qnaCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int updateQnA(QnA qna) {
		Connection conn = getConnection();
		int result = new QNADAO().updateQnA(conn, qna);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	

}
