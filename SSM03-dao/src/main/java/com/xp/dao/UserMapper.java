package com.xp.dao;

import com.xp.vo.User;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    @Select("select * from tbuser where user_name=#{uname} and user_pwd=#{upwd}")
    @Results({
            @Result(id = true, column = "user_id", property = "userId"),
            @Result(column = "user_name", property = "userName"),
            @Result(column = "nick_name", property = "nickName"),
            @Result(column = "create_date", property = "createDate"),
            @Result(column = "last_update_date", property = "lastUpdateDate"),
            @Result(column = "user_pwd", property = "userPwd"),
    })
    User selectUser(Map<String, Object> map);
}