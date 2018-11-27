package com.xp.dao;

import com.xp.vo.Comment;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface CommentMapper {
    int deleteByPrimaryKey(Integer cId);

    @Insert("insert into comment values(null,#{bId},#{context},#{commentDate})")
    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer cId);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);

    @Select("select * from comment")
    @Results({
            @Result(id = true, column = "c_id", property = "cId"),
            @Result(column = "b_id", property = "bId"),
            @Result(column = "context", property = "context"),
            @Result(column = "comment_date", property = "commentDate"),
    })
    List<Comment> selectComments();

    @Delete("delete from comment where c_id=#{id}")
    int deleteComment(Map<String, Object> map);
}