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
 * Servlet implementation class FestivalUpdateServlet
 */
@WebServlet("/update.fes.do")
public class FestivalUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalUpdateServlet() {
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

			String fesCode = multipartRequest.getParameter("fesCode");
			String fesName = multipartRequest.getParameter("fesName");
			
			String zonecodeInput = multipartRequest.getParameter("zonecodeInput");
			String addressInput = multipartRequest.getParameter("addressInput");
			String detailAddressInput = multipartRequest.getParameter("detailAddressInput");
			String fesLoc = zonecodeInput + "&" + addressInput + "/" + detailAddressInput;
	
			String fesTerm = multipartRequest.getParameter("feativalDate");
			if(fesTerm == null) fesTerm = multipartRequest.getParameter("hide_feativalDate");
			String fesInfo = multipartRequest.getParameter("festivalInfo");
			
			int minPay = Integer.parseInt(multipartRequest.getParameter("moneyMin"));
			int maxPay = Integer.parseInt(multipartRequest.getParameter("moneyMax"));
			String payRange = minPay + "~" + maxPay;
			
			int recCount = Integer.parseInt(multipartRequest.getParameter("needCount"));
			String recTerm = multipartRequest.getParameter("artistStrDate") + " - " + multipartRequest.getParameter("artistEndDate");
			
			String postri = multipartRequest.getParameter("postri");
			String bantri = multipartRequest.getParameter("bantri");
			
			String banPath = "";
			String posPath = "";
			
			if(bantri.equals("true")) {
				banPath = saveFiles.get(0);
				
				File deleteFile = new File(savePath + multipartRequest.getParameter("oriban"));
				deleteFile.delete();
			} else if(bantri.equals("delete")) {
				banPath = null;
				
				File deleteFile = new File(savePath + multipartRequest.getParameter("oriban"));
				deleteFile.delete();
			} else {
				banPath = multipartRequest.getParameter("oriban");
			}
			
			if(postri.equals("true")) {
				if(saveFiles.size() == 1) posPath = saveFiles.get(0);
				else posPath = saveFiles.get(1);
				
				File deleteFile = new File(savePath + multipartRequest.getParameter("oripos"));
				deleteFile.delete();
			} else {
				posPath = multipartRequest.getParameter("oripos");
			}
			
			String secOp = multipartRequest.getParameter("secretOp");
			if(secOp == null) secOp = "N";
			else if(secOp.equals("on")) secOp = "Y";
			
			String ticFreeOp = "";
			String ticUrl = "";
			int ticFee = 0;
			String status = multipartRequest.getParameter("status");
			if(status.equals("true")) {
				ticFreeOp = multipartRequest.getParameter("freeChk");
				if(ticFreeOp == null) ticFreeOp = "N";
				else if(ticFreeOp.equals("on")) ticFreeOp = "Y";
				
				if(ticFreeOp.equals("N")) {
					if(multipartRequest.getParameter("inputfee") != null) {
						ticFee = Integer.parseInt(multipartRequest.getParameter("inputfee"));
					}
				}
				
				ticUrl = multipartRequest.getParameter("inputurl");
			}
			
			String userCode = ((Member)request.getSession().getAttribute("loginUser")).getUserCode();
			
			Festival festival = null;
			if(status.equals("true")) {
				System.out.println(fesName + ", " + fesLoc + ", " + fesTerm + ", " + fesInfo + ", " + payRange + ", " + recCount + ", " + recTerm + ", "
						+ posPath + ", " + banPath + ", " + ticFreeOp + ", " + ticFee + ", " + ticUrl + ", " + secOp);
				festival = new Festival(fesCode, fesName, fesLoc, fesTerm, fesInfo, payRange, recCount, recTerm, posPath , banPath, secOp , ticFee, ticUrl, userCode, ticFreeOp);
			} else {
				System.out.println(fesName + ", " + fesLoc + ", " + fesTerm + ", " + fesInfo + ", " + payRange + ", " + recCount + ", " + recTerm + ", "
						+ posPath + ", " + banPath + ", " + secOp);
				festival = new Festival(fesCode, fesName, fesLoc, fesTerm, fesInfo, payRange, recCount, recTerm, posPath , banPath, secOp , userCode);
			}
			
			int result = new FestivalService().updateFestival(festival, status);
			
			if(result > 0) {
				System.out.println("행사 수정 성공");
				response.sendRedirect("list.fes");
			} else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				System.out.println("행사 수정 실패");
				response.sendRedirect("list.fes");
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
