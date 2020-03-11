package lovecall.model.dao;

import static common.JDBCTemplate.*;
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

import com.sun.xml.internal.ws.Closeable;

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
				LoveCall lc = new LoveCall();
				
				lc.setAtCode(rs.getString("ATCODE"));
				lc.setFesCode(rs.getString("FES_CODE"));
				lc.setFesName(rs.getString("FES_NAME"));
				lc.setLcCode(rs.getString("LOVECALL_CODE"));
				lc.setLcYn(rs.getString("ACCEPT_YN"));
				lc.setLcDate(rs.getDate("SEND_TIME"));
				lc.setPlCode(rs.getString("UNAME"));
				
				list.add(lc);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("리스트야 넘어와라 !!!!!" + list);
		
		return list;
	}

	public int upDateYCall(Connection conn, LoveCall lvCall) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("upDateYCall");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, lvCall.getLcYn());
			pstmt.setString(2, lvCall.getLcCode());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

	public int acceptLoveCall(Connection conn, String lcCode, String letter) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("acceptLoveCall");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, letter);
			pstmt.setString(2, lcCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteLoveCall(Connection conn, String lcCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteLoveCall");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, lcCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertfesart(Connection conn, String fesCode, String atCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertfesart");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fesCode);
			pstmt.setString(2, atCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

}
