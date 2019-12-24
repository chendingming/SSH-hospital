package com.ding.service;

import com.ding.entity.Notice;

import java.util.*;

/**
 * Created by Administrator on 2019/9/14 0014.
 */
public interface NoticeService {
    List<Notice> getAll();

    List<Notice> getById(int id);

    void save(Notice notice);

    public int stop(int id);

    public int start(int id);

    public void delete(int id);

    List<Notice> adGetAll();

    int getCount();

    Notice getNoticeById(int id);

    void update(Notice notice);
}
