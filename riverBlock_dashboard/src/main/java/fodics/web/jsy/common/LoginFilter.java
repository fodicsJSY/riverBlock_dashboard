package fodics.web.jsy.common;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter(filterName = "loginFilter", urlPatterns = {"/dataSearch/*", "/inundationSetting/*", "/equipmentControl/*", "/outputReport/*"})
public class LoginFilter implements Filter {

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("--- 로그인 필터 생성 ---");
	}

	public void destroy() {
		System.out.println("--- 로그인 필터 파괴 ---");
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 필터링 코드를 작성하는 메서드
		// 1) ServletRequest, ServletResponse를 다운캐스팅
		HttpServletRequest req = (HttpServletRequest)request; 
		HttpServletResponse resp = (HttpServletResponse)response; 
		
		// 2) 다운캐스팅한 HttpServletRequest를 이용해서 HttpSession 얻어오기
		HttpSession session = req.getSession();
		

		
		if(session.getAttribute("loginUser") == null) {
			resp.sendRedirect("/");
		// 4) 로그인 상태인 경우 다음 필터 또는 Dispatcher Servlet으로 전달
		} else {
			chain.doFilter(request, response);
		}
	}



}
