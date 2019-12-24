package com.ding.service.impl;

import com.ding.dao.UserDao;
import com.ding.entity.User;
import com.ding.service.UserService;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Administrator on 2019/9/5 0005.
 */
@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=true)
public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User getUserByPassword(User user) {

        User existU = userDao .getByUserName(user.getUser_name());


        if(existU==null){
            throw new RuntimeException("用户不存在!");
        }

        if(!existU.getUser_pw().equals(user.getUser_pw())){

            throw new RuntimeException("密码错误!");
        }

        return existU;

    }

    @Override
    public User getByUserName(String user_name) {

        User existU = userDao .getByUserName(user_name);
        return existU;
    }

    @Override
    @Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
    public void save(User user) {
        userDao.save(user);
    }

    @Override
    public User getUserById(int user_id) {
        return userDao.getUserById(user_id);
    }

    @Override
    public int getCount() {
        return userDao.getCount();
    }

    @Override
    public User getByEmail(String email) {
        User existU=userDao.getByEmail(email);
        if(existU==null){
            throw new RuntimeException("您输入的邮箱不存在!");
        }
        return existU;
    }

    @Transactional(readOnly = false)
    @Override
    public void update(User user) {
       userDao.update(user);
    }
}
