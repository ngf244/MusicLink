package artist.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import artist.model.dao.ArtistDAO;
import artist.model.vo.Artist;
import artist.model.vo.FollowArtist;
import gallery.model.dao.GalleryDAO;
import member.model.dao.MemberDAO;

public class ArtistService {

	public int upgradeArtist(Artist artist) {
		Connection conn = getConnection();
		ArtistDAO atDAO = new ArtistDAO();
		String userCode = artist.getAtCode();		
		
		int result1 = atDAO.upgradeArtist(conn, artist);
		int result2 = new MemberDAO().updateArtistClass(conn, userCode);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn); 
		
		return result1;
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

		int result = aDAO.insertArtist(conn, artist, userId);

		if(result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}

		return result;
	}



	public int insertProfile(String userId, String intro, String artistMedia) {
		Connection conn = getConnection();
		int result = new ArtistDAO().insertProfile(conn, userId, intro, artistMedia);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
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


}
