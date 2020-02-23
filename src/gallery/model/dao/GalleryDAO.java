package gallery.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.Properties;

import artist.model.dao.ArtistDAO;

public class GalleryDAO {
	
	private Properties prop = new Properties();
	
	public GalleryDAO() {
		String fileName = ArtistDAO.class.getResource("/sql/gallery/gallery-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertVideoLink(String userCode, String videoLink) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertVideoLink");
		return 0;
	}
}
