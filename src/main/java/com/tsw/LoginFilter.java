package com.tsw;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 登录过滤器
 * @author LZK
 * @time 2023/6/3 11:39
 */
public class LoginFilter extends Throwable implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) arg0;
        HttpServletResponse response = (HttpServletResponse) arg1;
        HttpSession httpSeesion = request.getSession();
        if (httpSeesion.getAttribute("user") == null && request.getRequestURI().indexOf("login") == -1) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            chain.doFilter(arg0, arg1);
        }
    }

    @Override
    public void destroy() {

    }
}
