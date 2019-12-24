package com.ding.service;

import com.ding.entity.Admin;

import java.util.List;

/**
 * Created by Administrator on 2019/10/23 0023.
 */
public interface AdminService {
    Admin findByNameAndPw(Admin admin);
    void add(Admin admin);
    void updatePw(Admin admin);
    void deleteById(int userId);

    List<Admin> getList();

    int stop(int userId);

    int start(int userId);

    Admin getAdminById(int userId);

    void update(Admin admin);
}
