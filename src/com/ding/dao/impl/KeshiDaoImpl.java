package com.ding.dao.impl;

import com.ding.dao.KeshiDao;
import com.ding.entity.Keshi;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by Administrator on 2019/9/10 0010.
 */
public class KeshiDaoImpl extends HibernateDaoSupport implements KeshiDao {
    @Override
    public List<Keshi> getAll() {


        return getHibernateTemplate().execute(new HibernateCallback<List<Keshi>>() {
            @Override
            public List<Keshi> doInHibernate(Session session) throws HibernateException {
                String hql="from Keshi";
                Query query=session.createQuery(hql);
                List<Keshi> list=query.list();
                return list;
            }
        });
    }

    @Override
    public Keshi getById(int keshiId) {
        return getHibernateTemplate().get(Keshi.class,keshiId);
    }

    @Override
    public void add(Keshi keshi) {
        getHibernateTemplate().save(keshi);
    }

    @Override
    public void del(int keshi_id) {
        Keshi keshi=getHibernateTemplate().get(Keshi.class,keshi_id);
        getHibernateTemplate().delete(keshi);
    }

    @Override
    public void update(Keshi keshi) {
        getHibernateTemplate().update(keshi);
    }

    @Override
    public int delDoctor(int keshiId) {
        String hql="update Keshi set keshi_doctorNum=keshi_doctorNum-1 where keshi_id=?";
        return getHibernateTemplate().bulkUpdate(hql,keshiId);
    }

    @Override
    public int addDoctor(int keshiId) {
        String hql="update Keshi set keshi_doctorNum=keshi_doctorNum+1 where keshi_id=?";
        return getHibernateTemplate().bulkUpdate(hql,keshiId);
    }

    @Override
    public int getCount() {
        return getHibernateTemplate().execute(new HibernateCallback<Integer>() {
            @Override
            public Integer doInHibernate(Session session) throws HibernateException {
                String hql="select count(*) from Keshi";
                Query query=session.createQuery(hql);
                int i=((Long)query.iterate().next()).intValue();
                return i;
            }
        });
    }

}
