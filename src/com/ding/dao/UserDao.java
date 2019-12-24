package com.ding.dao;

import com.ding.entity.User;


/**
 * Created by Administrator on 2019/9/4 0004.
 */
public interface UserDao {
    User getByUserName(String user_name);

    void save(User user);

    User getUserById(int user_id);

    int getCount();

    User getByEmail(String email);

    void update(User user);
}
