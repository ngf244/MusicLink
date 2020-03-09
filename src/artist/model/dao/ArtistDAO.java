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
		ResultSet rs = null;
		String result1 = null;
		int result2 = 0;
		
		String query1 = prop.getProperty("selectCode");
		String query2 = prop.getProperty("insertArtist");
		
		try {
			pstmt1 = conn.prepareStatement(query1);
			pstmt2 = conn.prepareStatement(query2);
			
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
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt2);
			close(pstmt1);
		}
		
		return (result2);
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
			System.out.println("팔로우 아티스트의 행사 개수 : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public LinkedHashMap<Festival, ArrayList<String>> selectFollowAtFesList(Connection conn, int currentPage, String userCode) {
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset1 = null;
		ResultSet rset2 = null;
		LinkedHashMap<Festival, ArrayList<String>> map = null;
		Festival f = null;
		ArrayList<String> aList = null;
		
		int Festivals = 5; // 한 페이지에 보여질 게시글 개수
		
		int startRow = (currentPage - 1) * Festivals + 1;
		int endRow = startRow + Festivals - 1;		
		
		String query1 = prop.getProperty("selectFollowAtFesList");
 		String query2 = prop.getProperty("selectFixedAt");
		try {
			pstmt1 = conn.prepareStatement(query1);
			pstmt1.setInt(1, startRow);
			pstmt1.setInt(2, endRow);
			pstmt1.setString(3, userCode);
						
			rset1 = pstmt1.executeQuery();
			map = new LinkedHashMap<Festival, ArrayList<String>>();
			f = new Festival();
						
			while(rset1.next()) {
				f = new Festival(rset1.getString("FES_NAME"),
							     rset1.getString("FES_LOCATION"),
								 rset1.getString("FES_TERM"),
								 rset1.getString("FES_POSTER_PATH"));
				
				pstmt2 = conn.prepareStatement(query2);
				pstmt2.setString(1, rset1.getString("FES_CODE"));
				
				rset2 = pstmt2.executeQuery();
				aList = new ArrayList<String>();
				while(rset2.next()) {
					String artistName = rset2.getString("AT_NAME");
					aList.add(artistName);
				}
				map.put(f, aList);
			}
			System.out.println("공연 정보 : " + f);
			System.out.println("확정된 아티스트 이름 : " + aList);
			System.out.println("맵 출력 : " + map);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset1);
			close(rset2);
			close(pstmt1);
			close(pstmt2);
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
		System.out.println("아티스트 랭킹 리스트 3위까지 : " + list);

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
	public int insertAtReq(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAtReq");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public String selectCode(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userCode = "";
		
		String query = prop.getProperty("selectCode");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userCode = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return userCode;
	}

}
