package festival.model.service;

import festival.model.dao.FestivalDAO;
import festival.model.vo.Festival;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class FestivalService {

	public int insertFestival(Festival festival) {
		Connection conn = getConnection();
		FestivalDAO fDAO = new FestivalDAO();
		
		int result = fDAO.insertFestival(conn, festival);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int getListCount() {
		Connection conn = getConnection();
		
		int result = new FestivalDAO().getListCount(conn);
		
		close(conn);
		return result;
	}

	public ArrayList<Festival> selectList(int currentPage) {
		Connection conn = getConnection();
		
		ArrayList<Festival> list = new FestivalDAO().selectList(conn, currentPage);
		
		close(conn);
		return list;
	}
	
}
