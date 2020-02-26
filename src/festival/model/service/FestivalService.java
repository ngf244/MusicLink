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

		close(conn);
		return festival;
	}
	
	public ArrayList<String> findArtist(String fcode) {
		Connection conn = getConnection();
		
		ArrayList<String> artistArr = new FestivalDAO().findArtist(conn, fcode);

		close(conn);
		return artistArr;
	}

	public LinkedHashMap<Festival, ArrayList<String>> selectBannerList() {
		Connection conn = getConnection();
		
		LinkedHashMap<Festival, ArrayList<String>> banMap = new FestivalDAO().selectBannerList(conn);
		
		close(conn);
		return banMap;
	}

	public int getApListCount() {
		Connection conn = getConnection();
		
		int result = new FestivalDAO().getApListCount(conn);
		
		close(conn);
		return result;
	}
	
	public ArrayList<Festival> selectApList(int currentPage, int category) {
		Connection conn = getConnection();
		
		ArrayList<Festival> fArr = new FestivalDAO().selectApList(conn, currentPage, category);
		
		close(conn);
		return fArr;
	}

	public int approachFestival(String usercode, String fescode) {
		Connection conn = getConnection();
		
		int result = new FestivalDAO().approachFestival(conn, usercode, fescode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<String> selectUserApList(String usercode) {
		Connection conn = getConnection();
		
		ArrayList<String> userApList = new FestivalDAO().selectUserApList(conn, usercode);
		
		close(conn);
		return userApList;
	}
	
}
