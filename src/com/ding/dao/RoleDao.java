package com.ding.dao;

import com.ding.entity.Role;

import java.util.List;

/**
 * Created by Administrator on 2019/11/15 0015.
 */
public interface RoleDao {
    void add(Role role);
    List<Role> getList();

    void delete(int id);

    Role getById(int role_id);

    void update(Role role);
}
