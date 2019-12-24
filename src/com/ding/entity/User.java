package com.ding.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by Administrator on 2019/9/4 0004.
 */
public class User {
    private int user_id;
    private String user_name;
    private String user_pw;
    private String user_realname;
    private String user_address;
    private String user_tel;
    private String user_email;
    private String user_del;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_pw() {
        return user_pw;
    }

    public void setUser_pw(String user_pw) {
        this.user_pw = user_pw;
    }

    public String getUser_realname() {
        return user_realname;
    }

    public void setUser_realname(String user_realname) {
        this.user_realname = user_realname;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    public String getUser_tel() {
        return user_tel;
    }

    public void setUser_tel(String user_tel) {
        this.user_tel = user_tel;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_del() {
        return user_del;
    }

    public void setUser_del(String user_del) {
        this.user_del = user_del;
    }
}
