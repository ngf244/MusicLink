package lovecall.model.dao;

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

import lovecall.model.vo.LoveCall;

public class LoveCallDAO {
	
	private Properties prop = new Properties();
	
	public LoveCallDAO() {
		String fileName = LoveCallDAO.class.getResource("/sql/lovecall/lovecall-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<LoveCall> selectLcList(Connection conn, String userCode) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<LoveCall> list = null;
		
		String query = prop.getProperty("selectLcList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<LoveCall>();
			
			while(rs.next()) {
				list.add(new LoveCall(rs.getDate("SEND_TIME"),
									  rs.getString("UNAME"),
									  rs.getString("FES_NAME"),
									  rs.getString("ACCEPT_YN"),
									  rs.getString("LOVECALL_CODE"),
									  rs.getString("FES_CODE")));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("리스트야 넘어와라 !!!!!" + list);
		
		return list;
	}

}
