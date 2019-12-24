package com.ding.service.impl;

import com.ding.dao.CommentDao;
import com.ding.entity.Comment;
import com.ding.service.CommentService;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2019/11/13 0013.
 */
@Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=true)
public class CommentServiceImpl implements CommentService{
    private CommentDao commentDao;

    public void setCommentDao(CommentDao commentDao) {
        this.commentDao = commentDao;
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void add(Comment comment) {
        commentDao.add(comment);
    }

    @Override
    public List<Comment> getComment(int id) {
        return commentDao.getComment(id);
    }

    @Override
    public List<Comment> getAllCom() {
        return commentDao.getAll();
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public void delete(int id) {
        commentDao.delete(id);
    }

}
