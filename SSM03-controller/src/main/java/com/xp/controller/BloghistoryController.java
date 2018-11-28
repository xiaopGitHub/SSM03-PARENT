package com.xp.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xp.common.JsonObject;
import com.xp.service.IBloghistoryService;
import com.xp.vo.Bloghistory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BloghistoryController {
    @Autowired
    private IBloghistoryService iBloghistoryService;

    @RequestMapping("/showbh")
    public String showbh(){
        return "showBloghistory";
    }

    @RequestMapping("/showhistory")
    @ResponseBody
    public JsonObject<PageInfo<Bloghistory>> getCommodity(Integer pageNumber, Integer pageSize){
        PageHelper.startPage(pageNumber, pageSize, "b_id desc");
        List<Bloghistory> list =iBloghistoryService.showhistory() ;
        PageInfo<Bloghistory> p = new PageInfo<Bloghistory>(list) ;
        JsonObject<PageInfo<Bloghistory>> json = new JsonObject<PageInfo<Bloghistory>>("ok", 200, p);
        return json;
    }

    @RequestMapping("/add")
    @ResponseBody
    public JsonObject add(Bloghistory bloghistory){
        int  rows = iBloghistoryService.insert(bloghistory);
        JsonObject  json =  null;
        if(rows>0) {
            json =	new JsonObject ("ok", 200);
        }else {
            json =	new JsonObject ("ok", 500);
        }
        return json;
    }
    @RequestMapping("/upd")
    @ResponseBody
    public JsonObject upd(Bloghistory bloghistory){
        int  rows = iBloghistoryService.updateByPrimaryKey(bloghistory);
        JsonObject  json =  null;
        if(rows>0) {
            json =	new JsonObject ("ok", 200);
        }else {
            json =	new JsonObject ("ok", 500);
        }
        return json;
    }
    @RequestMapping("/del")
    @ResponseBody
    public JsonObject del(@RequestParam String bids){
        String [] bid =bids.split(",");
        Integer[] key = new Integer[bid.length];
        for(int i=0;i<bid.length;i++){
            key[i]=Integer.parseInt(bid[i]);
        }
        int  rows = iBloghistoryService.deleteManyByPrimaryKey(key);
        JsonObject  json =  null;
        if(rows>0) {
            json =	new JsonObject ("ok", 200);
        }else {
            json =	new JsonObject ("ok", 500);
        }
        return json;
    }
}
