package member.model.service;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import member.model.dao.CompanyDAO;
import member.model.vo.Company;
import member.model.vo.Member;

public class CompanyService {

	public int insertCompany(Member member, Company company) {
		Connection conn = getConnection();
		
		int result = new CompanyDAO().insertCompany(conn, member, company);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

}
