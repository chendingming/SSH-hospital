package com.ding.service.impl;

import com.ding.dao.RoleDao;
import com.ding.entity.Role;
import com.ding.service.RoleService;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2019/11/15 0015.
 */
@Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=true)
public class RoleServiceImpl implements RoleService{
    private RoleDao roleDao;


    public void setRoleDao(RoleDao roleDao) {
        this.roleDao = roleDao;
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void add(Role role) {
        roleDao.add(role);
    }

    @Override
    public List<Role> getList() {
        return roleDao.getList();
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void del(int id) {
        roleDao.delete(id);
    }

    @Override
    public Role getById(int role_id) {
        return roleDao.getById(role_id);
    }

    @Override
    public void update(Role role) {
        roleDao.update(role);
    }
}
