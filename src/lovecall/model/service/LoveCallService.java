package lovecall.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import lovecall.model.dao.LoveCallDAO;
import lovecall.model.vo.LoveCall;

public class LoveCallService {

	public ArrayList<LoveCall> selectLovecall(String userCode) {
		Connection conn = getConnection();
		ArrayList<LoveCall> list = null;
		
		LoveCallDAO dao = new LoveCallDAO();
		
		list = dao.selectLcList(conn, userCode);
		
		return list;
	}

	public int upDateYCall(LoveCall lvCall) {
		Connection conn = getConnection();
		
		int result = new LoveCallDAO().upDateYCall(conn, lvCall);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
