<%--
  Created by IntelliJ IDEA.
  User: wujiaqin
  Date: 2018/10/17
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8" />
  <title></title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.css">
</head>
<body>

<div class="container">
  <!--<%--顶部信息开始--%>-->
  <div class="col-lg-12" style="background-color: dodgerblue; height: 60px;">
    <h3>个人信息展示页面</h3>
  </div>
  <!--<%--顶部信息开始--%>-->

  <!--<%--内容信息--%>-->
  <div class="container-fluid">
    <div class="row" style="height:530px;">
      <!--<%--左边栏信息开始--%>-->
      <div class="col-lg-2" style="background-color: aliceblue; height: 520px">
        <div style="background-color: aliceblue; height: 50px"></div>
        <div id="memu" style="background-color: aliceblue; height: 400px">
          <ul class="nav nav-stacked" >
            <li><a href="${pageContext.request.contextPath}/user/showUserMessage">个人信息</a></li>
            <li><a href="${pageContext.request.contextPath}/user/orderMessage">订单信息</a></li>
            <li><a href="#">浏览记录</a></li>
            <li><a href="#">密码修改</a></li>
          </ul>
        </div>
      </div>
      <!--<%--左边栏信息结束--%>-->

      <!--<%--主要内容展示开始--%>-->
      <div id="content" class="col-lg-10" style="background-color: white; height: 530px">

        <div style="text-align: center; height: 40px">
          <h3 id="table_title">订单信息</h3>
        </div>
        <div>
          <!--订单信息列表-->
          <div>
            <table id="mytable" align="center" width="80%"></table>
          </div>
        </div>
      </div>
      <!--<%--主要内容展示结束--%>-->
    </div>
  </div>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/locale/bootstrap-table-zh-CN.min.js"></script>
  <script type="text/javascript">

    $(function(){
      //每行点击“取消订单”按钮执行的方法
      window.operateEvents = {
        'click .deleteOrder' :function(e, value, row, index){
          //1.先将选中行在前端隐藏
          var deltr = document.getElementById("mytable").getElementsByTagName("tr")[index+1];
          deltr.style.display = "none";

          //2.发送ajax请求，并将数据库中对应数据删除
          $.post("${pageContext.request.contextPath}/order/deleteOrder",{'oid':row.oid},function(rec){
            if(rec=="ok"){
              alert("删除成功！");
              window.location.reload();			//删除成功后刷新当前页面
            }else{
              alert("删除失败！");
            }
          });
        }
      };

      //给操作列对应的每一行添加“取消订单”按钮
      function operateFormatter(value, row, index) {
        return [
          '<input type="button" value="取消订单" class="deleteOrder btn btn-danger btn-sm">'
        ].join('');
      };

      //使用bootstrap table 创建订单信息列表
      $('#mytable').bootstrapTable({
        columns: [{
          field: 'oid',
          title: '订单',
          width: '10%',
          visible: false
        }, {
          field: 'uid',
          title: '买家',
          width: '15%',
          align: 'center',
          visible: false
        }, {
          field: 'ID',
          title: '订单编号',
          width: '15%',
          align: 'center',
          formatter: function(value, row, index){
            return index+1;
          }
        }, {
          field: 'oqty',
          title: '商品购买数量',
          width: '15%',
          align: 'center'
        }, {
          field: 'pid',
          title: '商品id',
          width: '15%',
          align: 'center'
        }, {
          field: 'ispaid',
          title: '是否已付款',
          width: '20%',
          align: 'center',
          formatter: function(value, row, index){
            if(row.ispaid=='0'){
              return '未支付';
            }else{
              return '已支付';
            }
          }
        }, {
          field: 'button',
          title: '操作',
          width: '20%',
          align: 'center',
          events: operateEvents,
          formatter: operateFormatter
        }],
        url: "${pageContext.request.contextPath}/order/showPageOrders",
        method: "post",

        //分页控件
        pagination: true,                   //是否显示分页（*）
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 5,                       //每页的记录行数（*）
        pageList: [5,10,15,20],
        paginationPreText:"上一页",
        paginationNextText:"下一页",
        //每行样式设置
        striped: true,                      //是否显示行间隔色
        height: 450,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度

      });

    });

  </script>
</body>
</html>
