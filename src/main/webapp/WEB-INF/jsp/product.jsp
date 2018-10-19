<%--
  Created by IntelliJ IDEA.
  User: 王文栋
  Date: 2018/10/18
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${product.pdesc}</title>
    <meta http-equiv="keywords" content="JSPGOU演示站"/>
    <meta http-equiv="description" content="JSPGOU演示站"/>
    <link href="css/index.css" type="text/css" rel="stylesheet" />
    <link href="css/product.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">

        $(document).ready(function() {
            jQuery.jqtab = function(tabtit,tabcon) {
                $(tabcon).hide();
                $(tabtit+" li:first").addClass("thistab").show();
                $(tabcon+":first").show();

                $(tabtit+" li").click(function() {
                    $(tabtit+" li").removeClass("thistab");
                    $(this).addClass("thistab");
                    $(tabcon).hide();
                    var activeTab = $(this).find("a").attr("tab");
                    $("#"+activeTab).fadeIn();
                    return false;
                });

            };
            /*调用方法如下：*/
            $.jqtab("#tabs",".tab_con");

        });

       /* function addToCollect(productId){
            $.post('/collect/add_to_collect.jspx',{
                'productId':productId
            }, function(data){
                if(data.status == 1){
                    alert('收藏成功!');
                }else if(data.status== 2){
                    alert('收藏过该商品');
                }else{
                    location.href='/login.jspx';
                }
            },'json');
        }*/
    </script>
</head>

<body>
<div id="Topbar" class="Topbar">
    <div class="ctr cf">
        <ul class="Topbar-menu fr">
            <li class="Topbar-menu-item ib"><a href="/order/myorder.jspx">我的JSPGOU</a></li>
            <li class="Topbar-menu-item ib"><a href="/collect/mycollect.jspx">收藏夹</a></li>
            <!--<li class="Topbar-menu-item ib"><a target="_blank" href="">网站导航</a>-->
            </li>
        </ul>
        <ul class="Topbar-welcome fl" id="top_user_bar">
            <li class="Topbar-welcome-item">Hi~欢迎来到JSPGOU商城 ${sessionUser.username}</li>

            <li class="Topbar-welcome-item">


        </ul>



    </div>
</div>

<script type="text/javascript">
    console.log(2);
    localStorage.removeItem("sessionKey");
    localStorage.removeItem("userName");
</script><script src="js/jquery.js" type="text/javascript"></script>
<div class="Header">
    <div class="ctr pr">
        <a href="/"><div class="Logo">
            <img src="picture/logo.jpg" width="158" height="58" />
        </div></a>
        <form class="Search"  id="searchForm" action="/search.jspx">
            <input id="search_form_input" class="Search-input zi2" type="text"
                   name="q" id="q" value="请输入关键词" type="text"
                   onfocus="if(this.value=='请输入关键词')this.value=''"
                   onblur="if(this.value=='')this.value='请输入关键词'">

            <!--<button class="Search-submit" type="submit">搜 索</button>-->
            <!-- <input class="Search-submit"  value="搜索" onclick="sousuo();"/>-->
            <input class="Search-submit" value="搜索" onclick="sousuo();"  type="button">
        </form>
        <div class="Search-hot">
            <a id="请输入关键词" onclick="parssKey(this);" class="gray">请输入关键词</a>
            <a id="手机" onclick="parssKey(this);" class="gray">手机</a>
            <a id="数码" onclick="parssKey(this);" class="gray">数码</a>
            <a id="" onclick="parssKey(this);" class="gray"></a>
            <a id="1" onclick="parssKey(this);" class="gray">1</a>
            <a id="日用百货" onclick="parssKey(this);" class="gray">日用百货</a>

        </div>
        <script type="text/javascript">
            function parssKey(o) {
                var v = o.id;
                $("#q").val(v);
                document.getElementById("searchForm").submit();
            }

            function sousuo(){

                var a=$("input[name='q']").val();
                if(a=="请输入关键词"){
                    alert("亲！请输入关键词");
                }else{
                    document.getElementById("searchForm").submit();

                }
            }


        </script>
        <div class="top_shopping">
            <i></i>
            <a href="cart2">我的购物车(<span id="cart_total_items"></span>) </a>
        </div>

        <script type="text/javascript">
            $('#cart_total_items').html(Shop.cartTotalItems());
        </script>
    </div>
