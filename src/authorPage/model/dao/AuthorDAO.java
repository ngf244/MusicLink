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
import java.util.HashMap;
import java.util.Properties;

import com.sun.org.apache.regexp.internal.REProgram;

import authorPage.model.vo.ArtistJoinInfo;
import authorPage.model.vo.CompanyJoinInfo;
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

	public int addBanUser(Connection conn, String userCode, String restrictReason, String restrictReasonDetail, String adminCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		String query = prop.getProperty("addBanUser"); // admin은 현재 관리자 로그인 기능이 없기 때문에 추후 추가한다
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			pstmt.setString(2, restrictReason);
			pstmt.setString(3, restrictReasonDetail);
//			pstmt.setString(4, adminCode); // 관리자 로그인 기능 제작완성시 해제. query문도 123을 ?로 바꿔야함
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public String getUserCode(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String userCode = null;
		
		String query = prop.getProperty("getUserCode");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userCode = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return userCode;
	}

	public int changeUserStatus(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		int result2 = 0;
		
		String query = prop.getProperty("changeUserStatus");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			
			result2 = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result2;
	}

	public int deleteReport(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReport");
		
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

	public ArrayList<String> getBanReason(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> arr = new ArrayList<String>();
		
		String query = prop.getProperty("getBanReason");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				arr.add(rset.getString("BAN_REASON"));
				arr.add(rset.getString("BAN_REASON_DETAIL"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return arr;
	}

	public int recoverUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("recoverUser");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteBan(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBan");
		
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

	public ArrayList<ArtistJoinInfo> getArtistJoinList(Connection conn) {
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ArtistJoinInfo> arr = new ArrayList<ArtistJoinInfo>();
		ArrayList<String> user_codes = new ArrayList<String>();
		HashMap<String, String> hMap = new HashMap<String, String>();
		
		String query1 = prop.getProperty("getArtistJoinCode");
		String query2 = prop.getProperty("getArtistJoinList_detail");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query1);
			
			while(rset.next()) {
				String code = rset.getString("USER_CODE");
				user_codes.add(code);
				hMap.put(code, rset.getString("REQUEST_DATE"));
			}
			
			
			for(int i = 0; i < user_codes.size(); i++) {
				pstmt = conn.prepareStatement(query2);
				String code = user_codes.get(i);
				pstmt.setString(1, code);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					ArtistJoinInfo aj = new ArtistJoinInfo();
					aj.setAt_code(rset.getString(1));
					aj.setActiveName(rset.getString(2));
					aj.setPeopleNum(rset.getString(3));
					aj.setGenre(rset.getString(4));
					aj.setAt_class(rset.getString(5));
					aj.setPic1(rset.getString(6));
					aj.setOne_introduce(rset.getString(7));
					aj.setMul_introduce(rset.getString(8));
					aj.setRecord(rset.getString(9));
					aj.setDebutDate(rset.getString(10));
					aj.setInsta(rset.getString(12));
					aj.setTwitter(rset.getString(13));
					aj.setFacebook(rset.getString(14));
					String requestDate = hMap.get(code);
					aj.setRequestDate(requestDate);
					
					
					arr.add(aj);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			close(stmt);
		}
		
		return arr;
	}

	public ArtistJoinInfo getArtistJoinInfo(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArtistJoinInfo ai = new ArtistJoinInfo();
		String query = prop.getProperty("getArtistJoinInfo");
		String query2 = prop.getProperty("getArtistJoinInfo2");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ai.setAt_code(rset.getString(1));
				ai.setActiveName(rset.getString(2));
				ai.setPeopleNum(rset.getString(3));
				ai.setGenre(rset.getString(4));
				ai.setAt_class(rset.getString(5));
				ai.setPic1(rset.getString(6));
				ai.setOne_introduce(rset.getString(7));
				ai.setMul_introduce(rset.getString(8));
				ai.setRecord(rset.getString(9));
				ai.setDebutDate(rset.getString(10));
				ai.setInsta(rset.getString(12));
				ai.setTwitter(rset.getString(13));
				ai.setFacebook(rset.getString(14));
			}
			close(pstmt);
			close(rset);
			
			
			pstmt = conn.prepareStatement(query2);
			pstmt.setString(1, userCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ai.setAvisrc(rset.getString("GALLERY_MEDIA_PATH"));
			}
			if(rset.next()) {
				ai.setPic2(rset.getString("GALLERY_MEDIA_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ai;
	}

	public int acceptJoin(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("acceptJoin");
		
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

	public int sendMessage(Connection conn, String userCode, String message) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("sendMessage");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			pstmt.setString(2, message);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteRequest(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteRequest");
		
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

	public ArrayList<CompanyJoinInfo> getComapnyJoinList(Connection conn) {
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CompanyJoinInfo> arr = new ArrayList<CompanyJoinInfo>();
		ArrayList<String> user_codes = new ArrayList<String>();
		HashMap<String, String> hMap = new HashMap<String, String>();
		
		String query1 = prop.getProperty("getComapnyJoinCode");
		String query2 = prop.getProperty("getComapnyJoinList_detail");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query1);
			
			while(rset.next()) {
				String code = rset.getString("USER_CODE");
				user_codes.add(code);
				hMap.put(code, rset.getString("REQUEST_DATE"));
			}
//			System.out.println("code : "+ user_codes);
//			System.out.println("hMap : " + hMap);
			
			for(int i = 0; i < user_codes.size(); i++) {
				pstmt = conn.prepareStatement(query2);
				String code = user_codes.get(i);
				pstmt.setString(1, code);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					CompanyJoinInfo cj = new CompanyJoinInfo();
					cj.setCoCode(rset.getString("USER_CODE"));
					cj.setChargePerson(rset.getString("USER_NAME"));
					cj.setCoAddress(rset.getString("CP_ADDRESS"));
					cj.setCoPhone(rset.getString("CP_PHONENUM"));
					cj.setCoName(rset.getString("CP_NAME"));
					String requestDate = hMap.get(code);
					cj.setRequestDate(requestDate);
					
//					System.out.println("cj : "+cj);
					
					arr.add(cj);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			close(stmt);
		}
		
		return arr;
	}

	public CompanyJoinInfo getCompanyJoinInfo(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		CompanyJoinInfo cj = new CompanyJoinInfo();
		
		String query = prop.getProperty("getComapnyJoinList_detail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				cj.setCoCode(rset.getString("USER_CODE"));
				cj.setChargePerson(rset.getString("USER_NAME"));
				cj.setCoAddress(rset.getString("CP_ADDRESS"));
				cj.setCoPhone(rset.getString("CP_PHONENUM"));
				cj.setCoName(rset.getString("CP_NAME"));
				cj.setChargePhone(rset.getString("USER_PHONE"));
				cj.setEmail(rset.getString("USER_EMAIL"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return cj;
	}
	
}
