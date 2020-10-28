package cn.akwing.sms.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author c1515
 */

/**
 * 权限拦截器，阻止低权限的用户访问高权限的地址
 */
public class AuthorityInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        int userType = (int) request.getSession().getAttribute("userType");
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        if(userType == 1) {
            return true;
        }else if(userType == 2) {
            if(uri.startsWith(contextPath + "/teacher") || uri.startsWith(contextPath + "/admin")) {
                return false;
            }
            return true;
        } else if(userType == 3) {
            if(uri.startsWith(contextPath + "/teacher") || uri.startsWith(contextPath + "/admin")
                    || uri.startsWith(contextPath + "/student") ) {
                return false;
            }
            return true;
        }

        return true;
    }
}
