<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>Vali Admin - Free Bootstrap 4 Admin Template</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body class="app sidebar-mini rtl">
    <!-- Navbar-->
    <div class="Navbar">

    </div>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
   <div class="Sidebar"></div>

    <main class="app-content">

        <div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i>个人信息</h1>
          <p>welcome</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">

                <!--<%--主要内容展示开始--%>-->
                <div id="content" class="col-lg-10" style="background-color: white; height: 530px">

                    <div style="text-align: center; height: 60px">
                        <h3 id="table_title">个人信息</h3>
                    </div>
                    <div align="center">
                        <form  id ='myForm' class="bs-example bs-example-form" role="form">
                            <input type="hidden" name="id" class="form-control" id="id" value="${user.id}">
                            <input type="hidden" name="password" class="form-control" id="password" value="${user.password}">
                            <div class="col-md-offset-3 col-lg-7">
                                <div class="form-group" style="height: 60px">
                                    <label for="username">用户名：</label>
                                    <span></span>
                                    <input type="text" name="username" readonly="readonly" class="form-control" id="username" value="${sessionUser.username}">
                                </div>
                            </div>
                            <div class="col-md-offset-3 col-lg-7">
                                <div class="form-group" style="height: 60px">
                                    <label for="email">邮箱地址：</label>
                                    <span></span>
                                    <input type="text" name="email" class="form-control" id="email" value="${sessionUser.email}">
                                </div>
                            </div>
                            <div class="col-md-offset-3 col-lg-7">
                                <div class="form-group" style="height: 60px">
                                    <label for="nickname">昵称：</label>
                                    <span></span>
                                    <input type="text" name="nickname" class="form-control" id="nickname" value="${sessionUser.nickname}">
                                </div>
                            </div>
                            <div class="col-md-offset-3 col-lg-7">
                                <div class="form-group" style="height: 80px">
                                    <label for="phone">联系方式：</label>
                                    <span></span>
                                    <input type="text" name="phone" class="form-control" id="phone" value="${sessionUser.phone}">
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
        </div>
      </div>

    </main>
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/plugins/pace.min.js"></script>
    <script src="js/public.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>

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
    <!-- Google analytics script-->
    <script type="text/javascript">
        if(document.location.hostname == 'pratikborsadiya.in') {
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
            ga('create', 'UA-72504830-1', 'auto');
            ga('send', 'pageview');
        }
    </script>
  </body>
</html>