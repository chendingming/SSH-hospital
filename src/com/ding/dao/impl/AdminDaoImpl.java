package com.ding.dao.impl;

import com.ding.dao.AdminDao;
import com.ding.entity.Admin;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by Administrator on 2019/10/22 0022.
 */
public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao{
    @Override
    public Admin findByNameAndPw(String userNmae, String userPw) {
        return getHibernateTemplate().execute(new HibernateCallback<Admin>() {
            @Override
            public Admin doInHibernate(Session session) throws HibernateException {
                String hql="from Admin where userName=? and userPw=?";
                Query query=session.createQuery(hql);
                query.setParameter(0,userNmae);
                query.setParameter(1,userPw);
                Admin admin= (Admin) query.uniqueResult();
                return admin;
            }
        });
    }

    @Override
    public void add(Admin admin) {
        getHibernateTemplate().save(admin);
    }

    @Override
    public void updatePw(Admin admin) {
        String hql="update Admin set userPw=? where userId=?";
        getHibernateTemplate().bulkUpdate(hql,admin.getUserPw(),admin.getUserId());
    }

    @Override
    public void deleteById(int userId) {
        Admin admin=getHibernateTemplate().get(Admin.class,userId);
        getHibernateTemplate().delete(admin);
    }

    @Override
    public List<Admin> findAll() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Admin>>() {
            @Override
            public List<Admin> doInHibernate(Session session) throws HibernateException {
                String hql="from Admin";
                Query query=session.createQuery(hql);
                return query.list();
            }
        });
    }

    @Override
    public int updateState(int userId, int i) {
        String hql="update Admin set state=? where userId=?";
        return getHibernateTemplate().bulkUpdate(hql,i,userId);
    }

    @Override
    public Admin getAdminById(int userId) {
        return getHibernateTemplate().get(Admin.class,userId);
    }

    @Override
    public void update(Admin admin) {
        getHibernateTemplate().update(admin);
    }
}
