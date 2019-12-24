package com.ding.dao;

import com.ding.entity.Admin;

import java.util.List;

/**
 * Created by Administrator on 2019/10/22 0022.
 */
public interface AdminDao {
    public Admin findByNameAndPw(String userNmae, String userPw);
    public void add(Admin admin);
    public void updatePw(Admin admin);
    public void deleteById(int userId);
    public List<Admin> findAll();

    int updateState(int userId, int i);

    Admin getAdminById(int userId);

    void update(Admin admin);
}
