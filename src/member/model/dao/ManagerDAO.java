package member.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Manager;

public class ManagerDAO {
	
	private Properties prop = new Properties();
	
	public ManagerDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/manager-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Manager loginManager(Connection conn, Manager manager) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Manager loginManager = null;
		
		String query = prop.getProperty("loginManager");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, manager.getMnId());
			pstmt.setString(2, manager.getMnPwd());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				loginManager = new Manager(rs.getString("mn_code"),
										   rs.getString("mn_id"),
										   rs.getString("mn_pwd"),
										   rs.getString("mn_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return loginManager;
	}

}
