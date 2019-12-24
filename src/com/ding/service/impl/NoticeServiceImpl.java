package com.ding.service.impl;

import com.ding.dao.NoticeDao;
import com.ding.entity.Notice;
import com.ding.service.NoticeService;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * Created by Administrator on 2019/9/14 0014.
 */
@Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=true)
public class NoticeServiceImpl implements NoticeService {
    private NoticeDao noticeDao;

    public void setNoticeDao(NoticeDao noticeDao) {
        this.noticeDao = noticeDao;
    }

    @Override
    public List<Notice> getAll() {

        List<Notice> list=noticeDao.getAll();

        return list;
    }

    @Override
    public List<Notice> getById(int id) {
        List<Notice> list=noticeDao.getById(id);
        return list;
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void save(Notice notice) {
        noticeDao.save(notice);
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int stop(int id) {
        return noticeDao.updateState(id,1);
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int start(int id) {
        return noticeDao.updateState(id,0);
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void delete(int id) {
        noticeDao.delete(id);
    }

    @Override
    public List<Notice> adGetAll() {
        return noticeDao.adGetAll();
    }

    @Override
    public int getCount() {
        return noticeDao.getCount();
    }

    @Override
    public Notice getNoticeById(int id) {
        return noticeDao.getNoticeById(id);
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void update(Notice notice) {
        noticeDao.update(notice);
    }
}
