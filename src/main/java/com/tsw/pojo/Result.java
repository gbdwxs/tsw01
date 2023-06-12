package com.tsw.pojo;

import com.alibaba.fastjson.JSONObject;
import com.tsw.utils.CodeUtils;

import java.util.Map;

/**
 * 统一返回实体
 * @author LZK
 * @time 2023/6/3 11:38
 */
public class Result {

    private Map data;

    private String msg;

    public Result(){

    }

    public Map getData() {
        return data;
    }

    public void setData(Map data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    private String re(int code){
        JSONObject obj = new JSONObject();
        obj.put("code",code);
        obj.put("msg",this.msg);
        obj.put("data",this.data);
        return obj.toJSONString();
    }

    public String fail(){
        return re(CodeUtils.FAIL);
    }

    public String sucess(){
        return re(CodeUtils.SUCCESS);
    }

}
