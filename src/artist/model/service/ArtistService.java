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
import member.model.dao.MemberDAO;

public class ArtistService {

	public int insertArtist(Artist artist) {
		Connection conn = getConnection();
		ArtistDAO atDAO = new ArtistDAO();
		String userCode = artist.getAtCode();		
		
		int result1 = atDAO.insertArtist(conn, artist);
		int result2 = new MemberDAO().updateMemberClass(conn, userCode);
		
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

}
