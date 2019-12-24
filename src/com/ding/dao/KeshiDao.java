package com.ding.dao;

import com.ding.entity.Keshi;

import java.util.List;

/**
 * Created by Administrator on 2019/9/10 0010.
 */
public interface KeshiDao {
    List<Keshi> getAll();

    Keshi getById(int keshiId);

    void add(Keshi keshi);


    void del(int keshi_id);

    void update(Keshi keshi);

    int delDoctor(int keshiId);

    int addDoctor(int keshiId);

    int getCount();
}
