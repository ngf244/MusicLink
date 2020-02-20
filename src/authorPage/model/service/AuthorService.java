package authorPage.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import authorPage.model.dao.AuthorDAO;
import authorPage.model.vo.Member;

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

	public Member selectUser(String userId) {
		Connection conn = getConnection();
		
		Member mem = new AuthorDAO().selectUser(conn, userId);
		
		close(conn);
		
		return mem;
	}

}
