package community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

 
public class CommunityDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public CommunityDAO() {
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "MUSICLINK";
			String password = "MUSICLINK";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL = "SELECT CM_CODE FROM ML_COMMU ORDER BY CM_CODE DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int ArtistBoardWrite(String cmTitle, String cmContent, String userCode) {
		String SQL = "INSERT INTO ML_COMMU VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, cmTitle);
			pstmt.setString(3, getDate());
			pstmt.setString(4, cmContent);
			pstmt.setInt(5, 1);
			pstmt.setString(6, userCode);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Community> getList(int pageNumber){
		String SQL = "SELECT FROM ML_COMMU WHERE CM_CODE < ? AND CM_STATUS = 1 ORDER BY CM_CODE DESC LIMIT 10";
		ArrayList<Community> list = new ArrayList<Community>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Community community = new Community();
				community.setCmCode(rs.getInt(1));
				community.setCmTitle(rs.getString(2));
				community.setCmDate(rs.getString(3));
				community.setCmContent(rs.getString(4));
				community.setCmStatus(rs.getInt(5));
				community.setUserCode(rs.getString(6));
				list.add(community);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT FROM ML_COMMU WHERE CM_CODE < ? AND CM_STATUS = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	public Community getCommunity(int cmCode) {
		String SQL = "SELECT FROM ML_COMMU WHERE CM_CODE = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmCode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Community community = new Community();
				community.setCmCode(rs.getInt(1));
				community.setCmTitle(rs.getString(2));
				community.setCmDate(rs.getString(3));
				community.setCmContent(rs.getString(4));
				community.setCmStatus(rs.getInt(5));
				community.setUserCode(rs.getString(6));
				return community;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	public int cmupdate(int cmCode, String cmTitle, String cmContent) {
		String SQL = "UPDATE ML_COMMU SET CM_TITLE = ? , CM_CONTENT = ? WHERE CM_CODE = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, cmTitle);
			pstmt.setString(2, cmContent);
			pstmt.setInt(3, cmCode);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int cmdelete(int cmCode) {
		String SQL = "UPDATE ML_COMMU SET CM_STATUS = 0 WHERE CM_CODE = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmCode);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
