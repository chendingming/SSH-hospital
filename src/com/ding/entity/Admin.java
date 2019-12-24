package com.ding.entity;

/**
 * Created by Administrator on 2019/10/16 0016.
 */
public class Admin {
    private int userId;
    private String userName;
    private String userPw;
    private int state;
    private Role role;
    private int role_id;

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }
}
