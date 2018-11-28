<%--
  Created by IntelliJ IDEA.
  User: 周大爷
  Date: 2018/11/25
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/dist/bootstrap-table.css">
    <script type="text/javascript" src="static/jquery-3.3.1.mini.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="static/dist/bootstrap-table.js" ></script>
    <script src="static/dist/locale/bootstrap-table-zh-CN.js"></script>
</head>
<body>
<div>
    <div class="container">
        <button class="btn btn-default" id="addUser" data-toggle="modal" data-target="#addModal" onclick="refresh()" type="button">添加</button>
        <button class="btn btn-default" id="updUser" onclick="Upd()" type="button">修改</button>
        <button class="btn btn-default" id="del" type="button">删除</button>
    </div>
    <table id="table" style="font-size: 24px;">

    </table>
</div>

<div class="modal fade" id="addModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加博客历史</h4>
            </div>
            <div class="modal-body">
                <form action="" id="form1" method="post" >
                    <table class="table table-bordered">
                        <tr>
                            <td style="width:150px;">博客编号</td>
                            <td>
                                <input type="text" name="bId" id="bId" style="width:150px;" >
                            </td>
                        </tr>
                        <tr>
                            <td>博客内容</td>
                            <td>
                                <textarea name="context" id="context"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>博客类型</td>
                            <td>
                                <input type="text" name="type" id="type" >
                            </td>
                        </tr>
                        <tr>
                            <td>用户编号</td>
                            <td>
                                <input type="text" name="userId" id="userId"  >
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" onclick="add()" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="updModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabe2">修改博客历史</h4>
            </div>
            <div class="modal-body">
                <form action="" id="form2" method="post" >
                    <table class="table table-bordered">
                        <tr>
                            <td style="width:150px;">博客编号</td>
                            <td>
                                <input type="text" id="bId2" name="bId" style="width:150px;" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:150px;">博客内容</td>
                            <td>
                                <textarea name="context" id="context2"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>博客类型</td>
                            <td>
                                <input type="text" id="type2" name="type" >
                            </td>
                        </tr>
                        <tr>
                            <td>用户编号</td>
                            <td>
                                <input type="text" id="userId2" name="userId" >
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="Submit2">提交</button>
            </div>
        </div>
    </div>
</div>
</body>
<script  type="text/javascript">
    $(function(){
        $("#table").bootstrapTable({
            url:"showhistory",
            method: 'post',                      //请求方式（*）
            //toolbar: '#toolbar',                //工具按钮用哪个容器
            contentType: "application/x-www-form-urlencoded",
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            queryParams:queryParam,             //传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                       //初始化加载第一页，默认第一页
            pageSize: 5,                       //每页的记录行数（*）
            pageList: [5, 10, 20, 50],        //可供选择的每页的行数（*）
            showRefresh: true,                  //是否显示刷新按钮
            clickToSelect: true,                 //是否启用点击选中行
            height: 450,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "bid",                     //每一行的唯一标识，一般为主键列
            responseHandler: responseHandler,
            columns: [{
                checkbox:"true",
                field : "box"
            },{
                field: 'bid',
                title: '博客编号'
            },{
                field: 'context',
                title: '博客内容'
            }, {
                field: 'type',
                title: '博客类型'
            }, {
                field: 'userId',
                title: '用户编号'
            },]
        });
        function queryParam(params){
            var param = {
                limit : this.limit, // 页面大小
                offset : this.offset, // 页码
                pageNumber : this.pageNumber,
                pageSize : this.pageSize
            };
            return param;
        }
        function responseHandler(res) {
            console.log(res);
            if (res) {
                return {
                    "rows" : res.result.list,
                    "total" : res.result.total
                };
            } else {
                return {
                    "rows" : [],
                    "total" : 0
                };
            }
        }
    })
    function refresh(){
        $("#form1")[0].reset();
    }
    function add(){
        var blog = $("#form1").serializeArray();
        $.ajax({
            url:"add",
            type:"post",
            dataType:"json",
            data:blog,
            success:function(data){
                if(data.status==200){
                    $("#table").bootstrapTable('refresh');
                    $("#addModal").modal('hide');
                    alert("添加成功!");
                }
            }
        })
    }
    function Upd(){
        //获取选中行的数据
        var rows = $("#table").bootstrapTable('getSelections');
        if(rows.length>1){
            alert("选中一行修改数据");
            return;
        }
        var v = rows[0];
        $("#bId2").val(v.bid);
        $("#context2").val(v.context);
        $("#type2").val(v.type);
        $("#userId2").val(v.userId);
        $("#updModal").modal("show");
    }
    $("#Submit2").click(function(){
        var blog = $("#form2").serializeArray();
        $.ajax({
            url:"upd",
            type:"post",
            dataType:"json",
            data:blog,
            success:function(data){
                if(data.status==200){
                    $("#table").bootstrapTable('refresh');
                    $("#updModal").modal('hide');
                    alert("修改成功!");
                }
            }
        })
    })
    $("#del").click(function(){
        var rows = $("#table").bootstrapTable('getSelections');
        if(rows.length>0){
            var bids ="";
            for(var i=0;i<rows.length;i++){
                if(bids==""){
                    bids= rows[i].bid;
                }
                else{
                    bids=bids+","+rows[i].bid;
                }
            }
            $.ajax({
                url:"del?bids="+bids,
                type:"post",
                dataType:"json",
                success:function(data){
                    if(data.status==200){
                        $("#table").bootstrapTable('refresh');
                        alert("删除成功!");
                    }
                }
            })
        }
        else{
            alert("请选择要删除的行！");
        }
    })
</script>
</html>
