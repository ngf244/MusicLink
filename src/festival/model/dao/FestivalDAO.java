package festival.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import festival.model.vo.Festival;

import static common.JDBCTemplate.*;

public class FestivalDAO {
	private Properties prop = new Properties();
	
	public FestivalDAO() {
		String fileName = FestivalDAO.class.getResource("/sql/festival/festival-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertFestival(Connection conn, Festival festival) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertFes");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, festival.getFesName());
			pstmt.setString(2, festival.getFesLoc());
			pstmt.setString(3, festival.getFesTerm());
			pstmt.setString(4, festival.getFesInfo());
			pstmt.setString(5, festival.getPayRange());
			pstmt.setInt(6, festival.getRecCount());
			pstmt.setString(7, festival.getRecTerm());
			pstmt.setString(8, festival.getPosPath());
			pstmt.setString(9, festival.getBanPath());
			pstmt.setString(10, festival.getSecOp());
			pstmt.setString(11, festival.getCpCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