</div><!--商品类目栏 begin  -->
<div class="Nav">
    <ul class="ctr cf pr">
        <li id="nav_category"
            class="Nav-item Nav-category fl zi6 ">
            <!--  <h2 class="tac">全部商品分类</h2>-->
            <ul class="Nav-catelist">
                <li class="Nav-catelist-item even">
                    <ul class="Nav-cate-sublist">

                        <li><a target="_blank" href="/shouji/index.htm">手机</a></li>
                        <li><a target="_blank" href="/bjb/index.htm">笔记本</a></li>
                        <li><a target="_blank" href="/tsj/index.htm">电脑整机</a></li>


                        <ul class="Nav-cate-detail">
                            <div class="list">
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/shouji/index.htm">手机</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/sanxing/index.htm">三星</a></li>
                                        <li><a target="_blank" href="/Iphone/index.htm">苹果</a></li>
                                        <li><a target="_blank" href="/huawei/index.htm">华为</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/bjb/index.htm">笔记本</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/lenovo/index.htm">联想</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/tsj/index.htm">电脑整机</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/ipad/index.htm">平板电脑</a></li>
                                        <li><a target="_blank" href="/taishiji/index.htm">台式机</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/bg/index.htm">办公</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/wenju/index.htm">文具</a></li>
                                        <li><a target="_blank" href="/dayinji/index.htm">打印机</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/xj/index.htm">摄影摄像</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/xiangji/index.htm">相机</a></li>
                                        <li><a target="_blank" href="/danfan/index.htm">单反</a></li>
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </ul>
                </li>
                <li class="Nav-catelist-item even">
                    <ul class="Nav-cate-sublist">

                        <li><a target="_blank" href="/woman/index.htm">女装</a></li>
                        <li><a target="_blank" href="/man/index.htm">男装</a></li>
                        <li><a target="_blank" href="/child/index.htm">童装</a></li>


                        <ul class="Nav-cate-detail">
                            <div class="list">
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/woman/index.htm">女装</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/langmanqunzhuang/index.htm">浪漫裙装</a></li>
                                        <li><a target="_blank" href="/jiagxuanshangzhuang/index.htm">精选上装</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/man/index.htm">男装</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/nanshiwantao/index.htm">男士外套</a></li>
                                        <li><a target="_blank" href="/nanshikuzhuang/index.htm">男士裤装</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/child/index.htm">童装</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/qinzizhuang/index.htm">亲子装</a></li>
                                        <li><a target="_blank" href="/taozhuang/index.htm">套装</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/neiyi/index.htm">内衣</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/kuzi/index.htm">裤子</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </ul>
                </li>
                <li class="Nav-catelist-item even">
                    <ul class="Nav-cate-sublist">

                        <li><a target="_blank" href="/nvbao/index.htm">女包</a></li>
                        <li><a target="_blank" href="/nanxie/index.htm">男鞋</a></li>
                        <li><a target="_blank" href="/tongxie/index.htm">童鞋</a></li>


                        <ul class="Nav-cate-detail">
                            <div class="list">
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/nvbao/index.htm">女包</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/danjianbao/index.htm">单肩包</a></li>
                                        <li><a target="_blank" href="/shuangjianbao/index.htm">双肩包</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/nanxie/index.htm">男鞋</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/xiuxianpixie/index.htm">休闲皮鞋</a></li>
                                        <li><a target="_blank" href="/banxie/index.htm">板鞋</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/tongxie/index.htm">童鞋</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/nvxie/index.htm">女鞋</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/nanbao/index.htm">男包</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </ul>
                </li>
                <li class="Nav-catelist-item even">
                    <ul class="Nav-cate-sublist">

                        <li><a target="_blank" href="/shenghuodianqi/index.htm">生活电器</a></li>


                        <ul class="Nav-cate-detail">
                            <div class="list">
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/shenghuodianqi/index.htm">生活电器</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/pingbandianshi/index.htm">平板电视</a></li>
                                        <li><a target="_blank" href="/kongtiao/index.htm">空调</a></li>
                                        <li><a target="_blank" href="/xiyiji/index.htm">洗衣机</a></li>
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </ul>
                </li>
                <li class="Nav-catelist-item even">
                    <ul class="Nav-cate-sublist">

                        <li><a target="_blank" href="/wujingongju/index.htm">五金工具</a></li>
                        <li><a target="_blank" href="/woshijiaj/index.htm">卧室家具</a></li>


                        <ul class="Nav-cate-detail">
                            <div class="list">
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/wujingongju/index.htm">五金工具</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/kaiguanchazuo/index.htm">开关插座</a></li>
                                        <li><a target="_blank" href="/gongjuxiang/index.htm">工具箱</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/woshijiaj/index.htm">卧室家具</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/chuang/index.htm">床</a></li>
                                        <li><a target="_blank" href="/yigui/index.htm">衣柜</a></li>
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </ul>
                </li>
                <li class="Nav-catelist-item even">
                    <ul class="Nav-cate-sublist">

                        <li><a target="_blank" href="/huangjinshoushi/index.htm">黄金首饰</a></li>
                        <li><a target="_blank" href="/zuanshi/index.htm">钻石彩宝</a></li>
                        <li><a target="_blank" href="/wanbiao/index.htm">腕表</a></li>


                        <ul class="Nav-cate-detail">
                            <div class="list">
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/huangjinshoushi/index.htm">黄金首饰</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/huangjinxianglian/index.htm">黄金项链</a></li>
                                        <li><a target="_blank" href="/zujinshipin/index.htm">足金饰品</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/zuanshi/index.htm">钻石彩宝</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/jiehunzuanjie/index.htm">结婚钻戒</a></li>
                                        <li><a target="_blank" href="/zuanshiershi/index.htm">钻石耳饰</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/wanbiao/index.htm">腕表</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/ruishimingbiao/index.htm">瑞士名表</a></li>
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </ul>
                </li>
            </ul>
        </li>

        <!--导航栏 begin -->
        <li class="Nav-item fl first active"><a href="/"   id="nav0" onmouseover="jte(this,0)">首页</a></li>
        <input type="hidden" id="hidden1" value="6"></input>
        <li class="Nav-item fl"> <a href="/shuma/index.htm"  id="nav1" class="white"  onmouseover="jte(this,6)">数码</a></li>
        <input type="hidden" id="hidden2" value="6"></input>
        <li class="Nav-item fl"> <a href="/fuzhuang/index.htm"  id="nav2" class="white"  onmouseover="jte(this,6)">服装</a></li>
        <input type="hidden" id="hidden3" value="6"></input>
        <li class="Nav-item fl"> <a href="/xiebao/index.htm"  id="nav3" class="white"  onmouseover="jte(this,6)">鞋包配饰</a></li>
        <input type="hidden" id="hidden4" value="6"></input>
        <li class="Nav-item fl"> <a href="/riyongbaihuo/index.htm"  id="nav4" class="white"  onmouseover="jte(this,6)">日用百货</a></li>
        <input type="hidden" id="hidden5" value="6"></input>
        <li class="Nav-item fl"> <a href="/jiajujiancai/index.htm"  id="nav5" class="white"  onmouseover="jte(this,6)">家居建材</a></li>
        <input type="hidden" id="hidden6" value="6"></input>
        <li class="Nav-item fl"> <a href="/zhubaoshoubiao/index.htm"  id="nav6" class="white"  onmouseover="jte(this,6)">珠宝手表</a></li>


        <script type="text/javascript">
            function jte(obj,n){
                obj.className="current";
                var t;
                var id;
                var s;
                if(n!=0){
                    for(var i=0;i<=n;i++){
                        id ="nav"+i;
                        t = document.getElementById(id);
                        if(id != obj.id){
                            t.className="white";
                        }
                    }
                }else{
                    n=document.getElementById("hidden1").value;
                    for(var i=0;i<=n;i++){
                        id ="nav"+i;
                        t = document.getElementById(id);
                        if(id != obj.id){
                            t.className="white";
                        }
                    }
                }
            }
        </script>

        <!--导航栏 end -->
    </ul>
