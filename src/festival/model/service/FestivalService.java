package festival.model.service;

import festival.model.dao.FestivalDAO;
import festival.model.vo.Festival;

import static common.JDBCTemplate.*;

import java.sql.Connection;

public class FestivalService {

	public int insertFestival(Festival festival, String userId) {
		Connection conn = getConnection();
		FestivalDAO fDAO = new FestivalDAO();
		
		int result = fDAO.insertFestival(conn, festival, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
}
