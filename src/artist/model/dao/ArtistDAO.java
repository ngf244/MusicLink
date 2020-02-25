package artist.model.dao;

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
import java.util.LinkedHashMap;
import java.util.Properties;

import artist.model.vo.Artist;
import artist.model.vo.FollowArtist;
import festival.model.vo.Festival;

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
	public int upgradeArtist(Connection conn, Artist artist) {
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
			pstmt.setString(7, artist.getAtOneLine());
			pstmt.setString(8, artist.getAtIntro());
			pstmt.setString(9, artist.getAtRecode());
			pstmt.setDate(10, artist.getAtDebutDate());
			pstmt.setString(11, artist.getAtInsta());
			pstmt.setString(12, artist.getAtTwitter());
			pstmt.setString(13, artist.getAtFacebook());
			
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
	public int getFollowListCount(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getFollowListCount");
		
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
	public ArrayList<FollowArtist> selectFollowList(Connection conn, int currentPage, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<FollowArtist> list = null;
		int artists = 4; // 한 페이지에 보여질 게시글 개수
		
		int startRow = (currentPage - 1) * artists + 1;
		int endRow = startRow + artists - 1;		
		
		String query = prop.getProperty("selectFollowList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, userCode);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<FollowArtist>();
			
			while(rset.next()) {
				FollowArtist fa = new FollowArtist(rset.getString("USER_CODE"),
												   rset.getString("AT_CODE"),
									  			   rset.getString("AT_NAME"),
									  			   rset.getString("AT_GENRE"),
									  			   rset.getString("AT_CLASS"),
									  			   rset.getString("PROFILE_PIC_PATH"),
									  			   rset.getString("AT_ONELINE"),
									  			   rset.getDate("FOLLOWING_TIME"));
				list.add(fa);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertArtist(Connection conn, Artist artist, String userId) {
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs = null;
		String result1 = null;
		int result2 = 0;
		int result3 = 0;
		
		String query1 = prop.getProperty("selectCode");
		String query2 = prop.getProperty("insertArtist");
		String query3 = prop.getProperty("updateUserClass");
		
		try {
			pstmt1 = conn.prepareStatement(query1);
			pstmt2 = conn.prepareStatement(query2);
			pstmt3 = conn.prepareStatement(query3);
			
			pstmt1.setString(1, userId);
			rs = pstmt1.executeQuery();
			if(rs.next()) {
				result1 = rs.getString(1);
				System.out.println("if 안에 들어옴 : " + result1);
			}
			System.out.println("dao usercode: " + result1);
			
			pstmt2.setString(1, result1);
			pstmt2.setString(2, artist.getAtName());
			pstmt2.setInt(3, artist.getAtMember());
			pstmt2.setString(4, artist.getAtGenre());
			pstmt2.setString(5, artist.getAtClass());
			pstmt2.setString(6, artist.getAtPicPath());
			pstmt2.setString(7, artist.getAtOneLine());
			pstmt2.setString(8, artist.getAtIntro());
			pstmt2.setString(9, artist.getAtRecode());
			pstmt2.setDate(10, artist.getAtDebutDate());
			pstmt2.setString(11, artist.getAtInsta());
			pstmt2.setString(12, artist.getAtTwitter());
			pstmt2.setString(13, artist.getAtFacebook());
			
			result2 = pstmt2.executeUpdate();
			
			pstmt3.setString(1, result1);
			result3 = pstmt3.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt2);
			close(pstmt1);
		}
		
		return (result2*result3);
	}

	public int insertGalleryBoard(Connection conn, Artist artist) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertGalleryBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, artist.getAtOneLine());
			pstmt.setString(2, artist.getAtIntro());
			pstmt.setString(3, artist.getAtCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int insertVideoLink(Connection conn, String userCode, String videoLink) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertVideoLink");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			pstmt.setString(2, videoLink);
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertActivityImg(Connection conn, String userCode, String activityImgPath) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertActivityImg");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			pstmt.setString(2, activityImgPath);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}
	
	public int unfollowArtist(Connection conn, String userCode, String atCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("unfollowArtist");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			pstmt.setString(2, atCode);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

	public int getFollowAtFesListCount(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getFollowAtFesListCount");
		
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
	
	public LinkedHashMap<ArrayList<Festival>, ArrayList<String>> selectFollowAtFesList(Connection conn, int currentPage, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		LinkedHashMap<ArrayList<Festival>, ArrayList<String>> map = null;
		ArrayList<Festival> fList = null;
		ArrayList<String> aList = null;
		
		int Festivals = 4; // 한 페이지에 보여질 게시글 개수
		
		int startRow = (currentPage - 1) * Festivals + 1;
		int endRow = startRow + Festivals - 1;		
		
		String query = prop.getProperty("selectFollowAtFesList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, userCode);
			
			rset = pstmt.executeQuery();
			map = new LinkedHashMap<ArrayList<Festival>, ArrayList<String>>();
			fList = new ArrayList<Festival>();
			aList = new ArrayList<String>();
			
			while(rset.next()) {
				Festival f = new Festival(rset.getString("FES_NAME"),
										  rset.getString("FES_LOCATION"),
										  rset.getString("FES_TERM"),
										  rset.getString("FES_POSTER_PATH"));
				fList.add(f); 
				
				String a = rset.getString("AT_NAME");
				aList.add(a);
				
				map.put(fList, aList);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return map;
	}
  
	public ArrayList<Artist> selectAList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Artist> list = null;
		
		String query = prop.getProperty("selectAList");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			list = new ArrayList<Artist>();
			
			while(rs.next()) {
				list.add(new Artist(rs.getString("at_code"),
									rs.getString("at_name"),
									rs.getString("at_genre"),
									rs.getString("at_class"),
									rs.getString("PROFILE_PIC_PATH"),
									rs.getInt("at_Grade"),
									rs.getString("at_insta"),
									rs.getString("at_Twitter"),
									rs.getString("at_Facebook")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
			
		return list;

	}
	public String selectArtistImg(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String fileName = "";
		
		String query = prop.getProperty("selectArtistImg");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				fileName = rset.getString("PROFILE_PIC_PATH");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return fileName;
	}
	public int insertBoard(Connection conn, Artist artist, String userId) {
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		
		ResultSet rs1 = null;
		
		String result1 = null;
		int result2 = 0;
		
		String query1 = prop.getProperty("selectCode");
		String query2 = prop.getProperty("insertBoard");
		
		try {
			pstmt1 = conn.prepareStatement(query1);
			pstmt1.setString(1, userId);
			rs1 = pstmt1.executeQuery();
			if(rs1.next()) {
				result1 = rs1.getString(1);	// user_code
			}
			
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setString(1, artist.getAtOneLine());
			pstmt2.setString(2, artist.getAtIntro());
			pstmt2.setString(3, result1);
			
			result2 = pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs1);
			close(pstmt2);
			close(pstmt1);
		}
		
		return result2;
	}
	
	public int insertProfile1(Connection conn, String userId, String artistPotoFile) {
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt3 = null;
		
		ResultSet rs1 = null;
		
		String result1 = null;
		int result3 = 0;
		
		String query1 = prop.getProperty("selectCode");
		String query3 = prop.getProperty("insertActivityImg");
		
		try {
			pstmt1 = conn.prepareStatement(query1);
			pstmt1.setString(1, userId);
			rs1 = pstmt1.executeQuery();
			if(rs1.next()) {
				result1 = rs1.getString(1);	// user_code
			}
			
			pstmt3 = conn.prepareStatement(query3);
			pstmt3.setString(1, result1);
			pstmt3.setString(2, artistPotoFile);
			
			result3 = pstmt3.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs1);
			close(pstmt3);
			close(pstmt1);
		}
		
		return result3;
	}
	public int insertProfile2(Connection conn, String userId, String videoUrl) {
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt3 = null;
		
		ResultSet rs1 = null;
		
		String result1 = null;
		int result3 = 0;
		
		String query1 = prop.getProperty("selectCode");
		String query3 = prop.getProperty("insertVideoLink");
		
		
		try {
			pstmt1 = conn.prepareStatement(query1);
			pstmt1.setString(1, userId);
			rs1 = pstmt1.executeQuery();
			if(rs1.next()) {
				result1 = rs1.getString(1);	// user_code
			}
			System.out.println("result1 : " + result1);
			
			pstmt3 = conn.prepareStatement(query3);
			pstmt3.setString(1, result1);
			pstmt3.setString(2, videoUrl);
			
			result3 = pstmt3.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs1);
			close(pstmt3);
			close(pstmt1);
		}
		
		return result3;
	}

}
