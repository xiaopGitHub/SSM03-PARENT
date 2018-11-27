package com.xp.service;

import com.xp.common.JSON;
import com.xp.vo.Comment;

import java.util.List;
import java.util.Map;

/**
 * @author xp
 * @create 2018/11/26  9:44
 * @function 评论接口
 */
public interface ICommentService {

    /*查询所有评论*/
    JSON selectComments(Map<String,Integer> map);

    /*删除指定评论*/
    Integer deleteComment(Integer id);

    /*添加评论*/
    void insertComment(Comment comment);

    /*修改评论*/
    int updateComment(Comment comment);
}
