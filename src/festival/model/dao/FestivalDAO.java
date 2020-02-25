package festival.model.dao;

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

import festival.model.vo.Festival;

import static common.JDBCTemplate.*;

public class FestivalDAO {
	private Properties prop = new Properties();
	
	public FestivalDAO() {
		String fileName = FestivalDAO.class.getResource("/sql/festival/festival-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertFestival(Connection conn, Festival festival) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertFes");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, festival.getFesName());
			pstmt.setString(2, festival.getFesLoc());
			pstmt.setString(3, festival.getFesTerm());
			pstmt.setString(4, festival.getFesInfo());
			pstmt.setString(5, festival.getPayRange());
			pstmt.setInt(6, festival.getRecCount());
			pstmt.setString(7, festival.getRecTerm());
			pstmt.setString(8, festival.getPosPath());
			pstmt.setString(9, festival.getBanPath());
			pstmt.setString(10, festival.getSecOp());
			pstmt.setString(11, festival.getCpCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection conn, int category) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		
		if(category == 0) category = 1;
		String query = prop.getProperty("c" + category + "_getListCount");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return result;
	}

	public LinkedHashMap<Festival, ArrayList<String>> selectList(Connection conn, int currentPage, int category) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		ResultSet rset3 = null;
		ResultSet rset4 = null;
		int posts = 10; //한 페이지에 보여질 게시글 개수

		LinkedHashMap<Festival, ArrayList<String>> map = null;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		if (category == 0) category = 1;
		String query = prop.getProperty("c" + category + "_selectList");
		String query2 = prop.getProperty("findArtist");
		String query3 = prop.getProperty("findArtistName");
		String query4 = prop.getProperty("findCpName");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			map = new LinkedHashMap<Festival, ArrayList<String>>();
			
			ArrayList<String> artistArr = null;
			Festival f = null;
			while(rset.next()) {
				f = new Festival(rset.getString("fes_code"),
										  rset.getString("fes_name"),
										  rset.getString("fes_location"),
										  rset.getString("fes_term"),
										  rset.getInt("recruit_num"),
										  rset.getString("recruit_term"),
										  rset.getString("fes_poster_path"),
										  rset.getString("fes_banner_path"),
										  rset.getString("secret_option"),
										  rset.getInt("ticket_fee"),
										  rset.getString("cp_code"));
				
				pstmt4 = conn.prepareStatement(query4);
				pstmt4.setString(1, f.getCpCode());
				rset4 = pstmt4.executeQuery();
				
				if(rset4.next()) {
					f.setCpName(rset4.getString(1));
					
					pstmt2 = conn.prepareStatement(query2);
					pstmt2.setString(1, f.getFesCode());
					rset2 = pstmt2.executeQuery();
					
					artistArr = new ArrayList<String>();
					while(rset2.next()) {
						String artCode = rset2.getString(1);
						
						pstmt3 = conn.prepareStatement(query3);
						pstmt3.setString(1, artCode);
						
						rset3 = pstmt3.executeQuery();
						
						while(rset3.next()) {
							artistArr.add(rset3.getString(1));
						}
					}
				}
				
				map.put(f, artistArr);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset4);
			close(rset3);
			close(rset2);
			close(rset);
			close(pstmt4);
			close(pstmt3);
			close(pstmt2);
			close(pstmt);
		}
		
		return map;
	}

	public int getSearchListCount(Connection conn, String searchType, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty(searchType + "_getSearchListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchText);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}

	public LinkedHashMap<Festival, ArrayList<String>> selectSearchList(Connection conn, int currentPage,
			String searchType, String searchText) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		ResultSet rset3 = null;
		ResultSet rset4 = null;
		int posts = 10; //한 페이지에 보여질 게시글 개수
		
		LinkedHashMap<Festival, ArrayList<String>> map = null;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		String query = prop.getProperty(searchType + "_selectSearchList");
		String query2 = prop.getProperty("findArtist");
		String query3 = prop.getProperty("findArtistName");
		String query4 = prop.getProperty("findCpName");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, searchText);
			
			rset = pstmt.executeQuery();
			map = new LinkedHashMap<Festival, ArrayList<String>>();
			
			ArrayList<String> artistArr = null;
			Festival f = null;
			while(rset.next()) {
				f = new Festival(rset.getString("fes_code"),
								 rset.getString("fes_name"),
								 rset.getString("fes_location"),
								 rset.getString("fes_term"),
								 rset.getInt("recruit_num"),
								 rset.getString("recruit_term"),
								 rset.getString("fes_poster_path"),
								 rset.getString("fes_banner_path"),
								 rset.getString("secret_option"),
								 rset.getInt("ticket_fee"),
								 rset.getString("cp_code"));

				pstmt4 = conn.prepareStatement(query4);
				pstmt4.setString(1, f.getCpCode());
				rset4 = pstmt4.executeQuery();

				if(rset4.next()) {
					f.setCpName(rset4.getString(1));
					
					pstmt2 = conn.prepareStatement(query2);
					pstmt2.setString(1, f.getFesCode());
					rset2 = pstmt2.executeQuery();
					
					artistArr = new ArrayList<String>();
					while(rset2.next()) {
						String artCode = rset2.getString(1);
						
						pstmt3 = conn.prepareStatement(query3);
						pstmt3.setString(1, artCode);
						
						rset3 = pstmt3.executeQuery();
						
						while(rset3.next()) {
							artistArr.add(rset3.getString(1));
						}
					}
				}
				
				map.put(f, artistArr);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset4);
			close(rset3);
			close(rset2);
			close(rset);
			close(pstmt4);
			close(pstmt3);
			close(pstmt2);
			close(pstmt);
		}
		
		return map;
	}

	public Festival selectFestival(Connection conn, String fcode) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		Festival festival = null;
		
		String query = prop.getProperty("selectFestival");
		String query2 = prop.getProperty("findCpName");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fcode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				festival = new Festival(rs.getString("fes_code"),
										rs.getString("fes_name"),
										rs.getString("fes_location"),
										rs.getString("fes_term"),
										rs.getString("fes_info"),
										rs.getString("pay_range"),
										rs.getInt("recruit_num"),
										rs.getString("recruit_term"),
										rs.getString("fes_poster_path"),
										rs.getString("fes_banner_path"),
										rs.getString("secret_option"),
										rs.getInt("ticket_fee"),
										rs.getString("ticket_url"),
										rs.getString("user_code"));
				
				pstmt2 = conn.prepareStatement(query2);
				pstmt2.setString(1, festival.getCpCode());
				rs2 = pstmt2.executeQuery();
				
				if(rs2.next()) {
					festival.setCpName(rs2.getString(1));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs2);
			close(rs);
			close(pstmt2);
			close(pstmt);
		}
		
		return festival;
	}

	public ArrayList<String> findArtist(Connection conn, String fcode) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ArrayList<String> artistArr = null;
		
		String query = prop.getProperty("findArtist");
		String query2 = prop.getProperty("findArtistName");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fcode);
			
			rs = pstmt.executeQuery();
			
			artistArr = new ArrayList<String>();
			while(rs.next()) {
				String artCode = rs.getString(1);

				pstmt2 = conn.prepareStatement(query2);
				pstmt2.setString(1, artCode);
				
				rs2 = pstmt2.executeQuery();
				
				while(rs2.next()) {
					artistArr.add(rs2.getString(1));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs2);
			close(rs);
			close(pstmt2);
			close(pstmt);
		}
		
		return artistArr;
	}

	public LinkedHashMap<Festival, ArrayList<String>> selectBannerList(Connection conn) {
		Statement stmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		ResultSet rset3 = null;
		LinkedHashMap<Festival, ArrayList<String>> banmap = null;
		
		String query = prop.getProperty("selectRandomFestival");
		String query2 = prop.getProperty("findArtist");
		String query3 = prop.getProperty("findArtistName");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			banmap = new LinkedHashMap<Festival, ArrayList<String>>();
			Festival f = null;
			ArrayList<String> artistArr = null;
			while(rset.next()) {
				f = new Festival(rset.getString("fes_code"),
								 rset.getString("fes_term"),
								 rset.getInt("recruit_num"),
								 rset.getString("recruit_term"),
								 rset.getString("fes_banner_path"));
				
				pstmt2 = conn.prepareStatement(query2);
				pstmt2.setString(1, f.getFesCode());
				rset2 = pstmt2.executeQuery();

				artistArr = new ArrayList<String>();
				while(rset2.next()) {
					String artCode = rset2.getString(1);
					
					pstmt3 = conn.prepareStatement(query3);
					pstmt3.setString(1, artCode);
					
					rset3 = pstmt3.executeQuery();
					
					while(rset3.next()) {
						artistArr.add(rset3.getString(1));
					}
				}
				
				banmap.put(f, artistArr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return banmap;
	}

}
