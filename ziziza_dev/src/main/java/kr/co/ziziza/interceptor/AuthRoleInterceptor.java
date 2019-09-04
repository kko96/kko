package kr.co.ziziza.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthRoleInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
	     // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		Object obj = session.getAttribute("loginUser");
		
		if ( obj == null ){
			// 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
			String url = request.getRequestURI();
			String loginUrl = "/login";
			if(url.indexOf("admin") > 0) loginUrl = "/admin/login";
			if(url.indexOf("manager") > 0) loginUrl = "/manager/login";
			//권한 체크 referer 보내버리기 추가 예정
			response.sendRedirect(loginUrl);
			return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
		}
		
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
}//class end