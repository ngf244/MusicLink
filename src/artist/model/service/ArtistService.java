package artist.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import artist.model.dao.ArtistDAO;
import artist.model.vo.Artist;
import artist.model.vo.ArtistRank;
import artist.model.vo.FollowArtist;
import festival.model.vo.Festival;
import gallery.model.dao.GalleryDAO;
import member.model.dao.MemberDAO;

public class ArtistService {

	public int upgradeArtist(Artist artist) {
		Connection conn = getConnection();
		ArtistDAO atDAO = new ArtistDAO();
		
		int result1 = atDAO.upgradeArtist(conn, artist);
		String userCode = artist.getAtCode();
		int result2 = atDAO.insertAtReq(conn, userCode);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn); 
		
		return result1 * result2;
	}

	public Artist selectArtist(String userCode) {
		Connection conn = getConnection();
		ArtistDAO atDAO = new ArtistDAO();
		
		Artist artist = atDAO.selectArtist(conn, userCode);
		
		if(artist != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return artist;
	}

	public int getFollowListCount(String userCode) {
		Connection conn = getConnection();
		
		int result = new ArtistDAO().getFollowListCount(conn, userCode);
		close(conn);
		
		return result;
	}

	public ArrayList<FollowArtist> selectFollowList(int currentPage, String userCode) {
		Connection conn = getConnection();
		ArrayList<FollowArtist> list = new ArtistDAO().selectFollowList(conn, currentPage, userCode);
		close(conn);
		return list;
	}

	public int insertArtist(Artist artist, String userId) {
		Connection conn = getConnection();
		ArtistDAO aDAO = new ArtistDAO();

		int result1 = aDAO.insertArtist(conn, artist, userId);
		String userCode = aDAO.selectCode(conn, userId);
		int result2 = aDAO.insertAtReq(conn, userCode);

		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1*result2;
	}

	public int insertGalleryBoard(Artist artist) {
		Connection conn = getConnection();
		int result = new ArtistDAO().insertGalleryBoard(conn, artist);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int insertVideoLink(String userCode, String videoLink) {
		Connection conn = getConnection();
		int result = new ArtistDAO().insertVideoLink(conn, userCode, videoLink);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int insertActivityImg(String userCode, String activityImgPath) {
		Connection conn = getConnection();
		int result = new ArtistDAO().insertActivityImg(conn, userCode, activityImgPath);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int unfollowArtist(String userCode, String atCode) {
		Connection conn = getConnection();
		int result = new ArtistDAO().unfollowArtist(conn, userCode, atCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int getFollowAtFesListCount(String userCode) {
		Connection conn = getConnection();
		int result = new ArtistDAO().getFollowAtFesListCount(conn, userCode);
		close(conn);
		return result;
	}

	public LinkedHashMap<Festival, ArrayList<String>> selectFollowAtFesList(int currentPage, String userCode) {
		Connection conn = getConnection();
		LinkedHashMap<Festival, ArrayList<String>> map = new ArtistDAO().selectFollowAtFesList(conn, currentPage, userCode);
		close(conn);
		return map;
  }
  
	public ArrayList<Artist> selectAList() {
		Connection conn = getConnection();
		ArrayList<Artist> list = null;
		
		ArtistDAO dao = new ArtistDAO();
		
		list = dao.selectAList(conn);
				
		return list;
		
	}

	public String selectArtistImg(String userCode) {
		Connection conn = getConnection();
		String fileName = new ArtistDAO().selectArtistImg(conn, userCode);
		close(conn);
		return fileName;
	}

	
	public int insertBoard(Artist artist, String userId) {
		Connection conn = getConnection();
		int result = new ArtistDAO().insertBoard(conn, artist, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int insertProfile1(String userId, String artistPotoFile) {
		Connection conn = getConnection();
		int result = new ArtistDAO().insertProfile1(conn, userId, artistPotoFile);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int insertProfile2(String userId, String videoUrl) {
		Connection conn = getConnection();
		int result = new ArtistDAO().insertProfile2(conn, userId, videoUrl);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public ArrayList<Artist> getArtistList(int currentPage, String Genre) {
		Connection conn = getConnection();
		
		ArrayList<Artist> arr = new ArtistDAO().getArtistList(conn, currentPage, Genre);
		
		close(conn);
		
		return arr;
	}

	public int getListCount() {
		Connection conn = getConnection();
		
		int result = new ArtistDAO().getListCount(conn);
		
		close(conn);
		
		return result;
	}

	public int getArtistRankListCount() {
		Connection conn = getConnection();
		int result = new ArtistDAO().getArtistRankListCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<ArtistRank> selectAtRankList(int currentPage, String genre) {
		Connection conn = getConnection();
		ArrayList<ArtistRank> rList = new ArtistDAO().selectAtRankList(conn, currentPage, genre);
		close(conn);
		return rList;
	}
}
