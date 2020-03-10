package notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;

public class NoticeService {

	public int getNoticeListCount(String userCode) {
		Connection conn = getConnection();
		int result = new NoticeDAO().getNoticeListCount(conn, userCode);
		close(conn);
		return result;
	}	
	
	public ArrayList<Notice> selectNoticeList(int currentPage, String userCode) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDAO().selectNoticeList(conn, userCode, currentPage);
		close(conn);
		return list;	
	}
	public ArrayList<Notice> selectNoticeListtwo(String userCode) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDAO().selectNoticeListtwo(conn, userCode);
		System.out.println("서비스단 리스트 2번째"+list);
		close(conn);
		return list;	
	}


	
}
