package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.CompanyService;
import member.model.vo.Company;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertCompanyServlet
 */
@WebServlet(name="InsertCompanyServlet", urlPatterns="/insert.co")
public class InsertCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCompanyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String companyId = request.getParameter("company_id");
		String userPwd = request.getParameter("company_pwd");
		String companyName = request.getParameter("company_name");
		String address1 = request.getParameter("addressInput");
		String address2 = request.getParameter("detailAddressInput");
		String companyTel = request.getParameter("company_tel");
		String userName = request.getParameter("user_name");
		String userPhone = request.getParameter("user_phone");
		String userEmail = request.getParameter("user_email");
		
		String companyAddress = address1 + "/" + address2;
		
		Member member = new Member(companyId, userPwd, userName, userEmail, userPhone);
		Company company = new Company(companyName, companyAddress, companyTel);
		
		int result = new CompanyService().insertCompany(member, company);
		
		String page = "";
		if(result > 0) {
			page = "index.jsp";
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "기획자회원가입에 실패하였습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
