package com.tsw.dao;

import com.tsw.pojo.Bills;

import java.util.List;
import java.util.Map;

/**
 * 订单Mapper
 * @author LZK
 * @time 2023/6/3 11:38
 */
public interface BillMapper {

    int addBill(Map map);// 新增

    int deleteBillById(Map map);// 删除

    int updateBills(Map map);// 更新

    Bills queryBillById(Map map);// 查询

    List<Bills> queryAllBillByUserNum(Map map);// 根据用户代码查询账单

    String querySumAmt(Map map);// 查询合计

    int countAll(Map map);// 条数合计

    List<Map> queryItemTypes(Map map);// 查询细分类

}
