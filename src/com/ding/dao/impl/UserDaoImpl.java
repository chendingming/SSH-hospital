package com.ding.dao.impl;

import com.ding.dao.UserDao;
import com.ding.entity.User;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

/**
 * Created by Administrator on 2019/9/5 0005.
 */
public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
    @Override
    public User getByUserName(String user_name) {

        return getHibernateTemplate().execute(new HibernateCallback<User>() {
            @Override
            public User doInHibernate(Session session) throws HibernateException {
                String hql = "from User where user_name = ? ";
                Query query = session.createQuery(hql);
                query.setParameter(0, user_name);
                User user = (User) query.uniqueResult();
                return user;
            }
        });

    }

    @Override
    public void save(User user) {
        getHibernateTemplate().save(user);
    }

    @Override
    public User getUserById(int user_id) {
        return getHibernateTemplate().get(User.class,user_id);
    }

    @Override
    public int getCount() {
        return getHibernateTemplate().execute(new HibernateCallback<Integer>() {
            @Override
            public Integer doInHibernate(Session session) throws HibernateException {
                String hql="select count(*) from User";
                Query query=session.createQuery(hql);
                int i=((Long)query.iterate().next()).intValue();
                return i;
            }
        });
    }

    @Override
    public User getByEmail(String email) {
        return getHibernateTemplate().execute(new HibernateCallback<User>() {
            @Override
            public User doInHibernate(Session session) throws HibernateException {
                String hql="from User where user_email=?";
                Query query=session.createQuery(hql);
                query.setParameter(0,email);
                return (User) query.uniqueResult();
            }
        });
    }

    @Override
    public void update(User user) {
        getHibernateTemplate().update(user);
    }
}
