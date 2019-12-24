package com.ding.dao.impl;

import com.ding.dao.DoctorDao;
import com.ding.entity.Doctor;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by Administrator on 2019/9/7 0007.
 */
public class DoctorDaoImpl extends HibernateDaoSupport implements DoctorDao {
    @Override
    public List<Doctor> getAll() {

        return getHibernateTemplate().execute(new HibernateCallback<List<Doctor>>() {
            @Override
            public List<Doctor> doInHibernate(Session session) throws HibernateException {
                Criteria criteria=session.createCriteria(Doctor.class);
                return criteria.list();
            }
        });



    }
    public List<Doctor> getAll(DetachedCriteria dc) {

        return getHibernateTemplate().execute(new HibernateCallback<List<Doctor>>() {
            @Override
            public List<Doctor> doInHibernate(Session session) throws HibernateException {
                Criteria c = dc.getExecutableCriteria(session);
                return c.list();
            }
        });
    }

    @Override
    public List<Doctor> getByKeshi(int keshiId) {

        return getHibernateTemplate().execute(new HibernateCallback<List<Doctor>>() {
            @Override
            public List<Doctor> doInHibernate(Session session) throws HibernateException {
                String hql="from Doctor where keshiId=? and doctor_del=0";
                Query query=session.createQuery(hql);
                query.setParameter(0,keshiId);
                List<Doctor> list=query.list();
                return list;
            }
        });
    }

    @Override
    public int getTotalCount() {
        return getHibernateTemplate().execute(new HibernateCallback<Integer>() {
            @Override
            public Integer doInHibernate(Session session) throws HibernateException {
                String hql="select count(*) from Doctor";
                Query query=session.createQuery(hql);
                int i=((Long)query.iterate().next()).intValue();
                return i;
            }
        });



    }

    @Override
    public List<Doctor> findDoctorListByPageBean(int index, int currentCount) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Doctor>>() {
            @Override
            public List<Doctor> doInHibernate(Session session) throws HibernateException {
                String hql="from Doctor where doctor_del=0";
                Query query=session.createQuery(hql);
                query.setFirstResult(index);
                query.setMaxResults(currentCount);
                List<Doctor> list=query.list();
                return list;
            }
        });
    }

    @Override
    public Doctor getByDoctorName(String doctor_name) {
        return getHibernateTemplate().execute(new HibernateCallback<Doctor>() {
            @Override
            public Doctor doInHibernate(Session session) throws HibernateException {
                String hql="from Doctor where doctor_name=?";
                Query query=session.createQuery(hql);
                query.setParameter(0,doctor_name);
                Doctor doctor= (Doctor) query.uniqueResult();
                return doctor;
            }
        });
    }

    @Override
    public void save(Doctor doctor) {
        getHibernateTemplate().save(doctor);
    }

    @Override
    public void delete(int id) {
        Doctor doctor=getHibernateTemplate().get(Doctor.class,id);
        getHibernateTemplate().delete(doctor);
    }

    @Override
    public int update(int id, int del) {
        String hql="update Doctor set doctor_del=? where id=?";
        int i=getHibernateTemplate().bulkUpdate(hql,del,id);
        return i;
    }

    @Override
    public int changePw(int id ,String doctor_pw) {
        String hql="update Doctor set doctor_pw=? where id=?";
        return getHibernateTemplate().bulkUpdate(hql,doctor_pw,id);
    }

    @Override
    public Doctor getByDoctorId(int doctor_id) {
        return getHibernateTemplate().get(Doctor.class,doctor_id);
    }

    @Override
    public List<Doctor> getByName(String doctor_name) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Doctor>>() {
            @Override
            public List<Doctor> doInHibernate(Session session) throws HibernateException {
                String hql="from Doctor where doctor_name like ?";
                Query query=session.createQuery(hql);
                query.setParameter(0,"%"+doctor_name+"%");
                return query.list();
            }
        });
    }

    @Override
    public void update(Doctor doctor) {
        getHibernateTemplate().update(doctor);
    }

    @Override
    public int changePw(Doctor doctor) {
        String hql="update Doctor set doctor_pw=? where id=?";
        return getHibernateTemplate().bulkUpdate(hql,doctor.getDoctor_pw(),doctor.getId());
    }
}
