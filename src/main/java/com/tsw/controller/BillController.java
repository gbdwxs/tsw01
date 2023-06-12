package com.tsw.controller;

import com.alibaba.fastjson.JSONObject;
import com.tsw.annotion.LogAnnotion;
import com.tsw.pojo.Bills;
import com.tsw.pojo.Result;
import com.tsw.service.BillService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tsw.utils.UserSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 订单控制层
 * @author LZK
 * @time 2023/6/3 11:36
 */
@Controller
@RequestMapping("/bill")
public class BillController {

    private static final Logger log = LoggerFactory.getLogger(BillController.class);

    @Resource
    private BillService billService;

    Map map = new HashMap();

    @RequestMapping("/query")
    public String query01(Model model) {
        return "query";
    }

    @RequestMapping("/bills")
    public String bills(Model model) {
        return "bills";
    }

    @RequestMapping("/allBill")
    public String list(Model model) {
        return "allBill";
    }

    @RequestMapping("/toAddBill")
    public String toAddPaper() {
        return "addBill";
    }

    @RequestMapping("/addBill")
    public String addPaper(Model model) {
        return "addBill";
    }

    @RequestMapping("/top10")
    public String queryTop10(Model model) {
        return "top10";
    }

    @RequestMapping("/sum")
    public String querySum(Model model) {
        return "sum";
    }

    @RequestMapping("/fx")
    public String queryFx(Model model) {
        return "fx";
    }

    @RequestMapping("/test")
    public String queryTest(Model model) {
        return "test";
    }

    /**
     * 查询订单
     * @author LZK
     * @time 2023/6/3 11:37
     */
    @RequestMapping(value = "/query.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    @ResponseBody
    @LogAnnotion
    public String query(@RequestBody Map map) {
        String startTime = String.valueOf(map.get("startTime"));
        String endTime = String.valueOf(map.get("endTime"));
        int page = Integer.valueOf(String.valueOf(map.get("page")));
        int pageSize = Integer.valueOf(String.valueOf(map.get("pageSize")));
        startTime = startTime.trim();
        endTime = endTime.trim();
        startTime = startTime.replaceAll("-", "");
        endTime = endTime.replaceAll("-", "");
        if (!"".equals(startTime)) {
            map.put("startTime", startTime);
        }
        if (!"".equals(endTime)) {
            map.put("endTime", endTime);
        }
        map.put("userNum",UserSession.getUserId());
        map.put("pageStart", (page - 1) * pageSize);
        map.put("pageEnd", pageSize);
        List<Bills> list = billService.queryAllBillByUserNum(map);
        String amt = billService.querySumAmt(map);
        int count = billService.countAll(map);
        int maxPage = 1;
        if (count != 0) {
            if (count % pageSize == 0) {
                maxPage = count / pageSize;
            } else {
                maxPage = count / pageSize + 1;
            }
        }
        Map result = new HashMap();
        result.put("data", list);
        result.put("sum", amt == null ? 0 : amt);
        result.put("maxPage", maxPage);
        result.put("count", count);
        Result r = new Result();
        r.setMsg("查询成功！");
        r.setData(result);
        return r.sucess();
    }

    /**
     * 新增
     * @author LZK
     * @time 2023/6/3 11:37
     */
    @RequestMapping(value = "/add.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    @ResponseBody
    @LogAnnotion(type = "insert")
    public String add(@RequestBody Map map) {
        List<Map<String,String>> dataList = (List<Map<String,String>>)map.get("data");
        Bills bills = new Bills();
        for(Map<String,String> a : dataList){
            a.put("userNum",UserSession.getUserId());
            billService.addBill(a);
        }
        Result result = new Result();
        result.setMsg("新增成功！");
        return result.sucess();
    }

    /**
     * 删除
     * @author LZK
     * @time 2023/6/3 11:37
     */
    @RequestMapping(value = "/delete.do", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String delete(@RequestParam(value = "id") int id) {
        Bills bill = new Bills();
        bill.setSeqId(id);
        bill.setUserNum(UserSession.getUserId());
        billService.deleteBillById(bill.toMap());
        return new JSONObject().toJSONString();
    }

    /**
     * 查询订单类型
     * @author LZK
     * @time 2023/6/3 11:37
     */
    @RequestMapping(value = "/queryItemType.do", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    @ResponseBody
    @LogAnnotion
    public String queryItemTypes() {
        map = new HashMap();
        JSONObject obj = new JSONObject();
        List<Map> itemTypeList = billService.queryItemTypes(map);
        obj.put("itemTypeList", itemTypeList);
        return obj.toJSONString();
    }
}
