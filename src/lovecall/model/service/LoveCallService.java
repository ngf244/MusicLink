package lovecall.model.service;

import static common.JDBCTemplate.getConnection;

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

}
