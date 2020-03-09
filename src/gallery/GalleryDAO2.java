package gallery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class GalleryDAO2 {
	
	private Connection conn;
	private ResultSet rs; 
	
	public GalleryDAO2() {
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
		String SQL = "SELECT GL_CODE FROM ML_GALLERY ORDER BY GL_CODE DESC";
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
	
	public int ArtistGalleryWrite(String glTitle, String glContent, String userCode) {
		String SQL = "INSERT INTO ML_COMMU VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, glTitle);
			pstmt.setString(3, getDate());
			pstmt.setString(4, glContent);
			pstmt.setInt(5, 1);
			pstmt.setString(6, userCode);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Gallery2> getList(int pageNumber){
		String SQL = "SELECT FROM ML_GALLERY WHERE GL_CODE < ? AND GL_STATUS = 1 ORDER BY GL_CODE DESC LIMIT 10";
		ArrayList<Gallery2> list = new ArrayList<Gallery2>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Gallery2 gallery = new Gallery2();
				gallery.setGlCode(rs.getInt(1));
				gallery.setGlTitle(rs.getString(2));
				gallery.setGlDate(rs.getString(3));
				gallery.setGlContent(rs.getString(4));
				gallery.setGlStatus(rs.getInt(5));
				gallery.setUserCode(rs.getString(6));
				list.add(gallery);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT FROM ML_GALLERY WHERE GL_CODE < ? AND GL_STATUS = 1";
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
	
	public Gallery2 getGallery(int glCode) {
		String SQL = "SELECT FROM ML_GALLERY WHERE GL_CODE = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, glCode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Gallery2 gallery = new Gallery2();
				gallery.setGlCode(rs.getInt(1));
				gallery.setGlTitle(rs.getString(2));
				gallery.setGlDate(rs.getString(3));
				gallery.setGlContent(rs.getString(4));
				gallery.setGlStatus(rs.getInt(5));
				gallery.setUserCode(rs.getString(6));
				return gallery;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	public int glupdate(int glCode, String glTitle, String glContent) {
		String SQL = "UPDATE ML_GALLERY SET GL_TITLE = ? , GL_CONTENT = ? WHERE GL_CODE = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, glTitle);
			pstmt.setString(2, glContent);
			pstmt.setInt(3, glCode);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int gldelete(int glCode) {
		String SQL = "UPDATE ML_GALLERY SET GL_STATUS = 0 WHERE GL_CODE = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, glCode);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
