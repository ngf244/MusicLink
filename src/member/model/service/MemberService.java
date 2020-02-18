package member.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

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


}
