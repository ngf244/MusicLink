package gallery.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import artist.model.dao.ArtistDAO;
import gallery.model.vo.Gallery;

public class GalleryDAO {
	
	private Properties prop = new Properties();
	
	public GalleryDAO() {
		String fileName = ArtistDAO.class.getResource("/sql/gallery/gallery-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Gallery> selectMyGalleryList(Connection conn, int currentPage, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Gallery> gList = null;
		int Galleries = 10; // 한 페이지에 보여질 게시글 개수
		
		int startRow = (currentPage - 1) * Galleries + 1;
		int endRow = startRow + Galleries - 1;
		
		String query = prop.getProperty("selectMyGalleryList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, userCode);
			
			rset = pstmt.executeQuery();
			
			gList = new ArrayList<Gallery>();
			
			while(rset.next()) {
				Gallery g = new Gallery(rset.getString("GL_CODE"),
									    rset.getString("GL_TITLE"),
									    rset.getString("GL_CONTENT"),
									    rset.getDate("GL_DATE"),
									    rset.getString("GL_STATUS"),
									    rset.getString("USER_CODE"));
				gList.add(g);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return gList;
	}

	public int getMyPostListCount(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getMyPostListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			System.out.println("나의 갤러리게시물 갯수 : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Gallery> selectRecentMyGalList(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Gallery> gList = null;
		
		String query = prop.getProperty("selectRecentMyGalList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			rset = pstmt.executeQuery();
			
			gList = new ArrayList<Gallery>();
			
			while(rset.next()) {
				Gallery g = new Gallery(rset.getString("GL_CODE"),
									    rset.getString("GL_TITLE"),
									    rset.getString("GL_CONTENT"),
									    rset.getDate("GL_DATE"),
									    rset.getString("GL_STATUS"),
									    rset.getString("USER_CODE"));
				gList.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return gList;
	}

}
