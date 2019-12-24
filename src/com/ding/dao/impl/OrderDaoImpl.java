package com.ding.dao.impl;

import com.ding.dao.OrderDao;
import com.ding.entity.Order;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by Administrator on 2019/9/19 0019.
 */
public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao {
    @Override
    public void save(Order order) {
        getHibernateTemplate().save(order);
    }

    @Override
    public List<Order> getByName(String user_realname) {

        return getHibernateTemplate().execute(new HibernateCallback<List<Order>>() {
            @Override
            public List<Order> doInHibernate(Session session) throws HibernateException {
                Criteria c = session.createCriteria(Order.class,user_realname);
                return c.list();
            }
        });

    }

    @Override
    public void delete(int id) {

        Order order=getHibernateTemplate().get(Order.class,id);
        getHibernateTemplate().delete(order);
    }

    @Override
    public List<Order> getByDoctor(int doctor_id) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Order>>() {
            @Override
            public List<Order> doInHibernate(Session session) throws HibernateException {
                String hql="from Order where doctor_id=?";
                Query query=session.createQuery(hql);
                query.setParameter(0,doctor_id);
                List<Order> list=query.list();
                return list;
            }
        });
    }

    @Override
    public List<Order> getByDay(int id, String day) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Order>>() {
            @Override
            public List<Order> doInHibernate(Session session) throws HibernateException {
                String hql="from Order where doctor_id=? and date=? order by number";
                Query query=session.createQuery(hql);
                query.setParameter(0,id);
                query.setParameter(1,day);
                return query.list();
            }
        });
    }

    @Override
    public int updateState(int order_id,int state) {
        String hql="update Order set state=? where order_id=?";
        return getHibernateTemplate().bulkUpdate(hql,state,order_id);
    }

    @Override
    public List<Order> getByUserId(int user_id) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Order>>() {
            @Override
            public List<Order> doInHibernate(Session session) throws HibernateException {
                String hql="from Order where user_id=? order by order_id desc";
                Query query=session.createQuery(hql);
                query.setParameter(0,user_id);
                return query.list();
            }
        });
    }

    @Override
    public Order getByOrderId(int order_id) {
        return getHibernateTemplate().get(Order.class,order_id);
    }

    @Override
    public int getCount() {
        return getHibernateTemplate().execute(new HibernateCallback<Integer>() {
            @Override
            public Integer doInHibernate(Session session) throws HibernateException {
                String hql="select count(*) from Order";
                Query query=session.createQuery(hql);
                int i=((Long)query.iterate().next()).intValue();
                return i;
            }
        });
    }

    @Override
    public int getTadayCount(String day,int id) {
        return getHibernateTemplate().execute(new HibernateCallback<Integer>() {
            @Override
            public Integer doInHibernate(Session session) throws HibernateException {
                String hql="select count(*) from Order where date=? and state=0 and doctor_id=?";
                Query query=session.createQuery(hql);
                query.setParameter(0,day);
                query.setParameter(1,id);
                int i=((Long)query.iterate().next()).intValue();
                return i;
            }
        });
    }

    @Override
    public List<Order> getAll(int year) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Order>>() {
            String start=year+"-1-1";
            String end=year+"-12-31";
            @Override
            public List<Order> doInHibernate(Session session) throws HibernateException {
                String hql="from Order where date between ? and ?";
                Query query=session.createQuery(hql);
                query.setParameter(0,start);
                query.setParameter(1,end);
                return query.list();
            }
        });
    }

    @Override
    public int getAnnualCount(int year, int i) {
        return getHibernateTemplate().execute(new HibernateCallback<Integer>() {
            String start=year+"-"+i+"-1";
            String end=year+"-"+i+"-31";
            @Override
            public Integer doInHibernate(Session session) throws HibernateException {
                String hql="select count(*) from Order where date between ? and ?";
                Query query=session.createQuery(hql);
                query.setParameter(0,start);
                query.setParameter(1,end);
                int i=((Long)query.iterate().next()).intValue();
                return i;
            }
        });
    }

    @Override
    public List<Order> getByDayAndDoctor(String date, int doctor_id,int start,int end) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Order>>() {
            @Override
            public List<Order> doInHibernate(Session session) throws HibernateException {
                String hql="from Order where date=? and doctor_id=? and number between ? and ?";
                Query query=session.createQuery(hql);
                query.setParameter(0,date);
                query.setParameter(1,doctor_id);
                query.setParameter(2,start);
                query.setParameter(3,end);
                return query.list();
            }
        });
    }

    @Override
    public List<Order> getByDoctorId(int id) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Order>>() {
            @Override
            public List<Order> doInHibernate(Session session) throws HibernateException {
                String hql="from Order where doctor_id=? order by date desc";
                Query query=session.createQuery(hql);
                query.setParameter(0,id);
                List<Order> list=query.list();
                return list;
            }
        });
    }
}
