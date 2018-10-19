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
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" id="div1">
                        <h4 class="modal-title" id="myModalLabel">充值</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <form action="#" id="myForm">


                            <div class="form-group">
                                <label for="id">充值账户</label>
                                <input type="text" id="id" name="id" class="form-control" placeholder="请输入账户id">
                            </div>
                            <div class="form-group">
                                <label for="from_balance">充值金额</label>
                                <input type="text" id="from_balance" name="money" class="form-control" placeholder="请输入金额" >
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" id="close" onclick="close()">关闭</button>
                                <button type="submit" class="btn btn-primary" id="save" >提交</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <%--<div class="modal fade" id="TransferModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">--%>
            <%--<div class="modal-dialog" role="document">--%>
                <%--<div class="modal-content">--%>
                    <%--<div class="modal-header" id="div2">--%>
                        <%--<h4 class="modal-title" id="myModalLabel2">充值</h4>--%>
                        <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <%--</div>--%>
                    <%--<div class="modal-body">--%>
                        <%--<form action="#" id="myForm2">--%>


                            <%--<div class="form-group">--%>
                                <%--<label for="id">对方账户id</label>--%>
                                <%--<input type="text" id="id2" name="id" class="form-control" placeholder="请输入账户id">--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="from_balance">充值金额</label>--%>
                                <%--<input type="text" id="from_balance2" name="money" class="form-control" placeholder="请输入金额" >--%>
                            <%--</div>--%>
                            <%--<div class="modal-footer">--%>
                                <%--<button type="button" class="btn btn-default" data-dismiss="modal"id="close" onclick="close()">关闭</button>--%>
                                <%--<button type="submit" class="btn btn-primary" id="save2" >提交</button>--%>
                            <%--</div>--%>
                        <%--</form>--%>
                    <%--</div>--%>

                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>


        <div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i> 支付管理</h1>
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
              <button type="button" class="btn btn-primary" id="recharge" data-toggle="modal" data-target="#myModal">充值</button>
                <button type="button" class="btn btn-danger" id="deleteAll" >批量删除</button>

                <span>账户余额:</span><span id="balance"></span>

              <table id="mytable"></table>
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
        function deleteAll() {
//            var rows = $("#mytable").bootstrapTable('getSelections');
//            $(rows).each(function () {
//                alert(this)
//            })
            alert("hello")

        }
        $("#deleteAll").click(function () {
            var rows = $("#mytable").bootstrapTable('getSelections');
            var idlist = new Array();

            $(rows).each(function () {
               idlist.push(this.id);
           });
            $.ajax({
                url:"deleteAll",
                data:JSON.stringify(idlist),
                type: 'POST',
                dataType: "text",
                contentType: "application/json",
                success:function (result) {
                    alert(result);
                    window.location.reload();
                }
            })
        });
        $("#myForm").validate({
            rules:{
                id:"required",
                money:"required",

            },
            messages:{
                id:"用户id不能为空",
                money:"金额不能为空",

            },
            submitHandler:function () {
                var money = $("#from_balance").val();
                var id = $("#id").val();
                $.ajax({
                    url:"recharge/"+money+"/"+id,
                    type: 'PUT',
                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                    dataType:"text",
                    success:function (result) {
                        alert(result)
                        $("#close").trigger("click");
                        window.location.reload()
                    }

                })

        }});


        function changeDateFormat(cellval) {
            var dateVal = cellval + "";
            if (cellval != null) {
                var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
                var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
                return date.getFullYear() + "-" + month + "-" + currentDate;
            }
        }

        $(function () {
            $.ajax({
                url:"selectBalance",
                type:"GET",
                dataType: "text",
                success:function(result){
                    $("#balance").text(result);
                }
            })
        })


        $(function(){

            //初始化表格
            $("#mytable").bootstrapTable({

                //列参数I
                columns: [{
                    fileid: 'state', checkbox: true

                },{ field: 'id', title: 'ID', align:"center" }, { field: 'fromId', title: '转出ID', align:"center" , align:"center"}, { field: 'toId', title: '转入d' , align:"center"},

                    { field: 'createTime', title: '创建时间', align:"center",formatter:function (value) {
                        return changeDateFormat(value);
                    } },{ field: 'money', title: '金额' , align:"center"},
                    {title:'操作',formatter:function (value,row,index) {
                        var user_json = JSON.stringify(row);
                        return "<button class='btn btn-danger delete_user' onclick='delete_payment("+row.id+")'>删除</button>"
                    }, align:"center"} ],
                //要绑定的数据
                //这里绑定的是死数据，如果使用的客户端分页的json格式：[{},{},{}]
                //如果使用的服务端分页,json格式如下：{total:98,rows:[{},{}]}
                //请求地址

                striped:true,
                url: 'listAll',
                //请求方式
                method: 'post',
//              data: [{ id: 1, name: 'Item 1', price: '$1' }, { id: 2, name: 'Item 2', price: '$2' }, { id: 3, name: 'Item 3', price: '$3' }],
                //打开搜索框

                search: true,
                showColumns:true,
                //按回车键后进行搜索
//              searchOnEnterKey: true,
                //开启分页功能
                pagination: true,
                //第一次加载第一页
                pageNumber: 1,
                //每页显示条数
                pageSize: 5,
                //分页方式：默认客户端分页，修改为服务端分页
                sidePagination: 'server',
                pageList:[3,5,7]
            });
        });
        function delete_payment(id) {
            $.post(
                'deleteRecord/'+id,
                {'_method': 'DELETE'},
                function (message) {
                    alert(message);
                    $('#mytable').bootstrapTable(('refresh'));
                }
            )
        }
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