package festival.model.service;

import festival.model.dao.FestivalDAO;
import festival.model.vo.Festival;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;

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

	public int getListCount(int category) {
		Connection conn = getConnection();
		
		int result = new FestivalDAO().getListCount(conn, category);
		
		close(conn);
		return result;
	}

	public LinkedHashMap<Festival, ArrayList<String>> selectList(int currentPage, int category) {
		Connection conn = getConnection();
		
		LinkedHashMap<Festival, ArrayList<String>> map = new FestivalDAO().selectList(conn, currentPage, category);
		
		close(conn);
		return map;
	}

	public int getSearchListCount(String searchType, String searchText) {
		Connection conn = getConnection();
		
		int result = new FestivalDAO().getSearchListCount(conn, searchType, searchText);
		
		close(conn);
		return result;
	}

	public LinkedHashMap<Festival, ArrayList<String>> selectSearchList(int currentPage, String searchType, String searchText) {
		Connection conn = getConnection();
		
		LinkedHashMap<Festival, ArrayList<String>> map = new FestivalDAO().selectSearchList(conn, currentPage, searchType, searchText);
		
		close(conn);
		return map;
	}

	public Festival selectFestival(String fcode) {
		Connection conn = getConnection();
		
		Festival festival = new FestivalDAO().selectFestival(conn, fcode);
		
		return festival;
	}
	
	public ArrayList<String> findArtist(String fcode) {
		Connection conn = getConnection();
		
		ArrayList<String> artistArr = new FestivalDAO().findArtist(conn, fcode);
		
		return artistArr;
	}
	
}
