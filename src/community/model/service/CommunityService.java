package community.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import community.model.dao.CommunityDAO;
import community.model.vo.Community;

public class CommunityService {

	public int getMyCOMMListCount(String userCode) {
		Connection conn = getConnection();
		CommunityDAO dao = new CommunityDAO();
		int result = dao.getMyCOMMListCount(conn, userCode);
		close(conn);
		return result;
	}

	public ArrayList<Community> selectMyCOMMList(int currentPagecomm, String userCode) {
		Connection conn = getConnection();
		CommunityDAO dao = new CommunityDAO();
		ArrayList<Community> list = dao.selectMyCOMMList(conn, currentPagecomm, userCode);
		close(conn);
		return list;
	}

}
