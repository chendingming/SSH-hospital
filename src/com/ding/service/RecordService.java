package com.ding.service;

import com.ding.entity.Record;

/**
 * Created by Administrator on 2019/11/14 0014.
 */
public interface RecordService {
    void add(Record record);

    Record getByOrderId(int order_id);

    void update(Record record);
}