</div>
<!--商品类目栏 end  --><div class="weizhi">
    您现在的位置：<a href="/">首页</a> > <a href="/sanxing/index.htm">三星</a>
</div>
<div class="view Page-detail">

    <div class="Detail">

        <div class="Detail-meta cf">
            <div class="Detail-ml fl">
                <div class="Detail-main-images">
                    <a id="productImgA" class="jqzoom" href="${pageContext.request.contextPath}/${product.pimgs}"  style="height:350px;">
                        <img id="productImg" src="${pageContext.request.contextPath}/${product.pimgs}" alt="【低价疯抢】Apple iPhone 6 32G" height="350" style="margin:auto; display:block;"/>
                    </a>
                </div>

                <div class="pic_slide">

                    <span class="next" id="nextBtn"></span>
                </div>
            </div>

            <div class="Detail-mm fl">
                <!--  <h1 class="Detail-name">【低价疯抢】Apple iPhone 6 32G</h1> -->

                <h1 class="Detail-name" style="margin-bottom:15px;">${product.pdesc}</h1>
                <div style="width: 520px; height: 38px; background-image: url(images/xxbg.jpg)">
                    <div style="float: left; font-size: 13px; color: #fff; font-family:'Microsoft Yahei'; margin-top: 10px; margin-left: 15px">春季新品大促，<span style="color: #fec40b">万人疯抢中</span>，尽快选购吧！</div>
                </div>

                <div class="Detail-price p10">
                    <input type="hidden" id="current_merchantId" value="68"/>
                    <dl class="promo cf" >
                        <dt>销售价</dt>
                        <dd>
                            <span style="float: left;">¥&nbsp;</span>
                            <em id="product_price" style="float: left;">${product.pprice}</em>
                        </dd>
                    </dl>

                    <dl class="original cf">
                        <dt>价格</dt>
                        <dd>¥&nbsp;<del id="product_oprice">3600</del></dd>
                    </dl>
                    <dl class="original cf">
                        <dt><h4>库存数量</h4></dt>
                        <dd>${product.pqty}</dd>
                    </dl>



                    <span class="favour"><span class="icon"></span><a class="text"  href="javascript:void(0);" onclick="javascript:addToCollect(59);">收藏</a></span>
                </div>

                <div class="sys_item_spec" style="padding:7px 10px 0 10px;">
                    <dl class="sys_item_specpara clearfix" data-sid="1" data-attrval="22">
                        <dt></dt>
                        <dd>
                            <ul class="sys_spec_img">
                                </li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="sys_item_specpara clearfix" data-sid="2" data-attrval="24">


                    </dl>
                    <dl class="sys_item_specpara clearfix" data-sid="3" data-attrval="28">

                    </dl>
                </div>
                <div class="Detail-spec p10">
                    <dl class="amount cf">



                    </dl>
                    <dl class="buy cf">
                        <dt></dt>
                        <dd>
                            <!--   <span class="now" onclick="addToCart()">立即购买</span>
                        <span class="cart" onclick="addToCart()">
                                  加入购物车
                              </span> -->
                            <span>
	                         <%-- <input type="button" class="cart" value="联系卖家" onclick="tochatroom()"/>--%>
                                <a href="chat1"><span class="label label-danger">联系卖家</span>
