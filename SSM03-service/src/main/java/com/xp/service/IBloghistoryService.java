package com.xp.service;


import com.xp.vo.Bloghistory;

import java.util.List;

public interface IBloghistoryService {
    int deleteByPrimaryKey(Integer bId);

    int insert(Bloghistory record);

    int insertSelective(Bloghistory record);

    Bloghistory selectByPrimaryKey(Integer bId);

    int updateByPrimaryKeySelective(Bloghistory record);

    int updateByPrimaryKeyWithBLOBs(Bloghistory record);

    int updateByPrimaryKey(Bloghistory record);
    List<Bloghistory> showhistory();
    int deleteManyByPrimaryKey(Integer[] bids);
}
