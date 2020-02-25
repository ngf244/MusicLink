package festival.controller;

import java.io.File;
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

import festival.FesFileRenamePolicy;
import festival.model.service.FestivalService;
import festival.model.vo.Festival;
import member.model.vo.Member;

/**
 * Servlet implementation class FestivalInsertServlet
 */
@WebServlet("/insert.fes")
public class FestivalInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "festival_uploadFiles/";
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new FesFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();   // 바뀐 파일의 이름을 저장할 ArrayList
			
			Enumeration<String> files = multipartRequest.getFileNames(); // 폼에서 전송된 파일들의 이름을 반환. 반환타입 Enumeration.
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multipartRequest.getFilesystemName(name) != null) {
					saveFiles.add(multipartRequest.getFilesystemName(name));
				}
			}
			
			String fesName = multipartRequest.getParameter("fesName");
			
			String zonecodeInput = multipartRequest.getParameter("zonecodeInput");
			String addressInput = multipartRequest.getParameter("addressInput");
			String detailAddressInput = multipartRequest.getParameter("detailAddressInput");
			String fesLoc = zonecodeInput + "&" + addressInput + "/" + detailAddressInput;
	
			String fesTerm = multipartRequest.getParameter("feativalDate");
			String fesInfo = multipartRequest.getParameter("festivalInfo");
			
			int minPay = Integer.parseInt(multipartRequest.getParameter("moneyMin"));
			int maxPay = Integer.parseInt(multipartRequest.getParameter("moneyMax"));
			String payRange = minPay + "~" + maxPay;
			
			int recCount = Integer.parseInt(multipartRequest.getParameter("needCount"));
			String recTerm = multipartRequest.getParameter("artistDate");
			
			String banPath = "";
			String posPath = "";
			if(saveFiles.size() == 1) {
				posPath = saveFiles.get(0);
			} else {
				banPath = saveFiles.get(0);
				posPath = saveFiles.get(1);
			}
			
			String secOp = multipartRequest.getParameter("secretOp");
			if(secOp == null) secOp = "N";
			else if(secOp.equals("on")) secOp = "Y";
			
			System.out.println(fesName + ", " + fesLoc + ", " + fesTerm + ", " + fesInfo + ", " + payRange + ", " + recCount + ", " + recTerm + ", " + posPath + ", " + banPath + ", " + secOp);
			
			String userCode = ((Member)request.getSession().getAttribute("loginUser")).getUserCode();
			Festival festival = new Festival(fesName, fesLoc, fesTerm, fesInfo, payRange, recCount, recTerm, posPath , banPath, secOp, userCode);
			
			int result = new FestivalService().insertFestival(festival);
			
			if(result > 0) {
				System.out.println("행사 등록 성공");
				response.sendRedirect("index.jsp");
			} else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				System.out.println("행사 등록 실패");
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
