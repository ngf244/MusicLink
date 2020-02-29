package gallery.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import gallery.model.dao.GalleryDAO;
import gallery.model.vo.Gallery;

public class GalleryService {

	public ArrayList<Gallery> selectMyGalleryList(int currentPage, String userCode) {
		Connection conn = getConnection();
		ArrayList<Gallery> gList = new GalleryDAO().selectMyGalleryList(conn, currentPage, userCode); 
		close(conn);
		return gList;
	}

	public int getMyPostListCount(String userCode) {
		Connection conn = getConnection();
		int result = new GalleryDAO().getMyPostListCount(conn, userCode);
		close(conn);
		return result;
	}

}
