package com.ding.service.impl;

import com.ding.dao.DoctorDao;
import com.ding.dao.KeshiDao;
import com.ding.entity.Doctor;
import com.ding.entity.Keshi;
import com.ding.entity.User;
import com.ding.service.DoctorService;
import com.ding.utils.PageBean;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2019/9/7 0007.
 */
@Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=true)
public class DoctorServiceImpl implements DoctorService{

    private KeshiDao keshiDao;

    private DoctorDao doctorDao;

    public void setKeshiDao(KeshiDao keshiDao) {
        this.keshiDao = keshiDao;
    }

    public void setDoctorDao(DoctorDao doctorDao) {
        this.doctorDao = doctorDao;
    }

    @Override
    public List<Doctor> getAll(DetachedCriteria dc) {

        List<Doctor> list=doctorDao.getAll();
        return list;
    }
    public List<Doctor> getAll() {

        List<Doctor> list = doctorDao.getAll();
        return list;
    }

    @Override
    public List<Doctor> getByKeshi(int keshiId) {

        List<Doctor> list=doctorDao.getByKeshi(keshiId);

        return list;
    }

    @Override
    public PageBean findPageBean(int currentPage, int currentCount) {
        PageBean pageBean=new PageBean();
        pageBean.setCurrentPage(currentPage);
        pageBean.setCurrentCount(currentCount);
        int totalCount=doctorDao.getTotalCount();
        pageBean.setTotalCount(totalCount);
        int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
        pageBean.setTotalPage(totalPage);
        int index = (currentPage-1)*currentCount;
        List<Doctor> doctorList=doctorDao.findDoctorListByPageBean(index,currentCount);
        pageBean.setDoctorList(doctorList);

        return pageBean;
    }

    @Override
    public Doctor getDoctorByPassword(Doctor doctor) {

        Doctor existD = doctorDao .getByDoctorName(doctor.getDoctor_name());


        if(existD==null){
            throw new RuntimeException("该医生不存在!");
        }

        if(!existD.getDoctor_pw().equals(doctor.getDoctor_pw())){

            throw new RuntimeException("密码错误!");
        }

        return existD;
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void save(Doctor doctor) {
        int i=keshiDao.addDoctor(doctor.getKeshiId());
        if (i>0) {
            doctorDao.save(doctor);
        }
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void delete(int id) {
        Doctor doctor=doctorDao.getByDoctorId(id);
        int i=keshiDao.delDoctor(doctor.getKeshi().getKeshi_id());
        if(i>0){
            doctorDao.delete(id);
        }
    }
    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int doctorStart(int id, int del) {
        int i=0;
        i=doctorDao.update(id,del);
        return i;
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int doctorStop(int id, int del) {
        int i=0;
        i=doctorDao.update(id,del);
        return i;
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int changePw(Doctor doctor) {
        int i=doctorDao.changePw(doctor);
        return i;
    }

    @Override
    public Doctor getByDoctorId(int doctor_id) {
        return doctorDao.getByDoctorId(doctor_id);
    }

    @Override
    public int getCount() {
        return doctorDao.getTotalCount();
    }

    @Override
    public List<Doctor> getByName(String doctor_name) {
        return doctorDao.getByName(doctor_name);
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void update(Doctor doctor) {
        doctorDao.update(doctor);
    }

    @Transactional(readOnly = false)
    @Override
    public int updatePw(int id, String doctor_pw) {
        return doctorDao.changePw(id,doctor_pw);
    }
}
