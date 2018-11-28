package com.xp.service.implement;


import com.xp.dao.BloghistoryMapper;
import com.xp.service.IBloghistoryService;
import com.xp.vo.Bloghistory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BloghistoryServiceImpl implements IBloghistoryService {

    @Autowired
    private BloghistoryMapper bloghistoryMapper;
    public int deleteByPrimaryKey(Integer bId) {
        return bloghistoryMapper.deleteByPrimaryKey(bId);
    }

    public int insert(Bloghistory record) {
        return bloghistoryMapper.insert(record);
    }

    public int insertSelective(Bloghistory record) {
        return bloghistoryMapper.insertSelective(record);
    }

    public Bloghistory selectByPrimaryKey(Integer bId) {
        return bloghistoryMapper.selectByPrimaryKey(bId);
    }

    public int updateByPrimaryKeySelective(Bloghistory record) {
        return bloghistoryMapper.updateByPrimaryKeySelective(record);
    }
    public int deleteManyByPrimaryKey(Integer[] bids) {
        return bloghistoryMapper.deleteManyByPrimaryKey(bids);
    }

    public int updateByPrimaryKeyWithBLOBs(Bloghistory record) {
        return bloghistoryMapper.updateByPrimaryKeyWithBLOBs(record);
    }

    public int updateByPrimaryKey(Bloghistory record) {
        return bloghistoryMapper.updateByPrimaryKey(record);
    }

    public List<Bloghistory> showhistory() {
        return bloghistoryMapper.showhistory();
    }
}