</a>
	                        </span>
                            <span>
	                           <input type="button" class="cart" value="加入购物车" onclick="addProductToCart(${product.pid})"/>
	                        </span>
                        </dd>
                    </dl>


                    <dl class="promise cf">
                        <dt>商品编号</dt>
                        <dd><span id="productCode">20180202161499</span></dd>
                    </dl>

                    <dl class="promise cf">
                        <dt>分享到</dt>
                        <dd>
                            <span >
			 						<a  style="background:url(images/r1_c5.png) no-repeat;" href="javascript:(function(){var rul=location.href;if(rul.indexOf('?')>0){rul = rul +'&'}else{rul = rul +'?'};rul = rul +'tarcker_u=9402576';window.open(' http://v.t.sina.com.cn/share/share.php?title=【【低价疯抢】Apple iPhone 6 32G】,JSPGOU价 ￥3100&url='+encodeURIComponent(rul),'_blank','width=615,height=505');})()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新浪微博</a>
			                        <a  style="background:url(images/1228_r3_c5.png) no-repeat;" href="javascript:void(0)" onclick="posttoWb('http://v.t.qq.com/share/share.php','【低价疯抢】Apple iPhone 6 32G￥3100','2fc26c2514bb48ec891170ce68db2683');" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;腾讯微博</a>

                            </span>

                        </dd>
                    </dl>
                </div>

            </div>


            <div class="Detail-mr fr">
                <!--  <div class="see-again-tit">
                         <span class="icon"></span>
                  </div>
                  <ul class="see-again-list">
                      <li>
                          <a href="" target="_blank" title="">
                              <img src="picture/tj1.jpg" width="140" height="90" />
                          </a>
                          <p class="p1">
                              <a href="" target="_blank" title="">青花瓷全棉活性印花床品四件套（大号）</a>
                          </p>
                          <p class="red">¥499</p>
                      </li>
                      <li>
                          <a href="" target="_blank" title="">
                              <img src="picture/tj1.jpg" width="140" height="90" />
                          </a>
                          <p class="p1">
                              <a href="" target="_blank" title="">青花瓷全棉活性印花床品四件套（大号）</a>
                          </p>
                          <p class="red">¥499</p>
                      </li>
                      <li>
                          <a href="" target="_blank" title="">
                              <img src="picture/tj1.jpg" width="140" height="90" />
                          </a>
                          <p class="p1">
                              <a href="" target="_blank" title="">青花瓷全棉活性印花床品四件套（大号）</a>
                          </p>
                          <p class="red">¥499</p>
                      </li>
                  </ul> -->
            </div>
        </div>


        <div class="Detail-content cf" id="Detail-content">
            <div class="aside fl">
                <div class="b">
                    <div class="h">看了又看</div>
                    <div id="liulan"></div>
                    <!--
                       <ul>
                       </ul>
                       -->
                </div>
            </div>

            <div id="tabbox">
                <ul class="tabs" id="tabs">
                    <li><a href="" tab="tab1">商品详情</a></li>
                    <li><a href="" tab="tab2">规格参数</a></li>
                    <li><a href="" tab="tab3">商品评价</a></li>
                    <li><a href="" tab="tab4">商品咨询</a></li>
                    <li><a href="" tab="tab5">成交记录</a></li>
                </ul>
                <ul class="tab_conbox">
                    <li id="tab1" class="tab_con">
                        <table width="748"><tbody><tr class="firstRow"><td style="margin: 0px; padding: 0px; word-break: break-all;"><p>&nbsp;</p><p><span style="margin: 0px; padding: 0px; font-family: 微软雅黑; font-size: 14px;">&nbsp;</span><img alt="" width="750" height="671" src="picture/021613030at3.jpg" class="err-product"/><img alt="" width="750" height="1181" src="picture/02161304sbcy.jpg" class="err-product"/><img alt="" width="750" height="1241" src="picture/02161304utny.jpg" class="err-product"/><img alt="" width="750" height="1424" src="picture/02161304xem1.jpg" class="err-product"/></p></td></tr></tbody></table><p><br/></p>
                    </li>

                    <li id="tab2" class="tab_con">
                        <table class="pro-para-tbl" width="947" style="width: 925px;"><tbody><tr class="firstRow"><th colspan="3" style="margin: 0px; padding: 0px; height: 30px; background: rgb(240, 240, 240); text-align: left; vertical-align: middle; text-indent: 5px;">包装清单</th></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176">包装清单</td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">iPhone 6x1、具有线控功能和麦克风的 Apple EarPodsx1、Lightning to USB 连接线x1、USB 电源适配器x1、保修卡x1、资料x1</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr></tbody></table><table class="pro-para-tbl" width="947" style="width: 925px;"><tbody><tr class="firstRow"><th colspan="3" style="margin: 0px; padding: 0px; height: 30px; background: rgb(240, 240, 240); text-align: left; vertical-align: middle; text-indent: 5px;">主体</th></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">品牌</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456"><a href="https://www.suning.com/pinpai/0021-0-0.html" target="_blank" style="color: rgb(102, 102, 102); text-decoration-line: none; outline: 0px; margin: 0px; padding: 0px;">苹果(Apple)</a></td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">型号</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">iPhone 6</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">入网型号</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">A1586</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">上市时间</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">2017年2月</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><th colspan="3" style="margin: 0px; padding: 0px; height: 30px; background: rgb(240, 240, 240); text-align: left; vertical-align: middle; text-indent: 5px;">外观</th></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">颜色</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">金色</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">外形尺寸</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">138.1×67.0×6.9毫米</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">机身材质</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">金属</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">重量</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">129克</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><th colspan="3" style="margin: 0px; padding: 0px; height: 30px; background: rgb(240, 240, 240); text-align: left; vertical-align: middle; text-indent: 5px;">系统</th></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">手机操作系统</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">IOS</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">手机操控方式</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">电容触摸屏</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><th colspan="3" style="margin: 0px; padding: 0px; height: 30px; background: rgb(240, 240, 240); text-align: left; vertical-align: middle; text-indent: 5px;">CPU</th></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">CPU核数</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">以官网信息为准</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">CPU频率</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">以官网信息为准</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">CPU型号</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">64位苹果 A8+M8协处理器</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><th colspan="3" style="margin: 0px; padding: 0px; height: 30px; background: rgb(240, 240, 240); text-align: left; vertical-align: middle; text-indent: 5px;">网络</th></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">4G网络制式</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">移动4G,联通4G,电信4G,全网通</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">3G网络制式</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">移动3G,电信3G,联通3G</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">2G网络制式</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">电信2G,移动2G/联通2G</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">待机模式</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">单卡多模</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">手机制式</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">多模(WCDMA/GSM+TD-SCDMA/GSM)</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">SIM卡尺寸</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">Nano SIM卡</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">网络频率</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">FDD-LTE/TD-LTE/WCDMA/TD-SCDMA/CDMA2000/GSM</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">数据业务</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">FDD-LTE/TD-LTE/WCDMA/TD-SCDMA/CDMA2000/GSM</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><th colspan="3" style="margin: 0px; padding: 0px; height: 30px; background: rgb(240, 240, 240); text-align: left; vertical-align: middle; text-indent: 5px;">存储</th></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">机身内存</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">32GB</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">运行内存</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">以官网信息为准</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">存储卡类型</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">不支持</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">最大存储扩展</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">不支持</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><th colspan="3" style="margin: 0px; padding: 0px; height: 30px; background: rgb(240, 240, 240); text-align: left; vertical-align: middle; text-indent: 5px;">屏幕</th></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">屏幕尺寸</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">4.7英寸</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">屏幕分辨率</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">1334×750</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">屏幕材质</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">其他</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">屏幕尺寸</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">11.94厘米</td><td class="err" style="margin: 0px; padding: 3px 68px 3px 5px; border-left: 0px; text-align: right;"><br/></td></tr><tr><th colspan="3" style="margin: 0px; padding: 0px; height: 30px; background: rgb(240, 240, 240); text-align: left; vertical-align: middle; text-indent: 5px;">拍照</th></tr><tr><td class="name" style="margin: 0px; padding: 3px 5px;" width="176"><p><span style="margin: 0px; padding: 0px; vertical-align: middle;">前摄像头</span></p></td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456">120万像素</td><td class="val" style="margin: 0px; padding: 3px 5px; border-right: 0px; line-height: 24px;" width="456"><br/></td></tr></tbody></table><p><br/></p>

                    </li>

                    <li id="tab3" class="tab_con">

                        <script type="text/javascript">
                            function g(o){
                                return document.getElementById(o);
                            }
                            function HoverLi(x,y,m,n,counter){
                                for(var i=1;i<=counter;i++){
                                    g(x+m+i).className='normaltab';
                                    g(y+m+i).className='undis';
                                }
                                g(y+m+n).className='dis';
                                g(x+m+n).className='curr';
                            }
                        </script>
                        <div class="pingjia">
                            <ul>
                                <li onclick="HoverLi('ty_','tyc_',1,1,3);" class="curr" id="ty_11">好评(0)</li>
                                <li onclick="HoverLi('ty_','tyc_',1,2,3);" class="normaltab" id="ty_12">中评(0)</li>
                                <li onclick="HoverLi('ty_','tyc_',1,3,3);" class="normaltab" id="ty_13">差评(0)</li>
                            </ul>
                        </div>
                        <div class="clear"></div>
                        <div class="dis" id="tyc_11">
                            <div class="dt-com">
                                <ul class="com-ul">
                                    <li class="cfix tac">对不起，暂时没有评论。</li>
                                </ul>

                            </div>
                        </div>
                        <div class="undis" id="tyc_12">
                            <div class="dt-com">
                                <ul class="com-ul">
                                    <li class="cfix tac">对不起，暂时没有评论。</li>
                                </ul>
                            </div>
                        </div>
                        <div class="undis" id="tyc_13">
                            <div class="dt-com">
                                <ul class="com-ul">
                                    <li class="cfix tac">
                                        对不起，暂时没有评论。
                                    </li>
                                </ul>
                            </div>
                        </div>


                    </li>
                    <li id="tab4" class="tab_con">
                        <iframe width="944" frameborder=0 scrolling=no src="/consultProduct.jspx?productId=59" name="rightFrame" noresize="noresize" id="rightFrame" height="400">
                        </iframe>
                    </li>
                    <li id="tab5" class="tab_con">
                        <iframe width="944"  frameborder=0 scrolling=no  src="/bargain.jspx?productId=59" name="rightFrame" noresize="noresize" id="rightFrame"  height="400">
                        </iframe>

                    </li>
                </ul>
            </div>

        </div>
    </div>
