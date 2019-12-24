package com.ding.dao;

import com.ding.entity.Order;

import java.util.List;

/**
 * Created by Administrator on 2019/9/19 0019.
 */
public interface OrderDao {
    void save(Order order);

    List<Order> getByName(String user_realname);

    void delete(int id);

    List<Order> getByDoctor(int doctor_id);

    List<Order> getByDay(int id, String day);

    int updateState(int order_id,int state);

    List<Order> getByUserId(int user_id);

    Order getByOrderId(int order_id);

    int getCount();

    int getTadayCount(String day,int id);

    List<Order> getAll(int year);

    int getAnnualCount(int year, int i);

    List<Order> getByDayAndDoctor(String date, int doctor_id,int start,int end);

    List<Order> getByDoctorId(int id);
}
