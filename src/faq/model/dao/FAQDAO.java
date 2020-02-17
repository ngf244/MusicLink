package faq.model.dao;

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
import java.util.Properties;

import faq.model.vo.FAQ;

public class FAQDAO {

	private Properties prop = new Properties();
	
	public FAQDAO() {
		String fileName = FAQDAO.class.getResource("/sql/faq/faq-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	

	public int insertFAQ(Connection conn, FAQ faq) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFAQ");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, faq.getFaqTitle());
			pstmt.setString(2, faq.getFaqContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<FAQ> selectList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<FAQ> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<FAQ>();
			
			while(rset.next()) {
				FAQ faq = new FAQ(rset.getString("FAQ_NUM"),
								  rset.getString("FAQ_TITLE"),
								  rset.getString("FAQ_CONTENT"),
								  rset.getString("FAQ_STATUS"),
								  rset.getString("MN_CODE"));
				list.add(faq);
			}
			
			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

}
