package com.ding.dao.impl;

import com.ding.dao.RecordDao;
import com.ding.entity.Record;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

/**
 * Created by Administrator on 2019/11/14 0014.
 */
public class RecordDaoImpl extends HibernateDaoSupport implements RecordDao {
    @Override
    public void add(Record record) {
        getHibernateTemplate().save(record);
    }

    @Override
    public Record getByOrderId(int order_id) {
        return getHibernateTemplate().execute(new HibernateCallback<Record>() {
            @Override
            public Record doInHibernate(Session session) throws HibernateException {
                String hql="from Record where order_id=?";
                Query query=session.createQuery(hql);
                query.setParameter(0,order_id);
                return (Record) query.uniqueResult();
            }
        });
    }

    @Override
    public void update(Record record) {
        String hql = "update Record set body=?,medical=? where order_id=?";
        getHibernateTemplate().bulkUpdate(hql,record.getBody(),record.getMedical(),record.getOrder_id());
    }
}
