package artist.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import artist.model.vo.Artist;

public class ArtistDAO {

	private Properties prop = new Properties();
	
	public ArtistDAO() {
		String fileName = ArtistDAO.class.getResource("/sql/artist/artist-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insertArtist(Connection conn, Artist artist) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertArtist");
		  
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, artist.getAtCode());
			pstmt.setString(2, artist.getAtName());
			pstmt.setInt(3, artist.getAtMember());
			pstmt.setString(4, artist.getAtGenre());
			pstmt.setString(5, artist.getAtClass());
			pstmt.setString(6, artist.getAtPicPath());
			pstmt.setString(7, artist.getAtVideoPath());
			pstmt.setString(8, artist.getAtOneLine());
			pstmt.setString(9, artist.getAtIntro());
			pstmt.setString(10, artist.getAtRecode());
			pstmt.setDate(11, artist.getAtDebutDate());
			pstmt.setString(12, artist.getAtInsta());
			pstmt.setString(13, artist.getAtTwitter());
			pstmt.setString(14, artist.getAtFacebook());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public Artist selectArtist(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Artist artist = null;
		
		String query = prop.getProperty("selectArtist");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				artist = new Artist(userCode,
								    rset.getString("AT_NAME"),
								    rset.getInt("AT_MEMBER"),
								    rset.getString("AT_GENRE"),
								    rset.getString("AT_CLASS"),
								    rset.getString("PROFILE_PIC_PATH"),
								    rset.getString("AT_VIDEO"),
								    rset.getString("AT_ONELINE"),
								    rset.getString("AT_INTRO"),
								    rset.getString("AT_RECORD"),
								    rset.getDate("AT_DEBUT"),
								    rset.getInt("AT_GRADE"),
								    rset.getString("AT_INSTA"),
								    rset.getString("AT_TWITTER"),
								    rset.getString("AT_FACEBOOK"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return artist;
	}

}
