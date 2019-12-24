package com.ding.service;

import com.ding.entity.Keshi;

import java.util.List;

/**
 * Created by Administrator on 2019/9/10 0010.
 */
public interface KeshiService {

    List<Keshi> getAll();

    Keshi getById(int keshiId);

    void add(Keshi keshi);

    void del(int keshi_id);

    void update(Keshi keshi);

    int getCount();
}
