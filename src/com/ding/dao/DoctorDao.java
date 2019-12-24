package com.ding.dao;

import com.ding.entity.Doctor;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

/**
 * Created by Administrator on 2019/9/7 0007.
 */
public interface DoctorDao {
    List<Doctor> getAll();
    List<Doctor> getAll(DetachedCriteria dc);

    List<Doctor> getByKeshi(int keshiId);

    int getTotalCount();

    List<Doctor> findDoctorListByPageBean(int index, int currentCount);

    Doctor getByDoctorName(String doctor_name);

    void save(Doctor doctor);
    void delete(int id);
    int update(int id,int del);

    int changePw(int id ,String doctor_pw);

    Doctor getByDoctorId(int doctor_id);

    List<Doctor> getByName(String doctor_name);

    void update(Doctor doctor);

    int changePw(Doctor doctor);
}
