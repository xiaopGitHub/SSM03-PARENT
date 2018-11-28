package com.xp.service.implement;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xp.common.JSON;
import com.xp.dao.CommentMapper;
import com.xp.service.ICommentService;
import com.xp.vo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xp
 * @create 2018/11/26  10:03
 * @function 评论实现类
 */
@Service
public class CommentService implements ICommentService {

/*    @Autowired
    private CommentMapper commentMapper;*/

    private final CommentMapper commentMapper;
    @Autowired
    public CommentService(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }

    @Override
    public JSON selectComments(Map<String,Integer> map) {
        PageHelper.startPage(map.get("pageNumber"), map.get("pageSize"), "c_id desc");
        List<Comment> comments=commentMapper.selectComments();
        PageInfo<Comment> pageInfo=new PageInfo<>(comments);
        JSON json = new JSON(200, "1", pageInfo);
        return json;
    }

    @Override
    public Integer deleteComment(Integer id) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        return commentMapper.deleteComment(map);
    }

    @Override
    public void insertComment(Comment comment) {
        Comment c=new Comment();
        c.setbId(comment.getbId());
        c.setContext(comment.getContext());
        c.setCommentDate(comment.getCommentDate());
        commentMapper.insert(c);
    }

    @Override
    public int updateComment(Comment comment) {
        return commentMapper.updateByPrimaryKeySelective(comment);
    }
}
