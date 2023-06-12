package com.tsw.dao;

import java.util.List;
import java.util.Map;

/**
 * 用户Mapper
 * @author LZK
 * @time 2023/6/3 11:38
 */
public interface UserMapper {

    List<Map> queryUser(Map map);
}
