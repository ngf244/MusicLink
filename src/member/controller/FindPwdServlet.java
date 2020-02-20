package member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class FindPwdServlet
 */
@WebServlet("/find.pwd")
public class FindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 전달받은 값 인코딩
		// - 전송할 값은 html이 아닌 다른 프로토콜로 전송할 것이기 때문에
		// 현재는 별도 인코딩을 하지 않습니다.
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		Member member = new MemberService().selectMember(id);
        if(member == null || !member.getUserEmail().equals(email))
        {
            request.setAttribute("msg", "아이디나 이메일 정보가 맞지 않습니다");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
            return;
        }

		final String sender = "ngf244@naver.com"; // 보내는 사람 ID (Ex: @naver.com 까지..)
		final String password = "gntod7rlf365"; // 보내는 사람 Password

		String receiver = request.getParameter("email"); // 받는 사용자 (Ex: @naver.com 까지..)
		String title = "비밀번호 발급";
		String contents = member.getUserPwd();
		String host = "smtp.naver.com"; // 사용하는 메일

		System.out.println("---------recv Data Check--------");
		System.out.println("recvID : " + receiver);
		System.out.println("title : " + title);
		System.out.println("content : " + contents);
		System.out.println("--------------------------");

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});

		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(sender));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));

			// sender Email Address
//			message.setFrom("테스트메일 : <" + sender + ">");
			message.setFrom(sender);

			// Subject
			message.setSubject("[MusicLink-Mail-Service] " + title);

			// Text
			message.setText("회원님의 비밀번호는 " + contents + " 입니다.", "UTF-8", "html");

			// send the message
			Transport.send(message);
			System.out.println("전송 완료!!!!");

		} catch (MessagingException e) {
			System.out.println("전송 실패!! ㅠㅠ");
			e.printStackTrace();
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
