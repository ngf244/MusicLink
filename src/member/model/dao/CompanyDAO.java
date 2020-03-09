package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Company;
import member.model.vo.Member;

public class CompanyDAO {
private Properties prop = new Properties();
	
	public CompanyDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/company-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertCompany(Connection conn, Member member, Company company) {
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rset = null;
		int result1 = 0;
		int result2 = 0;
		int result = 0;
		String code = "";
		
		String query1 = prop.getProperty("insertCompany1");
		String query2 = prop.getProperty("select");
		String query3 = prop.getProperty("insertCompany2");
		
		try {
			pstmt1 = conn.prepareStatement(query1);
			pstmt2 = conn.prepareStatement(query2);
			pstmt3 = conn.prepareStatement(query3);
			
			pstmt1.setString(1, member.getUserId());
			pstmt1.setString(2, member.getUserPwd());
			pstmt1.setString(3, member.getUserName());
			pstmt1.setString(4, member.getUserEmail());
			pstmt1.setString(5, member.getUserPhone());

			result1 = pstmt1.executeUpdate();
			
			pstmt2.setString(1, member.getUserId());
			rset = pstmt2.executeQuery();
			if(rset.next()) {
				code = rset.getString(1);
			}
			
			pstmt3.setString(1, code);
			pstmt3.setString(2, company.getCpName());
			pstmt3.setString(3, company.getCpAddress());
			pstmt3.setString(4, company.getCpPhone());
			
			result2 = pstmt3.executeUpdate();
			result = result1 * result2;
			
			System.out.println("pass : " + member.getUserPwd());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt3);
			close(pstmt2);
			close(pstmt1);
		}
		
		return result;
	}

	public int insertAtReq(Connection conn, String companyId) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		int result = 0;
		String code = null;
		
		String query1 = prop.getProperty("insertAtReq");
		String query2 = prop.getProperty("select");
		
		try {
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setString(1, companyId);
			rs = pstmt2.executeQuery();
			if(rs.next()) {
				code = rs.getString(1);
			}
			
			pstmt = conn.prepareStatement(query1);
			pstmt.setString(1, code);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
