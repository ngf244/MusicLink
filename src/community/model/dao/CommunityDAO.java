package community.model.dao;

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

import community.model.vo.Community;

public class CommunityDAO {

	private Properties prop = new Properties();
	
	public CommunityDAO() {
		String fileName = CommunityDAO.class.getResource("/sql/community/community-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getMyCOMMListCount(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getMyCOMMListCount");
		
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

	public ArrayList<Community> selectMyCOMMList(Connection conn, int currentPagecomm, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Community> cList = null;
		int posts = 10; // 한 페이지에 보여질 게시글 개수
		
		int startRow = (currentPagecomm - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		String query = prop.getProperty("selectMyCOMMList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, userCode);
			rset = pstmt.executeQuery();
			
			cList = new ArrayList<Community>();
			
			while(rset.next()) {
				Community c = new Community(rset.getString("CM_CODE"),
											rset.getString("CM_TITLE"),
											rset.getString("CM_CONTENT"),
											rset.getDate("CM_DATE"),
											rset.getInt("CM_READCNT"),
											rset.getString("CM_STATUS"),
											rset.getString("USER_CODE"));
				cList.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cList;
	}

}
