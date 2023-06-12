package com.tsw.service;

import java.util.List;
import java.util.Map;

public interface BillService {
    int addBill(Map map);// 新增

    int deleteBillById(Map map);// 删除

    int updateBills(Map map);// 更新

    com.tsw.pojo.Bills queryBillById(Map map);// 查询

    List<com.tsw.pojo.Bills> queryAllBillByUserNum(Map map);// 根据用户代码查询账单

    String querySumAmt(Map map);// 查询合计

    int countAll(Map map);// 条数合计

    List<Map> queryItemTypes(Map map);// 查询细分类
}
