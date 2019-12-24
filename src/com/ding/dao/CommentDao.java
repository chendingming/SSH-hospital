package com.ding.dao;

import com.ding.entity.Comment;

import java.util.List;

/**
 * Created by Administrator on 2019/11/13 0013.
 */
public interface CommentDao {
    void add(Comment comment);

    List<Comment> getComment(int id);

    List<Comment> getAll();

    void delete(int id);
}
