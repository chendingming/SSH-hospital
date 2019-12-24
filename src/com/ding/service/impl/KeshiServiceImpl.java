package com.ding.service.impl;

import com.ding.dao.KeshiDao;
import com.ding.entity.Keshi;
import com.ding.service.KeshiService;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2019/9/10 0010.
 */
@Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=true)
public class KeshiServiceImpl implements KeshiService {
    private KeshiDao keshiDao;

    public void setKeshiDao(KeshiDao keshiDao) {
        this.keshiDao = keshiDao;
    }

    @Override
    public List<Keshi> getAll() {

        List<Keshi> list=keshiDao.getAll();
        return list;
    }

    @Override
    public Keshi getById(int keshiId) {
        return keshiDao.getById(keshiId);
    }

    @Transactional(readOnly = false)
    @Override
    public void add(Keshi keshi) {
        keshiDao.add(keshi);
    }

    @Transactional(readOnly = false)
    @Override
    public void del(int keshi_id) {
        keshiDao.del(keshi_id);
    }

    @Transactional(readOnly = false)
    @Override
    public void update(Keshi keshi) {
        keshiDao.update(keshi);
    }

    @Override
    public int getCount() {
        return keshiDao.getCount();
    }
}
