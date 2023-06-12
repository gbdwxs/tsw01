package com.tsw.pojo;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * 订单实体类
 *
 * @author liuzhikang
 * @version 1.0
 * @since 2022-03-08
 */
public class Bills {

    private int seqId;// 流水号
    private String userNum;// 用户代码
    private String time;// 时间
    private BigDecimal amt;// 金额
    private String remark;// 描述
    private String itemType;// 细分类代码

    public void fromMap(Map map) {
        this.seqId = map.get("seqId") == null ? -1 : Integer.valueOf(String.valueOf(map.get("seqId")));
        this.userNum = map.get("userNum") == null ? " " : String.valueOf(map.get("userNum"));
        this.time = map.get("time") == null ? " " : String.valueOf(map.get("time"));
        this.amt = map.get("amt") == null ? BigDecimal.ZERO : new BigDecimal(String.valueOf(map.get("amt")));
        this.remark = map.get("remark") == null ? " " : String.valueOf(map.get("remark"));
        this.itemType = map.get("itemType") == null ? " " : String.valueOf(map.get("itemType"));
    }

    public void reset() {
        this.seqId = -1;
        this.userNum = " ";
        this.time = " ";
        this.amt = BigDecimal.ZERO;
        this.remark = " ";
        this.itemType = " ";
    }

    public Map toMap() {
        Map result = new HashMap();

        result.put("seqId", this.seqId);
        result.put("userNum", this.userNum);
        result.put("time", this.time);
        result.put("amt", this.amt);
        result.put("remark", this.remark);
        result.put("itemType", this.itemType);

        return result;
    }

    public Bills() {

    }

    public String getUserNum() {
        return userNum;
    }

    public void setUserNum(String userNum) {
        this.userNum = userNum;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getSeqId() {
        return seqId;
    }

    public void setSeqId(int id) {
        this.seqId = id;
    }

    public BigDecimal getAmt() {
        return amt;
    }

    public void setAmt(BigDecimal amt) {
        this.amt = amt;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getItemType() {
        return itemType;
    }

    public void setItemType(String itemType) {
        this.itemType = itemType;
    }
}
