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

        <div style="text-align: center; height: 60px">
          <h3 id="table_title">个人信息</h3>
        </div>
        <div>
          <form  id ='myForm' class="bs-example bs-example-form" role="form">
            <input type="hidden" name="id" class="form-control" id="id" value="${user.id}">
            <input type="hidden" name="password" class="form-control" id="password" value="${user.password}">
            <div class="col-md-offset-3 col-lg-7">
              <div class="form-group" style="height: 60px">
                <label for="username">用户名：</label>
                <span></span>
                <input type="text" name="username" readonly="readonly" class="form-control" id="username" value="${user.username}">
              </div>
            </div>
            <div class="col-md-offset-3 col-lg-7">
              <div class="form-group" style="height: 60px">
                <label for="email">邮箱地址：</label>
                <span></span>
                <input type="text" name="email" class="form-control" id="email" value="${user.email}">
              </div>
            </div>
            <div class="col-md-offset-3 col-lg-7">
              <div class="form-group" style="height: 60px">
                <label for="nickname">昵称：</label>
                <span></span>
                <input type="text" name="nickname" class="form-control" id="nickname" value="${user.nickname}">
              </div>
            </div>
            <div class="col-md-offset-3 col-lg-7">
              <div class="form-group" style="height: 80px">
                <label for="phone">联系方式：</label>
                <span></span>
                <input type="text" name="phone" class="form-control" id="phone" value="${user.phone}">
              </div>
            </div>
            <div class=" col-md-offset-8 col-lg-2" style="height: 100px">
              <button type="submit" class="btn btn-primary btn-lg" id="login_btn">保存修改</button>
            </div>
          </form>
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
      $("#myForm").validate({
        rules:{
          "email":{required:true},
          "nickname":{required:true},
          "phone":{required:true}
        },
        messages:{
          "email":{required:"邮箱不能为空"},
          "nickname":{required:"昵称不能为空"},
          "phone":{required:"联系方式不能为空"}
        },

        submitHandler:function(){
          var param = $("#myForm").serialize();
          $.ajax({
            url: "${pageContext.request.contextPath}/user/modifyUserMessage",
            type: "get",
            dataType: "text",
            data:param,
            success:function(rec){
              if(rec=='ok'){
                alert("修改成功！");
              }else{
                alert("修改失败！");
              }
            }
          });
        }
      });


    });

  </script>
</body>
</html>
