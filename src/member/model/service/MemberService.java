package member.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.HashMap;

import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(Member member) {
		Connection conn = getConnection();
		
		MemberDAO mDAO = new MemberDAO();
		Member loginUser = mDAO.loginMember(conn, member);
		
		close(conn);
		return loginUser;
	}

	public int insertMember(Member member) {
		Connection conn = getConnection();
		
		MemberDAO mDAO = new MemberDAO();
		int result = mDAO.insertMember(conn, member);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int idCheck(String userId) {
		Connection conn = getConnection();
		int result = 0;
		
		MemberDAO mDAO = new MemberDAO();
		result = mDAO.idCheck(conn, userId);
		
		close(conn);
		
		return result;
	}

	public Member selectMember(String loginUserId) {
		Connection conn = getConnection();
		MemberDAO mDAO = new MemberDAO();
		Member member = mDAO.selectMember(conn, loginUserId);
		
		close(conn);
		
		return member;
	}

	public int deleteMember(String userId) {
		Connection conn = getConnection();
		MemberDAO mDAO = new MemberDAO();
		int result = mDAO.deleteMember(conn, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int updateMember(HashMap<String, String> map) {
		Connection conn = getConnection();
		
		MemberDAO mDAO = new MemberDAO();
		int result = mDAO.updateMember(conn, map);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;		
	}

	public String findId(String name, String email) {
		Connection conn = getConnection();
		
		MemberDAO mDAO = new MemberDAO();
		String id = mDAO.findId(conn, name, email);  
		
		if(id != "") {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return id;
	}

	public int updatePwd(String id, String tempPwd) {
		Connection conn = getConnection();
		
		MemberDAO mDAO = new MemberDAO();
		int result = mDAO.updatePwd(conn, id, tempPwd);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;	
	}

	public int banlogin(String user_id) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().banlogin(conn, user_id);
		
		close(conn);
		
		return result;
	}


}