</div>


<div class="clear"></div>
<div class="Footer">
    <div class="footer-icon">
        <div class="w">
            <a href="/baozhang/14.htm" target="_blank" class="icon-map">
                <p class="icon-bg i1"></p>
                <p class="icon-title">100%正品</p>
            </a>
            <a href="/baozhang/15.htm" target="_blank" class="icon-map">
                <p class="icon-bg i2"></p>
                <p class="icon-title">双重质检</p>
            </a>
            <a href="/baozhang/16.htm" target="_blank" class="icon-map">
                <p class="icon-bg i3"></p>
                <p class="icon-title">全球化采购</p>
            </a>
            <a href="/baozhang/17.htm" target="_blank" class="icon-map">
                <p class="icon-bg i4"></p>
                <p class="icon-title">无理由退货</p>
            </a>
            <a href="/baozhang/18.htm" target="_blank" class="icon-map">
                <p class="icon-bg i5"></p>
                <p class="icon-title">贵就赔</p>
            </a>
            <a href="/baozhang/19.htm" target="_blank" class="icon-map">
                <p class="icon-bg i6"></p>
                <p class="icon-title">万千口碑</p>
            </a>
        </div>
    </div>

    <!-- 帮助中心栏目start -->
    <div class="Footer-block pt20 pb20 ctr cf">
        <ul class="Sitemap fl cf">
            <li class="Sitemap-item fl">
                <h4>
                    <a target="_blank" href="/xsrm/index.htm">新手入门</a>
                </h4>
                <ul>
                    <li><a href="/xsrm/1.htm" class="track2" target="_blank">积分说明</a></li>
                    <li><a href="/xsrm/2.htm" class="track2" target="_blank">购买流程</a></li>
                    <li><a href="/xsrm/3.htm" class="track2" target="_blank">账户注册</a></li>
                    <li><a href="/xsrm/4.htm" class="track2" target="_blank">大宗购物</a></li>
                </ul>
            </li>
            <li class="Sitemap-item fl">
                <h4>
                    <a target="_blank" href="/wzgg/index.htm">网站公告</a>
                </h4>
                <ul>
                    <li><a href="/wzgg/5.htm" class="track2" target="_blank">最新商品</a></li>
                </ul>
            </li>
            <li class="Sitemap-item fl">
                <h4>
                    <a target="_blank" href="/news/index.htm">新闻中心</a>
                </h4>
                <ul>
                    <li><a href="/news/6.htm" class="track2" target="_blank">jspgou v5.0即将发布</a></li>
                </ul>
            </li>
            <li class="Sitemap-item fl">
                <h4>
                    <a target="_blank" href="/remen/index.htm">热门促销</a>
                </h4>
                <ul>
                    <li><a href="/remen/7.htm" class="track2" target="_blank">热门促销</a></li>
                </ul>
            </li>
            <li class="Sitemap-item fl">
                <h4>
                    <a target="_blank" href="/ps/index.htm">配送范围及时间</a>
                </h4>
                <ul>
                    <li><a href="/ps/8.htm" class="track2" target="_blank">订单拆分</a></li>
                    <li><a href="/ps/9.htm" class="track2" target="_blank">海外配送</a></li>
                    <li><a href="/ps/10.htm" class="track2" target="_blank">国内配送</a></li>
                </ul>
            </li>
        </ul>
        <div class="QR fl">
            <img class="QR-img" src="picture/jspgou-wx.jpg" >
        </div>
    </div>
    <!-- 帮助中心栏目 end-->

    <div class="Copyright">
        <div class="ctr tac">
            <a href="/dilan/20.htm"target="_blank">关于JSPGOU</a> |
            <a href="/dilan/21.htm"target="_blank">最新资讯</a> |
            <a href="/dilan/22.htm"target="_blank">帮助中心</a> |
            <a href="/dilan/23.htm"target="_blank">隐私保护</a> |
            <a href="/dilan/24.htm"target="_blank">网站导航</a> |
            <a href="/dilan/25.htm"target="_blank">联系我们</a>
        </div>
        <div class="ctr tac">Copyright © JSPGOU 2017，All Rights Reserved</div>
    </div>
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
<script language="JavaScript" type="text/JavaScript">
    var sys_item={
        "mktprice":"3600",
        "price":"3100",
        "attitude":" 黑 联通3G 0元购机",
        "fashId":"68",

        "sys_attrprice":{
            "22_24_28":{"price":"3100","mktprice":"3600","attitude":" 黑 联通3G 0元购机","fashId":"68"}
        }
    };

    //商品规格选择
    $(function(){
        $(".sys_item_spec .sys_item_specpara").each(function(){
            var i=$(this);
            var p=i.find("ul>li");
            p.click(function(){

                if(!!$(this).hasClass("selected")){
                    $(this).removeClass("selected");
                    i.removeAttr("data-attrval");
                }else{
                    $(this).addClass("selected").siblings("li").removeClass("selected");
                    i.attr("data-attrval",$(this).attr("data-aid"))
                }
                getattrprice() //输出价格
            })
        })
        //获取对应属性的价格
        function getattrprice(){
            var defaultstats=true;
            var _val='';
            var _resp={
                mktprice:".sys_item_mktprice",
                price:".sys_item_price",
                attitude:".sys_item_attitude"
            }  //输出对应的class
            $(".sys_item_spec .sys_item_specpara").each(function(){
                var i=$(this);
                var v=i.attr("data-attrval");
                if(!v){
                    defaultstats=false;
                }else{
                    _val+=_val!=""?"_":"";
                    _val+=v;
                }
            })

            if(!!defaultstats){
                if((sys_item['sys_attrprice'][_val])!=undefined){
                    _mktprice=sys_item['sys_attrprice'][_val]['mktprice'];
                    _price=sys_item['sys_attrprice'][_val]['price'];
                    _attitude=sys_item['sys_attrprice'][_val]['attitude'];
                    _fashId=sys_item['sys_attrprice'][_val]['fashId'];
                }else{
                    alert("您选择的商品已无库存！");
                    _mktprice=sys_item['mktprice'];
                    _price=sys_item['price'];
                    _attitude=sys_item['attitude'];
                    _fashId=sys_item['fashId'];
                }

            }else{
                _mktprice=sys_item['mktprice'];
                _price=sys_item['price'];
                _attitude=sys_item['attitude'];
                _fashId=sys_item['fashId'];
            }
            //输出价格
            $(_resp.mktprice).text(_mktprice);  ///其中的math.round为截取小数点位数
            $(_resp.price).text(_price);
            $(_resp.attitude).text(_attitude);
            $("#current_merchantId").val(_fashId);
        }
    })
