package festival.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import festival.model.service.FestivalService;
import festival.model.vo.Festival;

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
		
		String fesName = request.getParameter("fesName");
		
		String zonecodeInput = request.getParameter("zonecodeInput");
		String addressInput = request.getParameter("addressInput");
		String detailAddressInput = request.getParameter("detailAddressInput");
		String fesLoc = "(" + zonecodeInput + ")" + addressInput + "/" + detailAddressInput;

		String fesTerm = request.getParameter("feativalDate");
		String fesInfo = request.getParameter("festivalInfo");

		int minPay = Integer.parseInt(request.getParameter("moneyMin"));
		int maxPay = Integer.parseInt(request.getParameter("moneyMax"));
		String payRange = minPay + "~" + maxPay;
		
		int recCount = Integer.parseInt(request.getParameter("needCount"));
		String recTerm = request.getParameter("artistDate");
		
		String posPath = request.getParameter("posterPath");
		String banPath = request.getParameter("bannerPath");
		if(banPath.equals("파일을 선택해주세요")) banPath = "";
		
		String secOp = request.getParameter("secretOp");
		if(secOp == null) secOp = "N";
		else if(secOp.equals("on")) secOp = "Y";
		
		Festival festival = new Festival(fesName, fesLoc, fesTerm, fesInfo, payRange, recCount, recTerm, posPath , banPath, secOp);
		
		//String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String userId = "user01";
		
		int result = new FestivalService().insertFestival(festival, userId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
