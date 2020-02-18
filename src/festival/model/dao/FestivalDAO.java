package festival.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import festival.model.vo.Festival;

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

	public int insertFestival(Connection conn, Festival festival, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFes");
		
		try {
			pstmt = conn.prepareStatement(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}

}
