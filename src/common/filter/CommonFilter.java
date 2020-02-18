package common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class CommonFilter
 */
@WebFilter("/*")
public class CommonFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CommonFilter() {
        // TODO Auto-generated constructor stub
    	System.out.println("CommonFilter �옉�룞");
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		// 1. 酉곗뿉�꽌 �쟾�떖諛쏆� 媛믪뿉 �븳湲��씠 �엳�뒗 寃쎌슦
		request.setCharacterEncoding("UTF-8");
		
		// 2. 酉곕줈 �쟾�떖�븷 媛믪뿉 �븳湲��씠 �엳�뒗 寃쎌슦
//		response.setContentType("text/html; charset=UTF-8");
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
