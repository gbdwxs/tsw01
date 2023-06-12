package com.tsw.controller;

import com.tsw.pojo.User;
import com.tsw.service.UserService;
import com.tsw.utils.DateUtils;
import com.tsw.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 登录控制层
 * @author LZK
 * @time 2023/6/3 11:37
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    /**
     * 登录
     * @author LZK
     * @time 2023/6/3 11:38
     */
    @RequestMapping("/login.do")
    public String query01(HttpServletRequest request) {
        Map queryMap = new HashMap();
        String password = request.getParameter("password");
        password = StringUtils.MD5(password);
        queryMap.put("userId", request.getParameter("userId"));
        queryMap.put("password", password);
        List<Map> resultList = userService.queryUser(queryMap);
        if (resultList != null && resultList.size() != 0) {
            User user = new User();
            user.fromMap(resultList.get(0));
            String today = DateUtils.getNowDate();
            String dealine = user.getDealine();
            int days = DateUtils.between(today,dealine);
            if(days < 0){
                throw new RuntimeException("密码到期了！");
            }
            request.getSession().setAttribute("user",user);
            return "../../index";
        } else {
            return "../../login";
        }
    }
}
