package com.tsw.service;

import java.util.List;
import java.util.Map;

import com.tsw.dao.UserMapper;

public class UserServiceImpl implements UserService {

    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public List<Map> queryUser(Map map) {
        return userMapper.queryUser(map);
    }

}
