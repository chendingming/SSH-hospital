package com.ding.service;

import com.ding.entity.Comment;

import java.util.List;

/**
 * Created by Administrator on 2019/11/13 0013.
 */
public interface CommentService {
    void add(Comment comment);

    List<Comment> getComment(int id);

    List<Comment> getAllCom();

    void delete(int id);

}