</script>

<script type="text/javascript">
    var p_id = "59";
    var p_title = "【低价疯抢】Apple iPhone 6 32G";
    var p_price = "3100";
    var p_url = "/sanxing/59.htm";
    var p_pic = "";
    p_pic ="/u/201802/02161238e7wo.jpg";
    var id = "product";
    var price = "price";
    var title = "title";
    var pic = "pic";
    var url = "url";


    //*取出cookie并显示
    for(i = 0 ;i<5;i++){
        title = title+i;
        price = price+i;
        pic = pic+i;
        url = url+i;
        var arr0 = document.cookie.match(new RegExp("(^| )"+title+"=([^;]*)(;|$)"));
        var arr1 = document.cookie.match(new RegExp("(^| )"+price+"=([^;]*)(;|$)"));
        var arr2 = document.cookie.match(new RegExp("(^| )"+pic+"=([^;]*)(;|$)"));
        var arr3 = document.cookie.match(new RegExp("(^| )"+url+"=([^;]*)(;|$)"));
        if(arr0 != null ){
            var str = "<ul><li>"+
                "<div class='p-wrap'>"+
                "<div class='p-img'>"+
                "<a target='_blank' href="+unescape(arr3[2])+">"+
                "<img src='"+unescape(arr2[2])+"'>"+
                "</a>"+
                "</div>"+
                "<div class='p-info'>"+
                "<div class='p-name'>"+
                "<a target='_blank' title='"+unescape(arr0[2])+"' href='"+unescape(arr3[2])+"'>"+unescape(arr0[2])+"</a>"+
                "</div>"+
                "<div class='p-price'>"+
                "<s>￥</s>"+unescape(arr1[2])+
                "</div>"+
                "</div>"+
                "</div>"+
                "</li></ul>";
            $("#liulan").append(str);
        }
        price = "price";
        title = "title";
        pic = "pic";
        url = "url";
    }

    var number = 4;
    SetCookie();
    function SetCookie()//两个参数，一个是cookie的名子，一个是值
    {
        var Days = 30; //此 cookie 将被保存 30 天
        var exp  = new Date();    //new Date("December 31, 9998");
        exp.setTime(exp.getTime() + Days*24*60*60*1000);
        for(i = 0 ;i<5;i++){
            id = id+i;
            var arr = document.cookie.match(new RegExp("(^| )"+id+"=([^;]*)(;|$)"));
            if(arr != null && getCookie(id) == p_id){
                title = title+i;
                price = price+i;
                pic = pic+i;
                url = url+i;
                delCookie(id);
                delCookie(title);
                delCookie(price);
                delCookie(pic);
                delCookie(url);
                number = i;
            }
            id = "product";
            price = "price";
            title = "title";
            pic = "pic";
            url = "url";
        }
        for(var i = number ;i>0;i--){
            id0 = id+(i-1);
            price0 = price+(i-1);
            title0 = title+(i-1);
            pic0 = pic+(i-1);
            url0 = url+(i-1);
            id = id +i;
            price = price+i;
            title = title+i;
            pic = pic+i;
            url = url + i;
            if(getCookie(id0) != null){
                document.cookie = id + "="+ escape (getCookie(id0)) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
                document.cookie = price + "="+ escape (getCookie(price0)) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
                document.cookie = title + "="+ escape (getCookie(title0)) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
                document.cookie = pic + "="+ escape (getCookie(pic0)) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
                document.cookie = url + "="+ escape (getCookie(url0)) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
            }

            id = "product";
            price = "price";
            title = "title";
            pic = "pic";
            url = "url";
        }


        //* 让当前商品相关cookie保存为第0个
        id = id+"0";
        price = price+"0";
        title = title+"0";
        pic = pic+"0";
        url = url +"0";
        document.cookie = id + "="+ escape (p_id) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
        document.cookie = price + "="+ escape (p_price) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
        document.cookie = title + "="+ escape (p_title) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
        document.cookie = pic + "="+ escape (p_pic) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
        document.cookie = url + "="+ escape (p_url) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
        id = "product";
        price = "price";
        title = "title";
        pic = "pic";
        url = "url";
    }



    function getCookie(name){//取cookies函数
        var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
        if(arr != null ){
            return unescape(arr[2]);
        }else if(i == 5){
            return null;
        }
    }
    function delCookie(name)//删除cookie
    {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval=getCookie(name);
        if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
    }
</script>
<script type="text/javascript">

        /*将商品添加到购物车*/
        function addProductToCart(pid) {
            $.ajax({
                url:'${pageContext.request.contextPath}/addCart/'+pid,
                type:'post',
                contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                dataType:'text',
                success:function(rec){
                    if(rec=="success"){
                        alert("添加购物车成功");
                        $.post("updateProduct",pid);
                    }
                    $('#mytable').bootstrapTable(('refresh'));

                }
            })

        }

        /*跳转到聊天室*/
       /* function tochatroom(){
            alert("进入聊天室");
            Location.href = "/chat1";
        }*/

</script>
</body>
</html>
