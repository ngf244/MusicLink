package authorPage.model.service;
import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import authorPage.model.dao.AuthorDAO;
import authorPage.model.vo.ArtistJoinInfo;
import authorPage.model.vo.CompanyJoinInfo;
import authorPage.model.vo.Follow;
import authorPage.model.vo.ReportPage;
import member.model.vo.Member;
import oracle.jdbc.OracleConnection.CommitOption;

public class AuthorService {

	public ArrayList<Member> selectMember() {
		Connection conn = getConnection();
		
		ArrayList<Member> memArr = new AuthorDAO().selectMember(conn);
		
		close(conn);
		
		return memArr;
		
	}

	public int checkUserClass(String userId) {
		Connection conn = getConnection();
		
		int result = new AuthorDAO().checkUserClass(conn, userId);
		
		close(conn);
		
		return result;
	}

	public Member selectUser(String userCode) {
		Connection conn = getConnection();
		
		Member mem = new AuthorDAO().selectUser(conn, userCode);
		
		close(conn);
		
		return mem;
	}

	public String getPicture(String userCode) {
		Connection conn = getConnection();
		
		String imgPath = new AuthorDAO().getPicture(conn, userCode);
		
		close(conn);
		
		return imgPath;
	}

	public ArrayList<Follow> selectFollow(String userCode) {
		Connection conn = getConnection();
		
		ArrayList<Follow> fArr = new AuthorDAO().selectFollow(conn, userCode);
		
		close(conn);
		
		return fArr;
	}

	public ArrayList<ReportPage> getReportList() {
		Connection conn = getConnection();
		
		ArrayList<ReportPage> rArr = new AuthorDAO().getReportList(conn);
		
		close(conn);
		
		return rArr;
	}

	public int addBanUser(String userCode, String restrictReason, String restrictReasonDetail, String adminCode) {
		Connection conn = getConnection();
		
		int result = new AuthorDAO().addBanUser(conn, userCode, restrictReason, restrictReasonDetail, adminCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public String getUserCode(String userId) {
		Connection conn = getConnection();
		
		String userCode = new AuthorDAO().getUserCode(conn, userId);
		
		close(conn);
		
		return userCode;
	}

	public int changeUserStatus(String userCode) {
		Connection conn = getConnection();
		
		int result2 = new AuthorDAO().changeUserStatus(conn, userCode);
		
		if(result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result2;
	}

	public void deleteReport(String userCode) {
		Connection conn = getConnection();
		
		int result = new AuthorDAO().deleteReport(conn, userCode);
		
		if (result > 0 ) {
			commit(conn);
		}
	}

	public ArrayList<String> getBanReason(String userCode) {
		Connection conn = getConnection();
		
		ArrayList<String> arr = new AuthorDAO().getBanReason(conn, userCode);
		
		return arr;
	}

	public int recoverUser(String userId) {
		Connection conn = getConnection();
		
		int result = new AuthorDAO().recoverUser(conn, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int deleteBan(String userId) {
		String userCode = getUserCode(userId);
		
		Connection conn = getConnection();
		
		int result = new AuthorDAO().deleteBan(conn, userCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<ArtistJoinInfo> getArtistJoinList() {
		Connection conn = getConnection();
		
		ArrayList<ArtistJoinInfo> arr = new AuthorDAO().getArtistJoinList(conn);
		
		close(conn);
		
		return arr;
	}

	public ArtistJoinInfo getArtistJoinInfo(String userCode) {
		Connection conn = getConnection();
		
		ArtistJoinInfo ai = new AuthorDAO().getArtistJoinInfo(conn, userCode);
		
		close(conn);
		
		return ai;
	}

	public int acceptJoin(String userCode) {
		Connection conn = getConnection();
		
		int result = new AuthorDAO().acceptJoin(conn, userCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int sendMessage(String message, String userCode) {
		Connection conn = getConnection();
		
		int result = new AuthorDAO().sendMessage(conn, userCode, message);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteRequset(String userCode) {
		Connection conn = getConnection();
		
		int result = new AuthorDAO().deleteRequest(conn, userCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<CompanyJoinInfo> getCompanyJoinList() {
		Connection conn = getConnection();
		
		ArrayList<CompanyJoinInfo> arr = new AuthorDAO().getComapnyJoinList(conn);
		
		close(conn);
		
		return arr;
	}

	public CompanyJoinInfo getCompanyJoinInfo(String userCode) {
		Connection conn = getConnection();
		
		CompanyJoinInfo cj = new AuthorDAO().getCompanyJoinInfo(conn, userCode);
		
		close(conn);
		
		return cj;
	}

	public int changeUserClass(String userCode, String where) {
		Connection conn = getConnection();
		
		int result = new AuthorDAO().changeUserClass(conn, userCode, where);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
