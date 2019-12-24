package com.ding.service;


import com.ding.entity.User;



/**
 * Created by Administrator on 2019/9/4 0004.
 */
public interface UserService {

    User getUserByPassword(User user);

    User getByUserName(String user_name);

    void save(User user);

    User getUserById(int user_id);

    int getCount();

    User getByEmail(String email);

    void update(User user);
}
