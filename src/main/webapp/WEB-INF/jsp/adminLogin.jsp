<%--
  Created by IntelliJ IDEA.
  User: wujiaqin
  Date: 2018/10/16
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cmn">
<head>
  <title>管理员登录</title>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
</head>

<body>
<div class="container">
  <div class="col-lg-12" style="background-color: aliceblue; height: 80px;">
    <h1>登录界面</h1>
  </div>
  <div style="height:100px;"></div>

  <div class="row" style="height:530px;">
    <div class="col-lg-1" ></div>
    <div class="col-lg-6">
      <div>
        <img src="imgs/adminlogin.jpg" style="width:550px; height: 450px"/>
      </div>
    </div>
    <div class="col-lg-5">
      <table border="1px" width="400px" height="450px">
        <tr>
          <td>
            <div style="text-align: center; height: 60px">
              <h3 id="table_title">管理员登录</h3>
            </div>
            <form  id ='myForm' class="bs-example bs-example-form" role="form">
              <div class=" col-md-offset-1 col-lg-10">
                <div class="form-group" style="height: 40px">
                  <span></span>
                  <input type="text" name="username" class="form-control input-lg" id="username" placeholder="请输入用户名">
                </div>
              </div>
              <div class="col-md-offset-1 col-lg-10">
                <div class="form-group" style="height: 80px" id="password_div">
                  <span></span>
                  <input type="password" name="password" class="form-control input-lg" id="password" placeholder="请输入密码">
                </div>
              </div>
              <div class=" col-md-offset-1 col-lg-10" style="height: 100px">
               <%-- <input type="hidden" name="_method" value="GET">--%>
                <button type="submit" class="btn btn-primary btn-lg btn-block" id="login_btn">登录</button>
              </div>
              <div class="col-md-offset-9 col-lg-10" id="register_div">
                <span id="failMessage"></span>
                <a id="user_register">注册</a>
              </div>
            </form>
          </td>
        </tr>
      </table>

    </div>
  </div>

  <div class="col-lg-12" style="background-color: aliceblue; height: 30px;">

  </div>
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

  $(function(){
    $("#myForm").validate({
      rules:{
        "username":{required:true},
        "password":{required:true}
      },
      messages:{
        "username":{required:"用户名不能为空"},
        "password":{required:"密码不能为空"}
      },

      submitHandler:function(){
        var param = $("#myForm").serialize();
        $.ajax({
          url: "adminLoginCheck",
          type: "get",
          dataType: "text",
          data:param,
          success:function(rec){
            if(rec=='ok'){
              location.href = "${pageContext.request.contextPath}/userMessage";
            }else{
              $("#failMessage").html("用户名或密码错误！");
            }
          }
        });
      }
    });

    $("#user_register").click(function(){
      location.href = "${pageContext.request.contextPath}/adminRegister";
    });

  });



</script>
</body>
</html>