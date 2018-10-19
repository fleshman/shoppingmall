<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="description"
          content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
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
    <meta property="og:description"
          content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>Vali Admin - Free Bootstrap 4 Admin Template</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.css" rel="stylesheet">
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
            <h1><i class="fa fa-dashboard"></i> 购物车列表</h1>
            <p>review your cart to check your bill</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="#">退出</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div style="float:left;" align="left">
                        <button onclick="payAll()" class="btn btn-primary" data-toggle="modal" data-target="#addModal">
                            全部结算
                        </button>
                        <button type="button" class="btn btn-danger" onclick="deleteAll()">全部删除</button>
                    </div>
                    <table id="mytable"></table>
                </div>
            </div>
        </div>
    </div>
</main>
<!-- Essential javascripts for application to work-->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script type="text/javascript" src="js/plugins/chart.js"></script>
<script src="js/public.js"></script>

<script type="text/javascript">

    $("#mytable").bootstrapTable({
        columns: [{fileld: "status", checkbox: true},
            //{field: "uid", title: "用户编号"},
            {field: "pid", title: "序号",align: "center",valign:"middle"},
            {field: "p.pimgs", title: "产品图片", formatter: function (value, row, index) {
                return "<img height=\"120px\" width=\"120px\" src=${pageContext.request.contextPath}/" + row.p.pimgs + "></img>"
                },align: "center",valign:"middle"
            },
            {field: "p.pdesc", title: "产品名称",align: "center",valign:"middle"},
            {field: "p.pprice", title: "产品价格",align: "center",valign:"middle"},
            {
                field: "count", title: "产品数量", formatter: function (value, row, index) {
                return "<button type='button' rowid=" + row.id + " onclick='reduceCount(this)'>-</button>" +
                    "<input type='text' value=" + row.count + " rowid=" + row.id + " onchange='increaCount_input(this)' name='count' class='count1' style=\"width: 30px;height: 25px\"/>" +
                    "<button type='button' rowid=" + row.id + " onclick='increaseCount(this)'>+</button>"
                },align: "center",valign:"middle"
            },
            {title: "总价", formatter:function (value,row,index) {
                return row.count * row.p.pprice
                },align: "center",valign:"middle"
            },
            //{field:"cid",title:"产品目录"},
            /*{field: "ishot", title: "热门",formatter:function (value,row,index) {
                return (
                row.ishot==1?"热门":"不是热门" )
                }
            },*/
            {
                title: "操作", formatter:
                function (value, row, index) {
                    //var Json_row = JSON.stringify(row);
                    return "<button class='btn btn-info' onclick='payment(" + row.count * row.p.pprice+","+row.pid + ","+row.id+")'>结算</button>" +
                        "<button class='btn btn-danger' onclick='deleteCart(" + row.id + ")'>删除</button>";
                },align: "center",valign:"middle"
            }],
        search: true,
        SearchOnEntryKey: true,
        method: "post",
        pagination: true,
        pageSize: 5,
        pageNumber: 1,
        sidePagination: "server",
        url: "cart",
        striped: true,
//        showColumns:true
        showRefresh: true
    })

</script>

