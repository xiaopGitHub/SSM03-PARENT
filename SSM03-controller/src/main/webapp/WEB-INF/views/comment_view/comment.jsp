<%--
  Created by IntelliJ IDEA.
  Creater: xp
  Date: 2018/11/20
  Time: 12:30
  Function:SSM分页
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品信息</title>
    <script type="text/javascript" src="static/jquery-3.3.1.mini.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/dist/locale/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript" src="static/dist/bootstrap-table.js"></script>
    <link rel="stylesheet" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/dist/bootstrap-table.css">
</head>
<body>
<div class="container">
    <table id="table">
        <button class="btn btn-default" data-toggle='modal' data-target='#myModal' type="button" style="margin-left: 1085px">添加</button>
    </table>
</div>
<!-- 模态框1（Modal）用于添加评论 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">评论添加</h4>
            </div>
            <div class="modal-body">
                <form action="insertComment" method="post" class="form-horizontal">
                    <div class="form-group" style="margin-top: 5px">
                        <label for="bId1" class="col-sm-2 control-label">博客id</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="bId1" name="bId">
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 5px">
                        <label for="context1" class="col-sm-2 control-label">评论内容</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="context1" name="context">
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 5px">
                        <label for="commentDate1" class="col-sm-2 control-label">评论时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="commentDate1" name="commentDate">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- 模态框2（Modal）用于修改评论 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">商品修改</h4>
            </div>
            <div class="modal-body">
                <form action="updateComment" method="post" class="form-horizontal">
                    <div class="form-group" style="margin-top: 5px">
                        <label for="context2" class="col-sm-2 control-label">博客内容</label>
                        <div class="col-sm-10">
                            <input type="text" hidden id="cid2" name="cId">
                            <input type="text" class="form-control" id="context2" name="context">
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 5px">
                        <label for="commentDate2" class="col-sm-2 control-label">评论日期</label>
                        <div class="col-sm-10">
                            <input type="text" hidden id="id2" name="id">
                            <input type="text" class="form-control" id="commentDate2" name="commentDate">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function(){
        $('#table').bootstrapTable({
            url: 'queryComment',
            method: 'post',                     //请求方式（*）
            // toolbar: '#toolbar',             //工具按钮用哪个容器
            contentType: "application/x-www-form-urlencoded",
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            queryParams:queryParam,				//传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                      //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            showRefresh: true,                  //是否显示刷新按钮
            clickToSelect: true,                //是否启用点击选中行
            height: 500,                        //行高,如果没有设置height属性,表格自动根据记录条数觉得表格高度
            uniqueId: "c_id",                   //每一行的唯一标识,一般为主键列
            responseHandler: responseHandler,

            columns: [{
                checkbox:"true",
                field : "box"
            },{
                field: 'cId',
                title: '评论id',
                visible:false
            },{
                field: 'bId',
                title: '博客id'
            }, {
                field: 'context',
                title: '评论内容'
            }, {
                field: 'commentDate',
                title: '评论时间'
            },
            {field: 'tool',title: '操作', align: 'center',
                formatter:function(value,row,index){
                    var element =
                        "<button class='btn btn-default' data-toggle='modal' data-target='#myModal2' onclick='javascript:updInfo(this)'>编辑</button> "+
                        "<button class='btn btn-default' onclick='javascript:delCom("+row.id+")'>删除</button> ";
                    return element;
                }
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
                    "rows" : res.data.list,
                    "total" : res.data.total
                };
            } else {
                return {
                    "rows" : [],
                    "total" : 0
                };
            }
        }
    })

    //删除
    function delCom(id) {
        //声明一个数组var record_idArray =[1,2,3,4,5,6];  record_idArray.push(value)
        $.ajax({
            url:"deleteComment",
            type:"post",
            dataType:"json",
            data:{"id":id},
            //json传递数组data:{"array":record_idArray},
            success:function(data){
                if(data.status==200){
                    alert("删除成功");
                    $("#table").bootstrapTable('refresh');
                }
            }
        })
    }

    //修改
    function updInfo(obj){
        //获取选中行的数据
        $("#cid2").val($(obj).parents("tr").attr("data-uniqueid"));
        $("#context2").val($(obj).parents("tr").find("td").eq(1).text());
        $("#commentDate2").val($(obj).parents("tr").find("td").eq(2).text());
    }

</script>
</html>
