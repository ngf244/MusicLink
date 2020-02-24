package notice.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import artist.model.vo.FollowArtist;
import notice.model.vo.Notice;

public class NoticeDAO {
	private Properties prop = new Properties();
	
	public NoticeDAO() {
		String fileName = NoticeDAO.class.getResource("/sql/notice/notice-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getNoticeListCount(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getNoticeListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return result;
	}
	
	public ArrayList<Notice> selectNoticeList(Connection conn, String userCode, int currentPage) {
		PreparedStatement pstmt = null;
		ArrayList<Notice> list = null;
		ResultSet rset = null;
		int notices = 10; // 한 페이지에 보여질 게시글 개수
		
		int startRow = (currentPage - 1) * notices + 1;
		int endRow = startRow + notices - 1;
		
		String query = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, userCode);
			rset = pstmt.executeQuery();
			list = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice(rset.getString("NOTICE_CODE"),
									  rset.getString("USER_CODE"),
									  rset.getString("NOTICE_CLASS"),
									  rset.getString("NOTICE_CONTENTS"),
									  rset.getDate("NOTICE_TIME"));
				list.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


}
