package com.ding.service.impl;

import com.ding.dao.AdminDao;
import com.ding.entity.Admin;
import com.ding.service.AdminService;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2019/10/23 0023.
 */
@Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=true)
public class AdminServiceImpl implements AdminService {
    private AdminDao adminDao;

    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=true)
    public Admin findByNameAndPw(Admin admin) {
        Admin ad = adminDao.findByNameAndPw(admin.getUserName(),admin.getUserPw());
        return ad;
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void add(Admin admin) {
        adminDao.add(admin);
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void updatePw(Admin admin) {
        adminDao.updatePw(admin);
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void deleteById(int userId) {
        adminDao.deleteById(userId);
    }

    @Override
    public List<Admin> getList() {
        return adminDao.findAll();
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int stop(int userId) {
        return adminDao.updateState(userId,1);
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int start(int userId) {
        return adminDao.updateState(userId,0);
    }

    @Override
    public Admin getAdminById(int userId) {
        return adminDao.getAdminById(userId);
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void update(Admin admin) {
        adminDao.update(admin);
    }
}
