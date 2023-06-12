package com.tsw.pojo;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * 用户实体
 * @author LZK
 * @time 2023/6/3 11:39
 */
public class User {

    private String id;

    private String name;

    private String remark;

    private String password;

    private String dealine;

    public void reset() {
        this.id = " ";
        this.name = " ";
        this.remark = " ";
        this.password = " ";
        this.dealine = " ";
    }

    public void fromMap(Map map) {
        this.id = map.get("id") == null ? " " : String.valueOf(map.get("id"));
        this.name = map.get("name") == null ? " " : String.valueOf(map.get("name"));
        this.remark = map.get("remark") == null ? " " : String.valueOf(map.get("remark"));
        this.password = map.get("password") == null ? " " : String.valueOf(map.get("password"));
        this.dealine = map.get("dealine") == null ? " " : String.valueOf(map.get("dealine"));
    }


    public Map toMap() {
        Map map = new HashMap();
        map.put("id", this.id);
        map.put("name", this.name);
        map.put("remark", this.remark);
        map.put("password", this.password);
        map.put("dealine", this.dealine);
        return map;
    }

    public User() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;
        User user = (User) o;
        return id.equals(user.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDealine() {
        return dealine;
    }

    public void setDealine(String dealine) {
        this.dealine = dealine;
    }

    public String toString(){
        return "id:" + this.id + "name:" + this.name;
    }
}
