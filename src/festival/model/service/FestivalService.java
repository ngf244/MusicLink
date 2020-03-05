package festival.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import festival.model.dao.FestivalDAO;
import festival.model.vo.AppFestival;
import festival.model.vo.Festival;
import member.model.vo.Member;

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

	public int getSearchListCount(int category, String searchType, String searchText) {
		Connection conn = getConnection();
		
		int result = new FestivalDAO().getSearchListCount(conn, category, searchType, searchText);
		
		close(conn);
		return result;
	}

	public LinkedHashMap<Festival, ArrayList<String>> selectSearchList(int currentPage, int category, String searchType, String searchText) {
		Connection conn = getConnection();
		
		LinkedHashMap<Festival, ArrayList<String>> map = new FestivalDAO().selectSearchList(conn, currentPage, category, searchType, searchText);
		
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

	public int getApSearchListCount(String searchType, String searchText) {
		Connection conn = getConnection();
		
		int result = new FestivalDAO().getApSearchListCount(conn, searchType, searchText);
		
		close(conn);
		return result;
	}

	public ArrayList<Festival> selectApSearchList(int currentPage, int category, String searchType, String searchText) {
		Connection conn = getConnection();
		
		ArrayList<Festival> fArr = new FestivalDAO().selectApSearchList(conn, currentPage, category, searchType, searchText);
		
		close(conn);
		return fArr;
	}


	public int selectArtistCount(String fcode) {
		Connection conn = getConnection();
		
		int count = new FestivalDAO().selectArtistCount(conn, fcode);
		
		close(conn);
		return count;
	}

	public int updateFestival(Festival festival, String status) {
		Connection conn = getConnection();
		
		int result = new FestivalDAO().updateFestival(conn, festival, status);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public LinkedHashMap<Festival, ArrayList<String>> selectRandomList(int i) {
		Connection conn = getConnection();
		
		LinkedHashMap<Festival, ArrayList<String>> promMap = new FestivalDAO().selectRandomList(conn, i);
		
		close(conn);
		return promMap;
	}

	public int getGeade(String cpCode) {
		Connection conn = getConnection();
		
		int grade = new FestivalDAO().getGeade(conn, cpCode);
		
		close(conn);
		return grade;
  }
	public LinkedHashMap<Festival, Member> selectMySchedule(String userCode) {
		Connection conn = getConnection();
		LinkedHashMap<Festival, Member> map = new FestivalDAO().selectMySchedule(conn, userCode);
		
		close(conn);
		return map;
	}

	public ArrayList<AppFestival> selectMyAppFesList(String userCode) {
		Connection conn = getConnection();
		ArrayList<AppFestival> afList = new FestivalDAO().selectMyAppFesList(conn, userCode);
		
		close(conn);
		return afList;
	}
	
}
