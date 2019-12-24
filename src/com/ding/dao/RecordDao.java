package com.ding.dao;

import com.ding.entity.Record;

/**
 * Created by Administrator on 2019/11/14 0014.
 */
public interface RecordDao {
    void add(Record record);

    Record getByOrderId(int order_id);

    void update(Record record);
}
