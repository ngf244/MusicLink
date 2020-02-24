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

import com.sun.org.apache.regexp.internal.REProgram;

import authorPage.model.vo.Follow;
import authorPage.model.vo.ReportPage;
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
				mem.setUserCode(rset.getString("USER_CODE"));
				mem.setUserName(rset.getString("USER_NAME"));
				mem.setUserPhone(rset.getString("USER_PHONE"));
				mem.setUserClass(rset.getString("USER_CLASS"));
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

	public ArrayList<Follow> selectFollow(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Follow f = null;
		ArrayList<Follow> fArr = new ArrayList<Follow>();
		
		String query = prop.getProperty("selectFollow");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				f = new Follow();
				f.setAtCode(rset.getString("AT_CODE"));
				f.setFollowingDate(rset.getDate("FOLLOWING_TIME"));
				f.setAtName(rset.getString("USER_NAME"));
				fArr.add(f);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return fArr;
	}

	public ArrayList<ReportPage> getReportList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ReportPage r = null;
		ArrayList<ReportPage> rArr = new ArrayList<ReportPage>();
		
		String query = prop.getProperty("getReportList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				r = new ReportPage();
				r.setReportNum(rset.getInt("REPORT_NUM"));
				r.setReporterId(rset.getString("REPORTER_ID"));
				r.setReportedId(rset.getString("USER_ID"));
				r.setReportReason(rset.getString("REPORT_EX"));
				r.setReportCategory(rset.getString("REPORT_CLASS"));
				r.setReportedUserCode(rset.getString("USER_CODE"));
				r.setReportDate(rset.getDate("REPORT_TIME"));
				rArr.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rArr;
	}
	

}
