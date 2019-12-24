package com.ding.dao.impl;

import com.ding.dao.RoleDao;
import com.ding.entity.Role;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by Administrator on 2019/11/15 0015.
 */
public class RoleDaoImpl extends HibernateDaoSupport implements RoleDao {

    @Override
    public void add(Role role) {
        getHibernateTemplate().save(role);
    }

    @Override
    public List<Role> getList() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Role>>() {
            @Override
            public List<Role> doInHibernate(Session session) throws HibernateException {
                String hql="FROM Role";
                Query query=session.createQuery(hql);
                return query.list();
            }
        });
    }

    @Override
    public void delete(int id) {
        getHibernateTemplate().delete(getHibernateTemplate().get(Role.class,id));
    }

    @Override
    public Role getById(int role_id) {
        return getHibernateTemplate().get(Role.class,role_id);
    }

    @Override
    public void update(Role role) {
        getHibernateTemplate().update(role);
    }
}
