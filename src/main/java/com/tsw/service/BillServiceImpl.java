package com.tsw.service;

import com.tsw.dao.BillMapper;
import com.tsw.pojo.Bills;

import java.util.List;
import java.util.Map;

public class BillServiceImpl implements BillService {

    private BillMapper billMapper;

    public void setBillMapper(BillMapper billMapper) {
        this.billMapper = billMapper;
    }

    @Override
    public int addBill(Map map) {
        return billMapper.addBill(map);
    }

    @Override
    public int deleteBillById(Map map) {
        return billMapper.deleteBillById(map);
    }

    @Override
    public int updateBills(Map map) {
        return billMapper.updateBills(map);
    }

    @Override
    public Bills queryBillById(Map map) {
        return billMapper.queryBillById(map);
    }

    @Override
    public List<Bills> queryAllBillByUserNum(Map map) {
        return billMapper.queryAllBillByUserNum(map);
    }

    @Override
    public String querySumAmt(Map map) {
        return billMapper.querySumAmt(map);
    }

    @Override
    public int countAll(Map map) {
        return billMapper.countAll(map);
    }

    @Override
    public List<Map> queryItemTypes(Map map) {
        return billMapper.queryItemTypes(map);
    }


}
