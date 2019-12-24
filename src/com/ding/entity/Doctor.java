package com.ding.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by Administrator on 2019/9/7 0007.
 */
public class Doctor {
    private int id;
    private int yiyuanId;
    private String doctor_name;
    private String doctor_pw;
    private String doctor_sex;
    private int doctor_age;
    private String shanchang;
    private String leixing;
    private String image;
    private int doctor_del;

    private Keshi keshi;
    private int keshiId;

    public int getKeshiId() {
        return keshiId;
    }

    public void setKeshiId(int keshiId) {
        this.keshiId = keshiId;
    }

    public Keshi getKeshi() {
        return keshi;
    }

    public void setKeshi(Keshi keshi) {
        this.keshi = keshi;
    }

    public int getDoctor_del() {
        return doctor_del;
    }

    public void setDoctor_del(int doctor_del) {
        this.doctor_del = doctor_del;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getYiyuanId() {
        return yiyuanId;
    }

    public void setYiyuanId(int yiyuanId) {
        this.yiyuanId = yiyuanId;
    }

    public String getDoctor_name() {
        return doctor_name;
    }

    public void setDoctor_name(String doctor_name) {
        this.doctor_name = doctor_name;
    }

    public String getDoctor_pw() {
        return doctor_pw;
    }

    public void setDoctor_pw(String doctor_pw) {
        this.doctor_pw = doctor_pw;
    }

    public String getDoctor_sex() {
        return doctor_sex;
    }

    public void setDoctor_sex(String doctor_sex) {
        this.doctor_sex = doctor_sex;
    }

    public int getDoctor_age() {
        return doctor_age;
    }

    public void setDoctor_age(int doctor_age) {
        this.doctor_age = doctor_age;
    }

    public String getShanchang() {
        return shanchang;
    }

    public void setShanchang(String shanchang) {
        this.shanchang = shanchang;
    }

    public String getLeixing() {
        return leixing;
    }

    public void setLeixing(String leixing) {
        this.leixing = leixing;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
