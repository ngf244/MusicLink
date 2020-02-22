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

}
