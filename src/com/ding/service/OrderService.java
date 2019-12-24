package com.ding.service;

import com.ding.entity.Order;
import com.ding.utils.NumberState;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2019/9/19 0019.
 */
public interface OrderService {
    void save(Order order);

    List<Order> getByName(String user_realname);

    void delete(int id);

    List<Order> getByDoctor(int doctor_id);

    List<Order> getByDay(int id, String day);

    int end(int order_id);

    List<Order> getByUserId(int user_id);

    Order getByOrderId(int order_id);

    int getCount();

    int getTadayCount(String day,int id);

    Map<String,Integer> getAnnual(int year,int month);

    Map<String,Integer> getAnnual(int year);

    List<NumberState> getByDayAndDoctor(String date, int doctor_id,String mon);

    List<Order> getByDoctorId(int id);
}
