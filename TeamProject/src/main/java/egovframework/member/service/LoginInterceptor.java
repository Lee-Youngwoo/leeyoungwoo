package egovframework.member.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {
	protected Log log = LogFactory.getLog(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("hello");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		System.out.println("prehandle, " + id);
		System.out.println("prehandle, " + name);
		// 이미 로그인된 경우 컨트롤러로 진행
		if (id != null)
			return true;
		// 로그인 페이지로부터 온 경우 컨트롤러로 진행
		String requestURI = request.getRequestURI();
		if (requestURI.endsWith("/loginWrite.do")) {
			return true;
		}
		// 직전 URL 기록
		String urlPrior = requestURI + "?" + request.getQueryString();
//		String urlPrior = requestURI;
		session.setAttribute("url_prior_login", urlPrior);
		System.out.println(session.getAttribute("url_prior_login"));
		response.sendRedirect(request.getContextPath() + "/loginWrite.do");

		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle");
//		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
//		LoginInterceptor.this.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("afterCompletion");
//		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
//		LoginInterceptor.this.afterCompletion(request, response, handler, ex);
	}

}
