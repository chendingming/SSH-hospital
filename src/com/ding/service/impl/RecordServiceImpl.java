package com.ding.service.impl;

import com.ding.dao.RecordDao;
import com.ding.entity.Record;
import com.ding.service.RecordService;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Administrator on 2019/11/14 0014.
 */
@Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=true)
public class RecordServiceImpl implements RecordService {
    private RecordDao recordDao;
    public void setRecordDao(RecordDao recordDao) {
        this.recordDao = recordDao;
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void add(Record record) {
        recordDao.add(record);
    }

    @Override
    public Record getByOrderId(int order_id) {
        return recordDao.getByOrderId(order_id);
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void update(Record record) {
        recordDao.update(record);
    }
}
