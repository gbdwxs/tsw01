package com.tsw;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录拦截器
 * @author LZK
 * @time 2023/6/3 11:39
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession httpSeesion = request.getSession();
        if (httpSeesion.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return false;
        }
        return true;
    }
}
