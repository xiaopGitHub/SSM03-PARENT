package com.xp.service.implement;

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
    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> selectComments() {
        return commentMapper.selectComments();
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
        return commentMapper.updateByPrimaryKey(comment);
    }
}
