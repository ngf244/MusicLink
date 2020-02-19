package artist.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.ATFileRenamePolicy;

/**
 * Servlet implementation class InsertArtistServlet
 */
@WebServlet("/insert.at")
public class InsertArtistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertArtistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) { // entype이 multipart/form-data로 전송되었는지 확인
			int maxSize = 1024 * 1024 * 10; // 10Mbyte : 전송파일 용량 제한
			String root = request.getSession().getServletContext().getRealPath("/"); // 웹 서버 컨테이너 경로 추출
			String savePath = root + "artistProfile_uploadFiles/";		
		
			MultipartRequest multipartRequest 
				= new MultipartRequest(request, savePath, maxSize, "UTF-8", new ATFileRenamePolicy());
		
			ArrayList<String> saveFiles = new ArrayList<String>();		// 바뀐 파일의 이름을 저장할 ArrayList
			
			Enumeration<String> files = multipartRequest.getFileNames();
			// 폼에서 전송된 파일들의 이름 반환
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multipartRequest.getFilesystemName(name) != null) {
					saveFiles.add(multipartRequest.getFilesystemName(name));
				}
			}			
			
			String name = multipartRequest.getParameter("artistName");
			String number = multipartRequest.getParameter("number");
			String debut = multipartRequest.getParameter("debutDate");
			String[] genre = multipartRequest.getParameterValues("genre");
			String gender = multipartRequest.getParameter("artistGender");
			String category = multipartRequest.getParameter("artistCategory");
			String local = multipartRequest.getParameter("activeLocal");
			String intro = multipartRequest.getParameter("introduce");
			String info = multipartRequest.getParameter("artistInfo");
			String activity = multipartRequest.getParameter("activity");
			String insta = multipartRequest.getParameter("instaURL");
			String twitter = multipartRequest.getParameter("twitterURL");
			String facebook = multipartRequest.getParameter("facebookURL");
			
			String selfiePath = savePath + saveFiles.get(0); 
			
		}	
			
			
			
			
			
			
			
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
