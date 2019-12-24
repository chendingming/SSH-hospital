package com.ding.service.impl;

import com.ding.dao.OrderDao;
import com.ding.entity.Order;
import com.ding.service.OrderService;
import com.ding.utils.NumberState;
import com.ding.utils.Time;
import org.aspectj.weaver.ast.Or;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Created by Administrator on 2019/9/19 0019.
 */
@Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=true)
public class OrderServiceImpl implements OrderService {
    OrderDao orderDao;

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    @Override
    @Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
    public void save(Order order) {

        orderDao.save(order);
    }

    @Override
    public List<Order> getByName(String user_realname) {


        List<Order> list=orderDao.getByName(user_realname);

        return list;
    }

    @Override
    @Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
    public void delete(int id) {
        orderDao.delete(id);
    }

    @Override
    public List<Order> getByDoctor(int doctor_id) {
        return orderDao.getByDoctor(doctor_id);
    }

    @Override
    public List<Order> getByDay(int id, String day) {
        return orderDao.getByDay(id,day);
    }

    @Override
    @Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
    public int end(int order_id) {
        return orderDao.updateState(order_id,1);
    }

    @Override
    public List<Order> getByUserId(int user_id) {
        return orderDao.getByUserId(user_id);
    }

    @Override
    public Order getByOrderId(int order_id) {
        return orderDao.getByOrderId(order_id);
    }

    @Override
    public int getCount() {
        return orderDao.getCount();
    }

    @Override
    public int getTadayCount(String day,int id) {
        return orderDao.getTadayCount(day,id);
    }

    @Override
    public Map<String, Integer> getAnnual(int year,int month) {
        Map<String,Integer> map=new LinkedHashMap<>();
        for(int i=1;i<=12;i++){
            int num=0;
            if(i<=month){
                num=orderDao.getAnnualCount(year,i);
            }
            map.put("month"+i,num);
        }
        return map;
    }

    @Override
    public Map<String, Integer> getAnnual(int year) {
        Map<String,Integer> map=new LinkedHashMap<>();
        for(int i=1;i<=12;i++){
            int num=0;
            num=orderDao.getAnnualCount(year,i);
            map.put("month"+i,num);
        }
        return map;
    }

    @Override
    public List<NumberState> getByDayAndDoctor(String date, int doctor_id,String mon) {
        List<NumberState> numberStateList=new LinkedList<>();
        if (mon.equals("上午")){
            String[] time1=new String[]{"09:00-09:15","09:15-09:30","09:30-09:45","09:45-10:00","10:00-10:15","10:15-10:30","10:30-10:45","10:45-11:00","11:00-11:15","11:15-11:30"};
            List<Order> list=orderDao.getByDayAndDoctor(date,doctor_id,1,10);
            for (int i=1;i<=10;i++){
                NumberState numberState=new NumberState();
                numberState.setNumber(i);
                numberState.setState(0);
                numberState.setTime(time1[i-1]);
                for (int j=0;j<list.size();j++){
                    Order order= list.get(j);
                    if(order.getNumber()==i){
                        numberState.setState(1);
                    }
                }
                numberStateList.add(numberState);
            }
        }else if(mon.equals("下午")){
            String[] time2=new String[]{"14:30-14:45","14:45-15:00","15:00-15:15","15:15-15:30","15:30-15:45","15:45-16:00","16:00-16:15","16:15-16:30","16:30-16:45","16:45-17:00"};
            List<Order> list=orderDao.getByDayAndDoctor(date,doctor_id,11,20);
            for (int i=11;i<=20;i++){
                NumberState numberState=new NumberState();
                numberState.setNumber(i);
                numberState.setState(0);
                numberState.setTime(time2[i-11]);
                for (int j=0;j<list.size();j++){
                    Order order= list.get(j);
                    if(order.getNumber()==i){
                        numberState.setState(1);
                    }
                }
                numberStateList.add(numberState);
            }
        }else if (mon.equals("晚上")){
            String[] time3=new String[]{"19:00-19:15","19:15-19:30","19:30-19:45","19:45-20:00","20:00-20:15","20:15-20:30"};
            List<Order> list=orderDao.getByDayAndDoctor(date,doctor_id,21,26);
            for (int i=21;i<=26;i++){
                NumberState numberState=new NumberState();
                numberState.setNumber(i);
                numberState.setState(0);
                numberState.setTime(time3[i-21]);
                for (int j=0;j<list.size();j++){
                    Order order= list.get(j);
                    if(order.getNumber()==i){
                        numberState.setState(1);
                    }
                }
                numberStateList.add(numberState);
            }

        }
        return numberStateList;
    }

    @Override
    public List<Order> getByDoctorId(int id) {
        return orderDao.getByDoctorId(id);
    }
}
