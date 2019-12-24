package com.ding.action;

import com.ding.entity.Order;
import com.ding.entity.Record;
import com.ding.service.OrderService;
import com.ding.service.RecordService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;


/**
 * Created by Administrator on 2019/11/14 0014.
 */
public class RecordAction extends ActionSupport implements ModelDriven<Record> {
    Record record=new Record();
    RecordService recordService;
    OrderService orderService;

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public void setRecordService(RecordService recordService) {
        this.recordService = recordService;
    }

    public String add() throws Exception{
        Record record1=recordService.getByOrderId(record.getOrder_id());
        if(record1==null){
            recordService.add(record);
        }else {
            recordService.update(record);
        }

        return null;
    }

    public String getByOrderId() throws Exception{
        HttpServletRequest request= ServletActionContext.getRequest();
        int order_id=Integer.parseInt(request.getParameter("order_id"));
        Record record=recordService.getByOrderId(order_id);
        ActionContext.getContext().put("record",record);
        return "show";
    }

    @Override
    public Record getModel() {
        return record;
    }
}
