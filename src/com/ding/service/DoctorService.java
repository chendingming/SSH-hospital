package com.ding.service;

import com.ding.entity.Doctor;
import com.ding.utils.PageBean;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

/**
 * Created by Administrator on 2019/9/7 0007.
 */
public interface DoctorService {
    List<Doctor> getAll(DetachedCriteria dc);
    List<Doctor> getAll();
    List<Doctor> getByKeshi(int keshiId);
    PageBean findPageBean(int currentPage, int currentCount);

    Doctor getDoctorByPassword(Doctor doctor);

    void save(Doctor doctor);

    void delete(int id);
    int doctorStart(int id,int del);
    int doctorStop(int id,int del);

    int changePw(Doctor doctor);


    Doctor getByDoctorId(int doctor_id);

    int getCount();

    List<Doctor> getByName(String doctor_name);

    void update(Doctor doctor);

    int updatePw(int id, String doctor_pw);
}
