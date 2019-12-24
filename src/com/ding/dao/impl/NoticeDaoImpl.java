package com.ding.dao.impl;

import com.ding.dao.NoticeDao;
import com.ding.entity.Notice;
import org.hibernate.*;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by Administrator on 2019/9/14 0014.
 */
public class NoticeDaoImpl extends HibernateDaoSupport implements NoticeDao {
    @Override
    public List<Notice> getAll() {

        return getHibernateTemplate().execute(new HibernateCallback<List<Notice>>() {
            @Override
            public List<Notice> doInHibernate(Session session) throws HibernateException {
                String hql="from Notice where state=0 order by time desc";
                Query query=session.createQuery(hql);
                return query.list();
            }
        });

    }



    @Override
    public List<Notice> getById(int id) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Notice>>() {
            @Override
            public List<Notice> doInHibernate(Session session) throws HibernateException {
                String hql="from Notice where id=?";
                Query query=session.createQuery(hql);
                query.setParameter(0,id);
                List<Notice> list=query.list();
                return list;
            }
        });
    }

    @Override
    public void save(Notice notice) {
        getHibernateTemplate().save(notice);
    }

    @Override
    public int updateState(int id, int state) {
        String hql="update Notice set state=? where id=?";
        int i=getHibernateTemplate().bulkUpdate(hql,state,id);
        return i;
    }

    @Override
    public void delete(int id) {
        Notice notice=getHibernateTemplate().get(Notice.class,id);
        getHibernateTemplate().delete(notice);
    }

    @Override
    public List<Notice> adGetAll() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Notice>>() {
            @Override
            public List<Notice> doInHibernate(Session session) throws HibernateException {
                String hql="from Notice";
                Query query=session.createQuery(hql);
                return query.list();
            }
        });
    }

    @Override
    public int getCount() {
        return getHibernateTemplate().execute(new HibernateCallback<Integer>() {
            @Override
            public Integer doInHibernate(Session session) throws HibernateException {
                String hql="select count(*) from Notice";
                Query query=session.createQuery(hql);
                int i=((Long)query.iterate().next()).intValue();
                return i;
            }
        });
    }

    @Override
    public Notice getNoticeById(int id) {
        return getHibernateTemplate().get(Notice.class,id);
    }

    @Override
    public void update(Notice notice) {
        getHibernateTemplate().update(notice);
    }
}
