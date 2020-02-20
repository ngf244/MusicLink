package authorPage.model.dao;
import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import member.model.vo.Member;



public class AuthorDAO {
	
	private Properties prop = new Properties();
	
	public AuthorDAO() {
		String fileName = AuthorDAO.class.getResource("/sql/author/author-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<Member> selectMember(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> memArr = new ArrayList<Member>();
		
		String query = prop.getProperty("selectMember");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Member mem = new Member();
				mem.setUserCode(rset.getString("user_code"));
				mem.setUserId(rset.getString("user_id"));
				mem.setUserName(rset.getString("user_name"));
				mem.setUserClass(rset.getString("user_class"));
				memArr.add(mem);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return memArr;
	}

	public int checkUserClass(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("checkUserClass");
		
		try {
			pstmt =conn.prepareStatement(query);
			
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = Integer.parseInt(rset.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public Member selectUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member mem = null;
		
		String query = prop.getProperty("selectUser");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mem = new Member();
				mem.setUserName(rset.getString("USER_NAME"));
				mem.setUserPhone(rset.getString("USER_PHONE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mem;
	}

	public String getPicture(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String path = null;
		String query = prop.getProperty("getPicuture");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				path = rset.getString("PROFILE_PIC_PATH");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return path;
	}
	

}
