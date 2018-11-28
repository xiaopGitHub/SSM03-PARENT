package com.xp.dao;


import com.xp.vo.Bloghistory;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BloghistoryMapper {
    int deleteByPrimaryKey(Integer bId);

    int insert(Bloghistory record);

    int insertSelective(Bloghistory record);

    Bloghistory selectByPrimaryKey(Integer bId);

    int updateByPrimaryKeySelective(Bloghistory record);

    int updateByPrimaryKeyWithBLOBs(Bloghistory record);

    int updateByPrimaryKey(Bloghistory record);

    @Select("select * from bloghistory")
    @Results({
            @Result(id=true,column = "b_id",property = "bId"),
            @Result(column = "user_id",property = "userId"),
            @Result(column = "type",property = "type"),
            @Result(column = "context",property = "context")
    })
    List<Bloghistory> showhistory();

    int deleteManyByPrimaryKey(Integer[] bids);
}