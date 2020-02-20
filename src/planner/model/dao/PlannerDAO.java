package planner.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

}
