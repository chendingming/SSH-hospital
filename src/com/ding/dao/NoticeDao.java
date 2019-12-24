package com.ding.dao;

import com.ding.entity.Notice;

import java.util.List;

/**
 * Created by Administrator on 2019/9/14 0014.
 */
public interface NoticeDao {
    public List<Notice> getAll();

    List<Notice> getById(int id);

    void save(Notice notice);

    public int updateState(int id,int state);

    void delete(int id);

    List<Notice> adGetAll();

    int getCount();

    Notice getNoticeById(int id);

    void update(Notice notice);
}
