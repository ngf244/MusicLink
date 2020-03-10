package festival.model.dao;

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
import festival.model.vo.Festival;
import festival.model.vo.FestivalApply;
import member.model.vo.Member;

import static common.JDBCTemplate.*;

import festival.model.vo.AppFestival;
import festival.model.vo.Festival;
import member.model.vo.Member;


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
		int posts = 5; //한 페이지에 보여질 게시글 개수

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
										  rset.getString("pay_range"),
										  rset.getInt("recruit_num"),
										  rset.getString("recruit_term"),
										  rset.getString("fes_poster_path"),
										  rset.getString("fes_banner_path"),
										  rset.getString("secret_option"),
										  rset.getInt("ticket_fee"),
										  rset.getString("cp_code"),
										  rset.getString("fee_free_op"));
				
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

	public int getSearchListCount(Connection conn, int category, String searchType, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		if(category == 0) category = 1;
		String query = prop.getProperty(searchType + "_c" + category + "_getSearchListCount");
		
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

	public LinkedHashMap<Festival, ArrayList<String>> selectSearchList(Connection conn, int currentPage, int category,
			String searchType, String searchText) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		ResultSet rset3 = null;
		ResultSet rset4 = null;
		int posts = 5; //한 페이지에 보여질 게시글 개수
		
		LinkedHashMap<Festival, ArrayList<String>> map = null;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		if(category == 0) category = 1;
		String query = prop.getProperty(searchType + "_c" + category + "_selectSearchList");
		String query2 = prop.getProperty("findArtist");
		String query3 = prop.getProperty("findArtistName");
		String query4 = prop.getProperty("findCpName");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchText);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			map = new LinkedHashMap<Festival, ArrayList<String>>();
			
			ArrayList<String> artistArr = null;
			Festival f = null;
			while(rset.next()) {
				f = new Festival(rset.getString("fes_code"),
								 rset.getString("fes_name"),
								 rset.getString("fes_location"),
								 rset.getString("fes_term"),
								 rset.getString("pay_range"),
								 rset.getInt("recruit_num"),
								 rset.getString("recruit_term"),
								 rset.getString("fes_poster_path"),
								 rset.getString("fes_banner_path"),
								 rset.getString("secret_option"),
								 rset.getInt("ticket_fee"),
								 rset.getString("cp_code"),
								 rset.getString("fee_free_op"));

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
										rs.getString("user_code"),
										rs.getString("fee_free_op"));
				
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

	public LinkedHashMap<Festival, ArrayList<String>> selectRandomList(Connection conn, int i) {
		Statement stmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		ResultSet rset3 = null;
		LinkedHashMap<Festival, ArrayList<String>> map = null;
		
		String query = prop.getProperty(i + "_selectRandomFestival");
		String query2 = prop.getProperty("findArtist");
		String query3 = prop.getProperty("findArtistName");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			map = new LinkedHashMap<Festival, ArrayList<String>>();
			Festival f = null;
			ArrayList<String> artistArr = null;
			while(rset.next()) {
				f = new Festival(rset.getString("fes_code"),
								 rset.getString("fes_term"),
								 rset.getInt("recruit_num"),
								 rset.getString("recruit_term"),
								 rset.getString("fes_poster_path"),
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
				
				map.put(f, artistArr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset3);
			close(rset2);
			close(rset);
			close(pstmt3);
			close(pstmt2);
			close(stmt);
		}
		
		return map;
	}

	public int getApListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("c2_getListCount");
		
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

	public ArrayList<Festival> selectApList(Connection conn, int currentPage, int category) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		int posts = 5; //한 페이지에 보여질 게시글 개수

		ArrayList<Festival> fArr = null;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		if (category == 0) category = 1;
		String query = prop.getProperty("c" + category + "_selectApList");
		String query2 = prop.getProperty("findCpName");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			fArr = new ArrayList<Festival>();
			
			Festival f = null;
			while(rset.next()) {
				f = new Festival();
				f.setFesCode(rset.getString("fes_code"));
				f.setFesName(rset.getString("fes_name"));
				f.setFesLoc(rset.getString("fes_location"));
				f.setFesTerm(rset.getString("fes_term"));
				f.setRecTerm(rset.getString("recruit_term"));
				f.setPosPath(rset.getString("fes_poster_path"));
				f.setCpCode(rset.getString("cp_code"));
				f.setPayRange(rset.getString("pay_range"));
				
				pstmt2 = conn.prepareStatement(query2);
				pstmt2.setString(1, f.getCpCode());
				rset2 = pstmt2.executeQuery();
				
				if(rset2.next()) {
					f.setCpName(rset2.getString(1));
				}
				
				fArr.add(f);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset2);
			close(rset);
			close(pstmt2);
			close(pstmt);
		}
		
		return fArr;
	}

	public int approachFestival(Connection conn, String usercode, String fescode) {
		PreparedStatement pstmt = null;
		//PreparedStatement pstmt2 = null;
		int result = 0;
		
		String query = prop.getProperty("approachFes");
		//String query2 = prop.getProperty("approachMoney");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fescode);
			pstmt.setString(2, usercode);
			
			result = pstmt.executeUpdate();
			/*
			System.out.println("query : " + result);
			if(result > 0) {
				pstmt2 = conn.prepareStatement(query2);
				pstmt2.setString(1, usercode);
				
				result = pstmt2.executeUpdate();
				System.out.println("query2 : " + result);
			} else {
				result = 0;
			}*/
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//close(pstmt2);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<String> selectUserApList(Connection conn, String usercode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> userApList = null;
		
		String query = prop.getProperty("userApList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, usercode);
			
			rset = pstmt.executeQuery();
			userApList = new ArrayList<String>();
			while(rset.next()) {
				userApList.add(rset.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userApList;
	}

	public int getApSearchListCount(Connection conn, String searchType, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty(searchType + "_getApSearchListCount");
		
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

	public ArrayList<Festival> selectApSearchList(Connection conn, int currentPage, int category, String searchType,
			String searchText) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		int posts = 5; //한 페이지에 보여질 게시글 개수

		ArrayList<Festival> fArr = null;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		if (category == 0) category = 1;
		String query = prop.getProperty(searchType + "_c" + category + "_selectApSearchList");
		String query2 = prop.getProperty("findCpName");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchText);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			fArr = new ArrayList<Festival>();
			
			Festival f = null;
			while(rset.next()) {
				f = new Festival();
				f.setFesCode(rset.getString("fes_code"));
				f.setFesName(rset.getString("fes_name"));
				f.setFesLoc(rset.getString("fes_location"));
				f.setFesTerm(rset.getString("fes_term"));
				f.setRecTerm(rset.getString("recruit_term"));
				f.setPosPath(rset.getString("fes_poster_path"));
				f.setCpCode(rset.getString("cp_code"));
				f.setPayRange(rset.getString("pay_range"));
				
				pstmt2 = conn.prepareStatement(query2);
				pstmt2.setString(1, f.getCpCode());
				rset2 = pstmt2.executeQuery();
				
				if(rset2.next()) {
					f.setCpName(rset2.getString(1));
				}
				
				fArr.add(f);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset2);
			close(rset);
			close(pstmt2);
			close(pstmt);
		}
		
		return fArr;
	}


	public ArrayList<Festival> selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Festival> list = null;
		
		String query = prop.getProperty("selectFList");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			list = new ArrayList<Festival>();
			
			while(rs.next()) {
				list.add(new Festival(rs.getString("fes_code"),
									  rs.getString("fes_name"),
									  rs.getString("fes_term"),
									  rs.getString("recruit_term"),
									  rs.getDate("fes_date"),
									  rs.getString("fes_recruit"),
									  rs.getString("user_code")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		System.out.println(list + "젠장뭐때문인지 알수가없다");
		return list;
	}

	public ArrayList<FestivalApply> selectappList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<FestivalApply> list = null;
		
		String query = prop.getProperty("selectappList");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			list = new ArrayList<FestivalApply>();
			
			while(rs.next()) {
				list.add(new FestivalApply(rs.getDate("ap_fes_time"),
										   rs.getString("fes_code"),
										   rs.getString("at_name"),
										   rs.getString("fes_term"),
										   rs.getString("pay_range"),
										   rs.getString("flcode")));
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		System.out.println(list + "dao에서 넘어오냐");
		return list;
  }

	public int selectArtistCount(Connection conn, String fcode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("artistCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fcode);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public int updateFestival(Connection conn, Festival festival, String status) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "";
		if(status.equals("true")) query = prop.getProperty("updateFestival");
		else query = prop.getProperty("updateFestival_f");
		
		try {
			pstmt = conn.prepareStatement(query);

			if(status.equals("true")) {
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
				pstmt.setInt(11, festival.getTicFee());
				pstmt.setString(12, festival.getTicUrl());
				pstmt.setString(13, festival.getCpCode());
				pstmt.setString(14, festival.getTicFreeOp());
				pstmt.setString(15, festival.getFesCode());
			} else {
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
				pstmt.setString(12, festival.getFesCode());
			}
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getGeade(Connection conn, String cpCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getGrade");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cpCode);
			
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
    
	public LinkedHashMap<Festival, Member> selectMySchedule(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		LinkedHashMap<Festival, Member> map = null;
		
		String query = prop.getProperty("selectMySchedule");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			rset = pstmt.executeQuery();
			
			map = new LinkedHashMap<Festival, Member>();
			
			while(rset.next()) {
				Festival f = new Festival(rset.getString("FES_NAME"),
										  rset.getString("FES_LOCATION"),
										  rset.getString("FES_TERM"),
										  rset.getString("FES_POSTER_PATH"),
										  rset.getString("USER_CODE"));
				Member m = new Member(rset.getString("USER_NAME"),
									  rset.getString("USER_EMAIL"),
									  rset.getString("USER_PHONE"));
				map.put(f, m);
			}

    } catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return map;
	}

	public ArrayList<AppFestival> selectMyAppFesList(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AppFestival> afList = null;
		
		String query = prop.getProperty("selectMyAppFesList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			rset = pstmt.executeQuery();
			
			afList = new ArrayList<AppFestival>();
			while(rset.next()) {
				AppFestival af = new AppFestival(rset.getString("FES_CODE"),
												 rset.getString("AP_FES_YN"),
												 rset.getDate("AP_FES_TIME"),
												 rset.getString("FES_NAME"),
												 rset.getString("FES_LOCATION"),
												 rset.getString("FES_TERM"),
												 rset.getString("USER_NAME"));
				afList.add(af);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return afList;

	}

}
