package common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {
	// 비밀번호 암호화(로그인, 회원가입)
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
		// 이것이 있어야 아래 모든것이 실행됨.
	}
	
	@Override
	public String getParameter(String key) {
		String value = "";
		
		// request객체에 담긴 파라미터 이름(key)이 userPwd, joinUserPwd, newPwd(비밀번호 변경)인 경우 암호화
		if(key != null && (key.equals("user_password") || key.equals("user_pwd") || key.equals("company_pwd") || key.equals("newPwd"))){
			value = getSha512(super.getParameter(key));	// 암호화
		} else {
			value = super.getParameter(key);
			// 암호화 안하겠다 라는 의미. request객체에 담긴 파라미터 key값이 userPwd나 joinUserPwd, newPwd가 아니면 그냥 가져오겠다.
		}
		
		return value;
	}
	
	public static String getSha512(String userPwd) {
		String encPwd = null;
		
		MessageDigest md = null;	// SHA-512방식의 암호화 객체
		
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		byte[] bytes = userPwd.getBytes(Charset.forName("UTF-8"));
		md.update(bytes);
		
		encPwd = Base64.getEncoder().encodeToString(md.digest());
		
		
		return encPwd;
	}
	
}
