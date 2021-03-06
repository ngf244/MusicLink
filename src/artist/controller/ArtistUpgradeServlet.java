package artist.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import artist.model.service.ArtistService;
import artist.model.vo.Artist;
import common.ATFileRenamePolicy;

/**
 * Servlet implementation class InsertArtistServlet
 */
@WebServlet("/upgrade.at")
public class ArtistUpgradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArtistUpgradeServlet() {
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
			String userCode = multipartRequest.getParameter("userCode");
			String name = multipartRequest.getParameter("artistName");
			int number = Integer.parseInt(multipartRequest.getParameter("number"));
			String debut = multipartRequest.getParameter("debutDate");
			  
			Date sqlDate = null;
			String[] dateArr = debut.split("-");
			int year = Integer.parseInt(dateArr[0]);
			int month = Integer.parseInt(dateArr[1])-1;
			int day = Integer.parseInt(dateArr[2]);
			
			if(debut != "") {
				sqlDate = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
			} else {
				sqlDate = new Date(new GregorianCalendar().getTimeInMillis());
			}			
			
			String[] genreArr = multipartRequest.getParameterValues("genre");
			
			String genre = "";
			if(genreArr != null) {
				for(int i = 0; i < genreArr.length; i++) {
					if(i == genreArr.length - 1) {
						genre += genreArr[i];
					} else {
						genre += genreArr[i] +" / ";
					}
				}
			}
			
			String gender = multipartRequest.getParameter("artistGender");
			String category = multipartRequest.getParameter("artistCategory");
			
			String atclass = category + "(" + gender + ")";
			
			String local = multipartRequest.getParameter("activeLocal");
			String intro = multipartRequest.getParameter("introduce");
			String info = multipartRequest.getParameter("artistInfo");
			//String activity = multipartRequest.getParameter("activity");
			String[] albumDates = multipartRequest.getParameterValues("albumDate");
			String[] albumTitles = multipartRequest.getParameterValues("albumTitle");
			String[] albumGenres = multipartRequest.getParameterValues("albumGenre");
			String[] albumWriters = multipartRequest.getParameterValues("albumWriter");
			String[] albumSongs = multipartRequest.getParameterValues("albumSong");
			
			String activity = "";
			
			for(int i = 0; i < albumDates.length; i++) {
				activity += albumDates[i] + " ";
				activity += albumTitles[i] + " ";
				activity += albumGenres[i] + " ";
				activity += albumWriters[i] + " ";
				activity += albumSongs[i] + " ";
				
				if(i != albumDates.length - 1) {
					activity += "/";
				}
			}
			
			System.out.println(activity);
			
			String insta = multipartRequest.getParameter("instaURL");
			String twitter = multipartRequest.getParameter("twitterURL");
			String facebook = multipartRequest.getParameter("facebookURL");
			String videoLink = multipartRequest.getParameter("videoLink");
			
			String selfiePath = saveFiles.get(0);
			String activityImgPath = savePath + saveFiles.get(1);
			
			Artist artist = new Artist(userCode, name, number, genre, atclass, selfiePath, intro, info, activity, sqlDate, insta, twitter, facebook);
						
			int result1 = new ArtistService().upgradeArtist(artist);
			int result2 = new ArtistService().insertGalleryBoard(artist);
			int result3 = new ArtistService().insertVideoLink(userCode, videoLink);
			int result4 = new ArtistService().insertGalleryBoard(artist);
			int result5 = new ArtistService().insertActivityImg(userCode, activityImgPath);
			
			HttpSession session = request.getSession();
			
			if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0) {
				System.out.println("아티스트 등록 성공");
				request.setAttribute("saveFileName", saveFiles.get(0));
				session.setAttribute("atFileName", saveFiles.get(0)); 
				
				RequestDispatcher view = request.getRequestDispatcher("myPage.me");
				view.forward(request, response);
				
				//response.sendRedirect("myPage.me");
			} else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				System.out.println("아티스트 등록 실패");
				response.sendRedirect("index.jsp");
			}		
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