<script type="text/javascript">

    /*$("#mytable").bootstrapTable.function(index,value,row){
    }*/

    function increaCount_input(obj) {
        var id = $(obj).attr("rowid");
        //alert(id)
        //alert($(obj).parent("td").next("td"))
        var num_str = $(obj).val();
        var num = parseInt(num_str);
        var price_str = $(obj).parent("td").prev("td").text();
        var price = parseInt(price_str);
        var totalamout = num * price;

        $(obj).parent("td").next("td").text(totalamout);

        //var num_str = $(obj).val();
        //var num = parseInt(num_str);
        //$(obj).val(num);

        $.post(
            "changeCount",
            {"id": id, "count": num},
            function () {
                //$("#mytable").bootstrapTable("refresh");
            }
        )
    }

    function increaseCount(obj) {
        var id = $(obj).attr("rowid");

        var num_str = $(obj).prev("input").val();
        var num = parseInt(num_str);
        $(obj).prev("input").val(num + 1);
        var price_str = $(obj).parent("td").prev("td").text();
        var price = parseInt(price_str);
        var totalamout = (num+1) * price;
        $(obj).parent("td").next("td").text(totalamout);

        $.post(
            "changeCount",
            {"id": id, "count": num + 1},
            function () {
                //$("#mytable").bootstrapTable("refresh");
            }
        )
    }

    function reduceCount(obj) {
        var id = $(obj).attr("rowid");

        var num_str = $(obj).next("input").val();
        var num = parseInt(num_str);

        if (num <= 1) {
            alert("购物车所选数量不能为0");
        } else {
            $(obj).next("input").val(num - 1);
            var price_str = $(obj).parent("td").prev("td").text();
            var price = parseInt(price_str);
            var totalamout = (num-1) * price;
            $(obj).parent("td").next("td").text(totalamout);

            $.post(
                "changeCount",
                {"id": id, "count": num - 1},
                function () {
                    //$("#mytable").bootstrapTable("refresh");
                }
            )
        }
    }

    function deleteCart(id) {
        $.post(
            url = "deleteCart?id=" + id,

            function () {
                alert("删除成功！");
                $("#mytable").bootstrapTable("refresh");
            }
        )
    }

    function deleteAll() {
        var rows = $("#mytable").bootstrapTable('getSelections');

        if(rows.length==0){
            alert("请选择要删除的行！");
            return;
        }

        var idlist = new Array();

        $(rows).each(function () {
            idlist.push(this.id);
        });

        //alert(idlist);

        JSON_STR = JSON.stringify(idlist);

        //alert(JSON_STR);

        deleteUser(JSON_STR);


    }

    function deleteUser(JSON_STR) {
        if (confirm("您真的确定要删除吗？")) {

            //alert(JSON_STR);

            $.ajax({
                url: "deleteAllSelected",
                type: 'POST',
                dataType: "text",
                contentType: "application/json",
                data: JSON_STR,
                success:function (rec) {
                    alert(rec);
                    $("#mytable").bootstrapTable("refresh");
                }
            })

                /*$.post(
                    "deleteAllSelected",
                    JSON_STR,
                    "application/json",
                    function () {
                        $("#mytable").bootstrapTable("refresh");
                    })*/
        }
    }

    function payment(totalprice,pid,id) {
//        alert(totalprice);
//        alert(pid);
        $.ajax({
            url:"transfer/"+pid+"/"+totalprice,
            method:"put",
            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
            success:function (rec) {
                if(rec=="success"){
                    alert("支付成功");
                    deleteCart(id);
                }else {
                    alert("余额不足");
                }
            }
        });
    };
    function payAll() {
        var rows = $("#mytable").bootstrapTable('getSelections');
        totalAmount = 0;
        $(rows).each(function () {
            totalAmount+=this.count*this.p.pprice;
        });
        $(function () {
            $.ajax({
                url:"selectBalance",
                type:"GET",
                dataType: "text",
                success:function(result){
                   if (parseFloat(result)<totalAmount){
                       alert("fail")
                   }else {
                       $(rows).each(function () {
                           var pid = this.pid;
                           var totalprice = this.pid*this.p.pprice;
                           var id = this.id;
                           $.ajax({
                               url:"transfer/"+pid+"/"+totalprice,
                               method:"put",
                               contentType:"application/x-www-form-urlencoded; charset=UTF-8",
                               success:function () {
                                   $.post(
                                       url = "deleteCart?id=" + id

                                   )
                               }
                           });


                       });
                       alert("支付成功");
                       window.location.reload();
                   }
                }
            });
        })

    }

</script>

<script type="text/javascript">
    var data = {
        labels: ["January", "February", "March", "April", "May"],
        datasets: [
            {
                label: "My First dataset",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: [65, 59, 80, 81, 56]
            },
            {
                label: "My Second dataset",
                fillColor: "rgba(151,187,205,0.2)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: [28, 48, 40, 19, 86]
            }
        ]
    };
    var pdata = [
        {
            value: 300,
            color: "#46BFBD",
            highlight: "#5AD3D1",
            label: "Complete"
        },
        {
            value: 50,
            color: "#F7464A",
            highlight: "#FF5A5E",
            label: "In-Progress"
        }
    ]

    var ctxl = $("#lineChartDemo").get(0).getContext("2d");
    var lineChart = new Chart(ctxl).Line(data);

    var ctxp = $("#pieChartDemo").get(0).getContext("2d");
    var pieChart = new Chart(ctxp).Pie(pdata);
</script>
<!-- Google analytics script-->
<script type="text/javascript">
    if (document.location.hostname == 'pratikborsadiya.in') {
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-72504830-1', 'auto');
        ga('send', 'pageview');
    }
</script>
</body>
</html>