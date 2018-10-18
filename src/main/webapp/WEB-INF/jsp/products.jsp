
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
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
    <title>Data Table - Vali Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.css">

    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .error{
            color: red;
        }


    </style>
</head>
<body class="app sidebar-mini rtl">

<!--公-共-部-分-->
<!-- Navbar-->
<!--引入顶部的导航栏-->


<!-- Navbar-->
<div class="Navbaar">

</div>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<div class="Sidebar"></div>

<!--引入侧边栏-->


<!--公-共-部-分-->

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-th-list"></i> 欢迎来到用户管理系统</h1>
            <p>Welcome to Management System</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Tables</li>
            <li class="breadcrumb-item active"><a href="#">Data Table</a></li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <button  class="btn btn-primary btn-sm"  role="button" data-toggle="modal" data-target="#myModal" onclick="clear1()"><span class="am-icon-plus" >新增商品</button>
                    <table id="mytable"></table>
                </div>
            </div>
        </div>
    </div>
<%--添加--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" id="div1">
                    <h4 class="modal-title" id="myModalLabel">添加商品</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/insert" id="Form" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <input type="hidden" id="pid" name="pid" class="form-control"  >
                        </div>

                        <div class="form-group">
                            <input type="hidden" id="uid" name="uid" class="form-control"  value="${sessionUser.id}">
                        </div>

                        <div class="form-group">
                            <label for="ptitle">名称</label>
                            <input type="text" id="ptitle" name="ptitle" class="form-control" placeholder="请输入名称">
                        </div>
                        <div class="form-group">
                            <label for="img">图片</label>
                            <input type="file" id="img" name="img" class="form-control" placeholder="请输入测试图片" >
                        </div>
                        <div class="form-group">
                            <label for="pprice">单价</label>
                            <input type="text" id="pprice" name="pprice" class="form-control" placeholder="请输入单价" >
                        </div>
                        <div class="form-group">
                            <label for="pqty">商品数量</label>
                            <input type="text" id="pqty" name="pqty" class="form-control" placeholder="请输入数量" >
                        </div>

                        <div class="form-group">
                            <label for="pdesc">商品描述</label>
                            <input type="text" id="pdesc" name="pdesc" class="form-control" placeholder="请输入描述" >
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="close1()">关闭</button>
                            <button type="submit" class="btn btn-primary" id="save" >提交</button>
                            <button type="button" class="btn btn-primary" id="update1" style="display: none">修改</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
<%--修改--%>
    <div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" id="div2">
                    <h4 class="modal-title" >修改商品</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <form action="#" id="Form1" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <input type="hidden" id="pid1" name="pid" class="form-control"  >
                        </div>

                        <div class="form-group">
                            <input type="hidden" id="uid1" name="uid" class="form-control"  value="${sessionUser.id}">
                        </div>

                        <div class="form-group">
                            <label for="ptitle">名称</label>
                            <input type="text" id="ptitle1" name="ptitle" class="form-control" placeholder="请输入名称">
                        </div>
                       <%-- <div class="form-group">
                            <label for="img">图片</label>
                            <input type="file" id="img1" name="img" class="form-control" placeholder="请输入测试图片" >
                        </div>--%>
                        <div class="form-group">
                            <label for="pprice">单价</label>
                            <input type="text" id="pprice1" name="pprice" class="form-control" placeholder="请输入单价" >
                        </div>
                        <div class="form-group">
                            <label for="pqty">商品数量</label>
                            <input type="text" id="pqty1" name="pqty" class="form-control" placeholder="请输入数量" >
                        </div>

                        <div class="form-group">
                            <label for="pdesc">商品描述</label>
                            <input type="text" id="pdesc1" name="pdesc" class="form-control" placeholder="请输入描述" >
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>

                            <button type="button" class="btn btn-primary" id="update2" >修改</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>






</main>
<!-- Essential javascripts for application to work-->
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<!-- Data table plugin-->
<%--<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>--%>
<%--<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>--%>
<%--<script type="text/javascript">$('#sampleTable').DataTable();</script>--%>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
<!-- Google analytics script-->
<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<!--引入本页的js文件-->
<script src="http://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
<script src = "js/public.js"></script>

