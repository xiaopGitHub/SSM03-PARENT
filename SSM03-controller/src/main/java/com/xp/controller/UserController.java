package com.xp.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xp.common.JSON;
import com.xp.service.ICommentService;
import com.xp.service.IUserService;
import com.xp.vo.Comment;
import com.xp.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author xp
 * @create 2018/11/21  13:03
 * @function 控制层
 */
@Controller
public class UserController {

    @Autowired
    private IUserService userService;
    @Autowired
    private ICommentService commentService;

    @RequestMapping("/loginUser")
    public String checkLogin(@RequestParam("username") String userName, @RequestParam("password") String userPwd, HttpSession session) {
        User user = userService.selectUser(userName, userPwd);
        if (user != null) {
            System.out.println("登录成功");
//            request.getSession().setAttribute("user", user);
            session.setAttribute("user", new User());
            //设置超时无效
            session.setMaxInactiveInterval(-1);
            return "comment_view/comment";
        } else {
            System.out.println("登录失败");
            return "redirect:login.jsp";
        }
    }

    @RequestMapping("/queryComment")
    public @ResponseBody
    JSON queryComment(Integer pageNumber, Integer pageSize) {
        PageHelper.startPage(pageNumber, pageSize, "c_id desc");
        List<Comment> comments = commentService.selectComments();
        PageInfo<Comment> pageInfo=new PageInfo<>(comments);
        JSON json = new JSON(200, "1", pageInfo);
        return json;
    }

    @RequestMapping("/deleteComment")
    public @ResponseBody JSON deleteProduct(@RequestParam("id") Integer id) {
        //接收前端传递的数组@RequestParam("array[]") Integer[] array
        int row=commentService.deleteComment(id);
        JSON json=new JSON(200,"success" ,row );
        return json;
    }

    @RequestMapping("/insertComment")
    public String insertProduct(@ModelAttribute Comment comment) {
        commentService.insertComment(comment);
        return "comment_view/comment";
    }

    @RequestMapping("/updateComment")
    public String updateProduct(@ModelAttribute Comment comment) {
        System.out.println(comment);
        commentService.updateComment(comment);
        /*
        返回值通过视图解析器解析为实际视图,解析器通过prefix+返回值+suffix获取完整视图路径,
        然后做转发处理
         */
        return "comment_view/comment";
    }
}
