package com.tsw.utils;

import com.tsw.pojo.User;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author LZK
 * @date 2022/12/28 09:16
 */
public class UserSession {
    /**
     * 得到Request 对象
     */
    public static HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }

    /**
     * 得到Response 对象
     */
    public static HttpServletResponse getResponse() {

        return ((ServletWebRequest)RequestContextHolder.getRequestAttributes()).getResponse();
    }

    /**
     * 得到session对象
     */
    public static HttpSession getSession() {
        return getRequest().getSession();
    }

    /**
     * 获取用户对象
     * @return
     */
    public static User getUser(){
        return (User) getSession().getAttribute("user");
    }

    /**
     * 获取用户登陆名称
     */
    public static String getUserName(){
        return getUser().getName();
    }

    /**
     * 获取用户登陆id
     */
    public static String getUserId(){
        return getUser().getId();
    }

    /**
     * 获取用户昵称
     */
    public static String getUserRemark(){
        return getUser().getRemark();
    }
}
