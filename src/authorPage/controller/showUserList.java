package authorPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import authorPage.model.service.AuthorService;
import member.model.vo.Member;

/**
 * Servlet implementation class showUserList
 */
@WebServlet("/showUserList.au")
public class showUserList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showUserList() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Member> memArr = new AuthorService().selectMember();
		
		ArrayList<Member> normalMem = new ArrayList<Member>();
		ArrayList<Member> artistMem = new ArrayList<Member>();
		ArrayList<Member> companyMem = new ArrayList<Member>();
		
		for(int i = 0; i < memArr.size(); i++) {
			if (memArr.get(i).getUserClass().equals("1")) {
				normalMem.add(memArr.get(i));
			}
			else if (memArr.get(i).getUserClass().equals("2")) {
				artistMem.add(memArr.get(i));
			}
			else if (memArr.get(i).getUserClass().equals("3")) {
				companyMem.add(memArr.get(i));
			}
		}
		
		request.setAttribute("memArr", memArr);
		request.setAttribute("normalMem", normalMem);
		request.setAttribute("artistMem", artistMem);
		request.setAttribute("companyMem", companyMem);
		
		System.out.println(memArr.size());
		
		String path = "views/authorPage/showUserList.jsp";
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
