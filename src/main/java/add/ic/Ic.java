package add.ic;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import add.maps.TestMappable;

public class Ic implements HandlerInterceptor{
	@Autowired
	TestMappable tm;
	
	@Override
	public boolean preHandle(HttpServletRequest rq, HttpServletResponse res, Object h)
			throws Exception {
		HttpSession s = rq.getSession();
		Object obj = s.getAttribute("LoginUser");
		Object admins = s.getAttribute("admin");
		System.out.println(obj);
		if(obj == null && admins == null) {
			res.sendRedirect("/the_add/login");		
			return false;
		} else {
		return true;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}