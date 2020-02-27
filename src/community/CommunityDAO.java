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
	        String id = "MUSICLINK";
	        String pw = "MUSICLINK";
	        Class.forName("oracle.jdbc.driver.OracleDriver");
	        conn = DriverManager.getConnection(url, id, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		 String SQL = "SLECTE NOW()";
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 return rs.getString(1);
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		 String SQL = "SLECTE CM_CODE FROM CM_COMMU ORDER BY CM_CODE DESC";
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 return rs.getInt(1) + 1;
			 }
			 return 1;
		 } catch (Exception e) {
			 e.printStackTrace();
		}
		return -1;
	}
	
	public int ArtistBoardWrite (String USER_CODE, String CM_TITLE, String CM_CONTENT) {
		String SQL = "INSERT INTO ML_COMMU VALUES (?, ?, ?, ?, ?, ?)";
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext());
			 pstmt.setString(2, USER_CODE);
			 pstmt.setString(3, CM_TITLE);
			 pstmt.setString(4, getDate());
			 pstmt.setString(5, CM_CONTENT);
			 pstmt.setInt(6, 1);
			 return pstmt.executeUpdate();
		 } catch (Exception e) {
			 e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Community> getList(int pageNumber){
		 String SQL = "SLECTE * FROM CM_COMMU WHERE CM_CODE < ? AND CM_STATUS = 1 ORDER BY CM_CODE DESC LIMIT 10";
		 ArrayList<Community> list = new ArrayList<Community>();
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			 rs = pstmt.executeQuery();
			 while(rs.next()) {
				 Community community = new Community();
				 community.setCM_CODE(rs.getInt(1));
				 community.setUSER_CODE(rs.getString(2));
				 community.setCM_TITLE(rs.getString(3));
				 community.setCM_DATE(rs.getString(4));
				 community.setCM_CONTENT(rs.getString(5));
				 community.setCM_STATUS(rs.getInt(6));
				 list.add(community);
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		 String SQL = "SLECTE * FROM CM_COMMU WHERE CM_CODE < ? AND CM_STATUS = 1";
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
	
	public Community geCommunity(int CM_CODE) {
		String SQL = "SLECTE * FROM CM_COMMU WHERE CM_CODE = ?";
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, CM_CODE);
			 rs = pstmt.executeQuery();
			 if (rs.next()) {
				 Community community = new Community();
				 community.setCM_CODE(rs.getInt(1));
				 community.setUSER_CODE(rs.getString(2));
				 community.setCM_TITLE(rs.getString(3));
				 community.setCM_DATE(rs.getString(4));
				 community.setCM_CONTENT(rs.getString(5));
				 community.setCM_STATUS(rs.getInt(6));
				 return community;
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
		}
		return null;
	}
	
	public int update(int CM_CODE, String CM_TITLE, String CM_CONTENT) {
		String SQL = "UPDATE CM_COMMU SET CM_TITLE = ?, CM_CONTENT = ?, WHERE CM_CODE = ?";
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setString(1, CM_TITLE);
			 pstmt.setString(2, CM_CONTENT);
			 pstmt.setInt(3, CM_CODE);
			 return pstmt.executeUpdate();
		 } catch (Exception e) {
			 e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int CM_CODE) {
		String SQL = "UPDATE CM_COMMU SET CM_STATUS = 0 WHERE CM_CODE = ?";
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, CM_CODE);
			 return pstmt.executeUpdate();
		 } catch (Exception e) {
			 e.printStackTrace();
		}
		return -1;
	}
}
