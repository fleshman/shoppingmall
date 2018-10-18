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
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
      <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.css">
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
          <h1><i class="fa fa-dashboard"></i>订单信息</h1>
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


                    <div>
                        <!--订单信息列表-->
                        <div>
                            <table id="mytable" align="center" width="80%"></table>
                        </div>
                    </div>


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
            //每行点击“取消订单”按钮执行的方法
            window.operateEvents = {
                'click .deleteOrder' :function(e, value, row, index){
                    //1.先将选中行在前端隐藏
                    var deltr = document.getElementById("mytable").getElementsByTagName("tr")[index+1];
                    deltr.style.display = "none";

                    //2.发送ajax请求，并将数据库中对应数据删除
                    $.post("${pageContext.request.contextPath}/deleteOrder",{'oid':row.oid},function(rec){
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
                url: "${pageContext.request.contextPath}/showPageOrders",
                method: "post",

                //分页控件
                pagination: true,
                sidePagination: "server",
                pageNumber: 1,
                pageSize: 5,
                pageList: [5,10,15,20],
                paginationPreText:"上一页",
                paginationNextText:"下一页",
                //每行样式设置
                striped: true,
                height: 450,

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