<script type="text/javascript">


    $(function () {

        $('#mytable').bootstrapTable({

            url : '${pageContext.request.contextPath}/jsonObject', // 请求后台的URL（*）
            method : 'post', // 请求方式（*）
            queryParams :queryParams,
            toolbar : '#toolbar', // 工具按钮用哪个容器
            cache: false,

            queryParamsType:'limit',//查询参数组织方式



            striped: true,

            pagination: true,

            searchOnEnterKey: true,

            pageSize: 10,

            pageNumber:1,

            pageList: [5,10,15,20],

            sidePagination:'server',



            search: true,

            showColumns: true,

            showRefresh: false,

            showExport: false,



            search: true,

            clickToSelect: true,

            columns:

                [

                    {field:"checked",checkbox:true},

                    {field:"pid",visible:false},

                    {field:"ptitle",title:"商品标题",align:"center",valign:"middle",sortable:"true"},

                    {field:"pimgs",title:"商品图片",align:"center",valign:"middle",sortable:"true",
                        formatter:function (value,row,index) {
                            return "<img height=\"120px\" width=\"120px\" src=${pageContext.request.contextPath}/"+row.pimgs+"></img>";
                        }},

                    {field:"pprice",title:"商品价格",align:"center",valign:"middle",sortable:"true"},

                    {field:"pqty",title:"商品数量",align:"center",valign:"middle",sortable:"true"},

                    {field:"pdesc",title:"商品描述",align:"center",valign:"middle",sortable:"true"},
                    {
                        title: "操作",
                        align: 'center',
                        valign: 'middle',
                        width: 160, // 定义列的宽度，单位为像素px
                        formatter: function (value, row, index) {
                            var obj = JSON.stringify(row);
                            return "<button  class='btn btn-info btn-sm'   data-toggle='modal' data-target='#myModa2' onclick='update(" + obj + ")'>修改</button> <button  class='btn btn-danger btn-sm'    onclick='delete1(" + row.pid + ")'>删除</button> <button  class='btn btn-info btn-sm'  onclick='addproduct( "+ row.pid + ")'>添加购物车</button> "
                        }

                    }



                ],
            silent : true,


        });

    });
    var uidname="${sessionUser.id}";
function queryParams(params) {

    var temp = {
        limit: params.limit,   //页面大小
        offset: params.offset,  //页码
        search:params.search,
        pageSize:this.pageSize,
        pageNumber:this.pageNumber,

        uid:uidname,
    };
    return temp;
};

//修改


    //删除单个
    function delete1(pid) {

        var message ="是否确定删除?"
        if(confirm(message)==true){
            $.ajax({
                url:'${pageContext.request.contextPath}/delete/'+pid,
                type:'delete',
                contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                dataType:'text',
                success:function(rec){
                    if(rec=="success")
                        alert("删除成功")
                    $('#mytable').bootstrapTable('refresh',{pageNumber:1});

                }
            })
        }
    }

function addproduct(pid) {
    $.ajax({
        url:'${pageContext.request.contextPath}/addCart/'+pid,
        type:'post',
        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        dataType:'text',
        success:function(rec){
            if(rec=="success")
                alert("添加购物车成功")
            $('#mytable').bootstrapTable(('refresh'));

        }
    })


}

//修改商品
    function update(obj){

        $("#pid1").val(obj.pid)
/*        $("#uid1").val(obj.uid)*/
        $("#ptitle1").val(obj.ptitle)
        $("#pprice1").val(obj.pprice)
        $("#pqty1").val(obj.pqty)
        $("#pdesc1").val(obj.pdesc)
    }

    $("#update2").click(function(){

        var parm =$("#Form1").serialize();

        $.ajax({
            url:'${pageContext.request.contextPath}/update',
            type:'put',
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            data:parm,
            dataType:'text',
            success:function(rec){
                if(rec=="success")
                    alert("修改成功")
                $("#myModa2").modal('hide')
                $('#mytable').bootstrapTable(('refresh'));
            }
        })
    })

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