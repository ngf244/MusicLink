package planner.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import planner.model.vo.Planner;

public class PlannerDAO {

	private Properties prop = new Properties();
	
	public PlannerDAO() {
		String fileName = PlannerDAO.class.getResource("/sql/planner/planner-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	
	public int insertPlanner(Connection conn, Planner pn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPlanner");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pn.getCpCode());
			pstmt.setString(2, pn.getCpName());
			pstmt.setString(3, pn.getCpAddress());
			pstmt.setString(4, pn.getCpPhone());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertPlReq(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPlReq");
		
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

	public int updatePlannerGrade(Connection conn, String cpCode, int grade) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePlannerGrade");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, grade);
			pstmt.setString(2, cpCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectPlannerGrade(Connection conn, String cpCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int nowGrade = 0;
		
		String query = prop.getProperty("selectPlannerGrade");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cpCode);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				nowGrade = rset.getInt("CP_GRADE");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return nowGrade;
	}

}
