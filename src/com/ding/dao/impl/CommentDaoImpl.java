package com.ding.dao.impl;

import com.ding.dao.CommentDao;
import com.ding.entity.Comment;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by Administrator on 2019/11/13 0013.
 */
public class CommentDaoImpl extends HibernateDaoSupport implements CommentDao{
    @Override
    public void add(Comment comment) {
        getHibernateTemplate().save(comment);
    }

    @Override
    public List<Comment> getComment(int id) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Comment>>() {
            @Override
            public List<Comment> doInHibernate(Session session) throws HibernateException {
                String hql="from Comment where doctor_id=? order by id desc";
                Query query=session.createQuery(hql);
                query.setParameter(0,id);
                return query.list();
            }
        });
    }

    @Override
    public List<Comment> getAll() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Comment>>() {
            @Override
            public List<Comment> doInHibernate(Session session) throws HibernateException {
                String hql="from Comment";
                Query query=session.createQuery(hql);
                return query.list();
            }
        });
    }

    @Override
    public void delete(int id) {
        Comment comment=getHibernateTemplate().get(Comment.class,id);
        getHibernateTemplate().delete(comment);
    }
}
