
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>	首页 - jeegou开发站- Powered by JSPGOU</title>
    <meta http-equiv="keywords" content="JSPGOU演示站"/>
    <meta http-equiv="description" content="JSPGOU演示站"/>
    <link href="css/index.css" type="text/css" rel="stylesheet" />
    <script src="js/jquery1.42.min.js" type="text/javascript"></script>
    <script src="js/jquery.superslide.2.1.1.js" type="text/javascript"></script>
    <link href="css/service.css" type="text/css" rel="stylesheet" />
</head>
<body style="background:#f5f5f5;">
<script type="text/javascript">
    HS_OnlineService = {
        options: { "Top": "40", "Accounts":
                [
                    { "Type": "QQ", "ID": "1220788677", "Name": "jspgou" }
                    ,
                    { "Type": "Ali", "ID": "jeecms丶张", "Name": "阿里" }
                    ,
                    { "Type": "QQ", "ID": "2301276098", "Name": "jeecms-金磊科技" }



                ] },
        init: function () {
            var html = "";
            html += "<div class='online-service'>";
            html += "   <div class='service-list'>";
            html += "       <div class='t'></div>";
            html += "       <div class='con'>";
            html += "           <h2>在线客服</h2>";
            html += "           <ul>";
            var _options = HS_OnlineService.options;
            for (var i = 0; i < _options.Accounts.length; i++) {
                var srv = _options.Accounts[i];
                if (srv.Type == "QQ") {
                    var url = "tencent://message/?uin=" + srv.ID + "&amp;Site=在线客服&amp;Menu=yes";
                    html += "<li><a href='" + url + "' target='_blank'><img src='picture/c71e9473d909406c87b81a8aab26db83.gif" + srv.ID + ":1' border='0' alt='QQ' /></a></li>";
                }
                else if (srv.Type == "Ali") {
                    var url = "http://amos.im.alisoft.com/msg.aw?v=2&uid=" + srv.ID + "&site=cntaobao&s=1&charset=utf-8";
                    html += "<li><a href='" + url + "' target='_blank'><img border='0' src='picture/online.aw" + srv.ID + "&site=cntaobao&s=1&charset=utf-8' alt='在线客服'/></a></li>";
                }
            }
            html += "           </ul>";
            html += "       </div>";
            html += "       <div class='b'></div>";
            html += "   </div>";
            html += "   <div class='service-tips'><img src='picture/service-tips.png' alt='在线客服'></div>";
            html += "</div>";
            document.write(html);

            $(".online-service").hover(
                function () {
                    $(".online-service").addClass("hover");
                },
                function () {
                    $(".online-service").removeClass("hover");
                }
            );
        }
    }

    HS_OnlineService.init();
</script><div id="Topbar" class="Topbar">
    <div class="ctr cf">
        <ul class="Topbar-menu fr">
            <li class="Topbar-menu-item ib"><a href="allproducts">展示所有商品</a></li>
            <li class="Topbar-menu-item ib"><a href="/collect/mycollect.jspx">收藏夹</a></li>
            <!--<li class="Topbar-menu-item ib"><a target="_blank" href="">网站导航</a>-->
            </li>
        </ul>
        <ul class="Topbar-welcome fl" id="top_user_bar">
            <li class="Topbar-welcome-item">Hi~欢迎来到JSPGOU商城</li>
            <li class="Topbar-welcome-item"><a href="login">请登录</a></li>
            <li class="Topbar-welcome-item"><a
                    href="/toRegister">免费注册</a></li>
        </ul>



    </div>
</div>

<script type="text/javascript">
    console.log(2);
    localStorage.removeItem("sessionKey");
    localStorage.removeItem("userName");
</script>

<!-- 搜索栏begin -->
<div class="Header">
    <div class="ctr pr">
        <a href=""><div class="Logo">
            <img src="picture/logo.jpg" width="158" height="58" />
        </div></a>
        <form class="Search"  id="searchForm" action="/search.jspx">
            <input id="search_form_input" class="Search-input zi2" type="text"
                   name="q" id="q" value="请输入关键词" type="text"
                   onfocus="if(this.value=='请输入关键词')this.value=''"
                   onblur="if(this.value=='')this.value='请输入关键词'">

            <!--<button class="Search-submit" type="submit">搜 索</button>-->
            <!-- <input class="Search-submit"  value="搜索" onclick="sousuo();"/>-->
            <input class="Search-submit" value="搜索 " onclick="sousuo();"  type="button">
        </form>
        <div class="Search-hot">
            <a style="cursor: pointer;"
               id="请输入关键词" onclick="parssKey(this);" class="gray">请输入关键词</a>
            <a style="cursor: pointer;"
               id="手机" onclick="parssKey(this);" class="gray">手机</a>
            <a style="cursor: pointer;"
               id="数码" onclick="parssKey(this);" class="gray">数码</a>
            <a style="cursor: pointer;"
               id="" onclick="parssKey(this);" class="gray"></a>
            <a style="cursor: pointer;"
               id="1" onclick="parssKey(this);" class="gray">1</a>
            <a style="cursor: pointer;"
               id="日用百货" onclick="parssKey(this);" class="gray">日用百货</a>

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
    </div>
</div>
<!-- 搜索栏end -->

<!--商品类目栏 begin  -->
<div class="Nav">
    <ul class="ctr cf pr">
        <li id="nav_category"
            class="Nav-item Nav-category fl zi6 homepage active">
            <h2 class="tac">全部商品分类</h2>
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

                                        <a target="_blank" class="nav-menu-

subs" href="/shouji/index.htm">手机</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/sanxing/index.htm">三星</a></li>
                                        <li><a target="_blank"

                                               href="/Iphone/index.htm">苹果</a></li>
                                        <li><a target="_blank"

                                               href="/huawei/index.htm">华为</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/bjb/index.htm">笔记本</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/lenovo/index.htm">联想</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/tsj/index.htm">电脑整机</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/ipad/index.htm">平板电脑</a></li>
                                        <li><a target="_blank"

                                               href="/taishiji/index.htm">台式机</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/bg/index.htm">办公</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/wenju/index.htm">文具</a></li>
                                        <li><a target="_blank"

                                               href="/dayinji/index.htm">打印机</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/xj/index.htm">摄影摄像</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/xiangji/index.htm">相机</a></li>
                                        <li><a target="_blank"

                                               href="/danfan/index.htm">单反</a></li>
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

                                        <a target="_blank" class="nav-menu-

subs" href="/woman/index.htm">女装</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/langmanqunzhuang/index.htm">浪漫裙装</a></li>
                                        <li><a target="_blank"

                                               href="/jiagxuanshangzhuang/index.htm">精选上装</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/man/index.htm">男装</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/nanshiwantao/index.htm">男士外套</a></li>
                                        <li><a target="_blank"

                                               href="/nanshikuzhuang/index.htm">男士裤装</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/child/index.htm">童装</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/qinzizhuang/index.htm">亲子装</a></li>
                                        <li><a target="_blank"

                                               href="/taozhuang/index.htm">套装</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/neiyi/index.htm">内衣</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/kuzi/index.htm">裤子</a>
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

                                        <a target="_blank" class="nav-menu-

subs" href="/nvbao/index.htm">女包</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/danjianbao/index.htm">单肩包</a></li>
                                        <li><a target="_blank"

                                               href="/shuangjianbao/index.htm">双肩包</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/nanxie/index.htm">男鞋</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/xiuxianpixie/index.htm">休闲皮鞋</a></li>
                                        <li><a target="_blank"

                                               href="/banxie/index.htm">板鞋</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/tongxie/index.htm">童鞋</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/nvxie/index.htm">女鞋</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/nanbao/index.htm">男包</a>
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

                                        <a target="_blank" class="nav-menu-

subs" href="/shenghuodianqi/index.htm">生活电器</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/pingbandianshi/index.htm">平板电视</a></li>
                                        <li><a target="_blank"

                                               href="/kongtiao/index.htm">空调</a></li>
                                        <li><a target="_blank"

                                               href="/xiyiji/index.htm">洗衣机</a></li>
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

                                        <a target="_blank" class="nav-menu-

subs" href="/wujingongju/index.htm">五金工具</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/kaiguanchazuo/index.htm">开关插座</a></li>
                                        <li><a target="_blank"

                                               href="/gongjuxiang/index.htm">工具箱</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/woshijiaj/index.htm">卧室家具</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/chuang/index.htm">床</a></li>
                                        <li><a target="_blank"

                                               href="/yigui/index.htm">衣柜</a></li>
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

                                        <a target="_blank" class="nav-menu-

subs" href="/huangjinshoushi/index.htm">黄金首饰</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/huangjinxianglian/index.htm">黄金项链</a></li>
                                        <li><a target="_blank"

                                               href="/zujinshipin/index.htm">足金饰品</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/zuanshi/index.htm">钻石彩宝</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/jiehunzuanjie/index.htm">结婚钻戒</a></li>
                                        <li><a target="_blank"

                                               href="/zuanshiershi/index.htm">钻石耳饰</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-

subs" href="/wanbiao/index.htm">腕表</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank"

                                               href="/ruishimingbiao/index.htm">瑞士名表</a></li>
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </ul>
                </li>
            </ul>
        </li>

        <!--导航栏 begin -->

        <li class="Nav-item fl first active"><a href="/" >首页</a></li>
        <input type="hidden" id="hidden1" value="1"></input>
        <li class="Nav-item fl"> <a href="${pageContext.request.contextPath}/getshuma"  id="nav1">数码</a></li>
        <input type="hidden" id="hidden2" value="2"></input>
        <li class="Nav-item fl"> <a href="${pageContext.request.contextPath}/toshuma"  id="nav2">服装</a></li>
        <input type="hidden" id="hidden3" value="3"></input>
        <li class="Nav-item fl"> <a href="${pageContext.request.contextPath}/toshuma"  id="nav3">鞋包配饰</a></li>
        <input type="hidden" id="hidden4" value="4"></input>
        <li class="Nav-item fl"> <a href="${pageContext.request.contextPath}/toshuma"  id="nav4">日用百货</a></li>
        <input type="hidden" id="hidden5" value="5"></input>
        <li class="Nav-item fl"> <a href="${pageContext.request.contextPath}/toshuma"  id="nav5">家居建材</a></li>
        <input type="hidden" id="hidden6" value="6"></input>
        <li class="Nav-item fl"> <a href="${pageContext.request.contextPath}/toshuma"  id="nav6">珠宝手表</a></li>

        <!--导航栏 end -->
    </ul>
</div>
<!--商品类目栏 end  -->

<!--中间广告图片start  -->
<div class="indexbanner">
    <ul class="buypic">
        <li><a href="http://demo3.jeecms.com/xiebao/index.htm" target="_blank"><img

                src="picture/06160743kney.jpg" width="1624" height="440" /></a></li>
        <li><a href="http://demo3.jeecms.com/fuzhuang/index.htm" target="_blank"><img

                src="picture/061607301kbo.jpg" width="1624" height="440" /></a></li>
        <li><a href="http://demo3.jeecms.com/riyongbaihuo/index.htm" target="_blank"><img

                src="picture/06160703u2s5.jpg" width="1624" height="440" /></a></li>

    </ul>
    <a class="prev" href="javascript:void(0)"></a> <a class="next"
                                                      href="javascript:void(0)"></a>
    <div class="num">
        <ul></ul>
    </div>
</div>
<script>
    /*鼠标移过，左右按钮显示*/
    $(".indexbanner").hover(function() {
        $(this).find(".prev,.next").fadeTo("show", 0.1);
    }, function() {
        $(this).find(".prev,.next").hide();
    })
    /*鼠标移过某个按钮 高亮显示*/

    $(".prev,.next").hover(function() {
        $(this).fadeTo("show", 0.7);
    }, function() {
        $(this).fadeTo("show", 0.1);
    })
    $(".indexbanner").slide({
        titCell : ".num ul",
        mainCell : ".buypic",
        effect : "fold",
        autoPlay : true,
        delayTime : 700,
        autoPage : true
    });
</script>
<!--中间广告图片end  -->

<div class="advert-img">
    <div class="w clearfix">


        <div class="fl img-item ">
            <div class="word">
                <p>
                    <a target="_blank" href="/kongtiao/56.htm">热卖</a>
                </p>
                <span><a target="_blank" href="/kongtiao/56.htm"> 全场满减 底价钜惠</a></span>
            </div>
            <a target="_blank" href="/kongtiao/56.htm">
                <img src="picture/s1.jpg"></a>

        </div>



        <div class="fl img-item ">
            <div class="word">
                <p>
                    <a target="_blank" href="/riyongbaihuo/40.htm">新品</a>
                </p>
                <span><a target="_blank" href="/riyongbaihuo/40.htm">春季新品 限时限量</a></span>
            </div>
            <a target="_blank" href="/riyongbaihuo/40.htm"><img
                    src="picture/s2.jpg"></a>
        </div>


        <div class="fl img-item ">
            <div class="word">
                <p>
                    <a target="_blank" href="/sanxing/59.htm">推荐</a>
                </p>
                <span><a target="_blank" href="/sanxing/59.htm">新出风格 高端时尚</a></span>
            </div>
            <a target="_blank" href="/sanxing/59.htm"><img
                    src="picture/s3.jpg"></a>
        </div>

        <div class="fl img-item last">
            <div class="word">
                <p>
                    <a target="_blank" href="/woshijiaj/44.htm">焕新</a>
                </p>
                <span><a target="_blank" href="/woshijiaj/44.htm">品牌精选 开春特卖</a></span>
            </div>
            <a target="_blank" href="/woshijiaj/44.htm"><img
                    src="picture/s4.jpg"></a>
        </div>





    </div>
</div>





<script type="text/javascript">
    $(function(){
        var caseHtml="<img src=picture/ffba8c65211f4e2481e125294eacbaf2.gif"/r/gou/www/imgs/c_b_1.jpg\" />";
        $(".casehtml").html(caseHtml);
        $(".c3").mouseover(function(){
            $(".casehtml").html($(this).find(".hidden").html());

            $(".caselayBox").fadeIn(300)
        });

        $(".casehtml").hover(function(){
            $(this).find(".hiddBg").stop(true,true).fadeToggle();
        });
    });
</script>
<div class="caseImg03 ctr clearfix">
    <div class="slideCase03">

        <div class="bd03">


            <div class="c3">
                <a class="grid one-grid small" href="/riyongbaihuo/40.htm">
                    <div class="title">快乐学习</div>
                    <div class="sub-title">打造亲子游戏</div>
                    <img src="picture/09110022apad.jpg">
                    </img>
                </a>

                <div class="hidden">
                    <a href="/riyongbaihuo/40.htm">  <img src="picture/09110103o39o.jpg"/>  </a>
                </div>

            </div>
            <div class="c3">
                <a class="grid one-grid small" href="/woman/35.htm">
                    <div class="title">恋爱女王节妈咪版</div>
                    <div class="sub-title">美丽变身季</div>
                    <img src="picture/08133609vw7k.jpg">
                    </img>
                </a>

                <div class="hidden">
                    <a href="/woman/35.htm">  <img src="picture/08133627vekx.jpg"/>  </a>
                </div>

            </div>
            <div class="c3">
                <a class="grid one-grid small" href="/nvxie/34.htm">
                    <div class="title">春季新品发布会</div>
                    <div class="sub-title">换新触发 ，寻找真我</div>
                    <img src="picture/08133422q64n.jpg">
                    </img>
                </a>

                <div class="hidden">
                    <a href="/nvxie/34.htm">  <img src="picture/08134513tbrl.jpg"/>  </a>
                </div>

            </div>
            <div class="c3">
                <a class="grid one-grid small" href="/riyongbaihuo/33.htm">
                    <div class="title">护栏加宽置物架</div>
                    <div class="sub-title">十年生锈包换新</div>
                    <img src="picture/081332452i71.jpg">
                    </img>
                </a>

                <div class="hidden">
                    <a href="/riyongbaihuo/33.htm">  <img src="picture/081344040ef9.jpg"/>  </a>
                </div>

            </div>
            <div class="c3">
                <a class="grid one-grid small" href="/riyongbaihuo/32.htm">
                    <div class="title">巧妇收纳秘籍</div>
                    <div class="sub-title">可省75%空间</div>
                    <img src="picture/08133139vwiz.jpg">
                    </img>
                </a>

                <div class="hidden">
                    <a href="/riyongbaihuo/32.htm">  <img src="picture/081331570f2z.jpg"/>  </a>
                </div>

            </div>
            <div class="c3">
                <a class="grid one-grid small" href="/riyongbaihuo/31.htm">
                    <div class="title">德国进口热水袋</div>
                    <div class="sub-title">安全防暴无毒保温</div>
                    <img src="picture/08133008d6xt.jpg">
                    </img>
                </a>

                <div class="hidden">
                    <a href="/riyongbaihuo/31.htm">  <img src="picture/0813433503xr.jpg"/>  </a>
                </div>

            </div>
            <div class="c3">
                <a class="grid one-grid small" href="/bg/30.htm">
                    <div class="title">木质箱 低音可调</div>
                    <div class="sub-title">快乐超酷家庭首选</div>
                    <img src="picture/08132857pwgx.jpg">
                    </img>
                </a>

                <div class="hidden">
                    <a href="/bg/30.htm">  <img src="picture/081329281jw2.jpg"/>  </a>
                </div>

            </div>
            <div class="c3">
                <a class="grid one-grid small" href="/woman/29.htm">
                    <div class="title">0-6岁 婴幼服饰</div>
                    <div class="sub-title">安全柔软舒适</div>
                    <img src="picture/08132728cc4o.jpg">
                    </img>
                </a>

                <div class="hidden">
                    <a href="/woman/29.htm">  <img src="picture/08132744djsq.jpg"/>  </a>
                </div>

            </div>
            <div class="c3">
                <a class="grid one-grid small" href="/nanbao/27.htm">
                    <div class="title">源自法国头皮 牛包</div>
                    <div class="sub-title">约会神器零钱卡片收纳</div>
                    <img src="picture/081323138k7f.jpg">
                    </img>
                </a>

                <div class="hidden">
                    <a href="/nanbao/27.htm">  <img src="picture/081322476p6l.jpg"/>  </a>
                </div>

            </div>


        </div>
    </div>
    <div class="caselayBox">
        <div class="casehtml"></div>
    </div>
</div>

<script type="text/javascript">
    jQuery(".slideCase03").slide({titCell:".hd03 ul",mainCell:".bd03 ul",autoPage:true,effect:"top",autoPlay:true,vis:3});
</script>










<!-----------------------1start-------------------------------->
<div class="j_floor floor-con">
    <div class="floor-line-con color-type-blue">
        <i class="color-mark"></i>
        <div class="floor-name">数码</div>
        <div class="line-body">
            <div class="hot-word-con">

                <a href="/shouji/index.htm" class="hot-word">手机</a>
                <a href="/bjb/index.htm" class="hot-word">笔记本</a>
                <a href="/tsj/index.htm" class="hot-word">电脑整机</a>
                <a href="/bg/index.htm" class="hot-word">办公</a>
                <a href="/xj/index.htm" class="hot-word">摄影摄像</a>

            </div>
            <div class="left-column-con blueBg">
                <div class="title">坚果智能影院</div>
                <div class="sub-title">潮酷数码</div>
                <div class="bg-title">智能换新家</div>
                <img src="picture/left-column-con-blue-pic.jpg"
                     width="190" />
                <div class="keyword-list">

                </div>
            </div>
            <div class="big-banner-con">

                <div class="jiaodiantu1">
                    <!--<ul class="buypic">
                        <li><a href=""><img src="picture/f1.jpg" /></a></li>
                        <li><a href=""><img src="picture/f1c.jpg" /></a></li>
                        <li><a href=""><img src="picture/f1b.jpg" /></a></li>
                    </ul>-->


                    <ul class="buypic">
                        <li><a href="/shouji/index.htm"><img src="picture/f1b.jpg" /></a></li>
                        <li><a href="/bjb/index.htm"><img src="picture/f1.jpg" /></a></li>
                        <li><a href="/xj/index.htm"><img src="picture/f1c.jpg" /></a></li>
                    </ul>




                    <a class="prev" href="javascript:void(0)"></a> <a class="next"
                                                                      href="javascript:void(0)"></a>
                    <div class="num">
                        <ul></ul>
                    </div>
                </div>
                <script>
                    /*鼠标移过，左右按钮显示*/
                    $(".jiaodiantu1").hover(function() {
                        $(this).find(".prev,.next").fadeTo("show", 0.1);
                    }, function() {
                        $(this).find(".prev,.next").hide();
                    })
                    /*鼠标移过某个按钮 高亮显示*/

                    $(".prev,.next").hover(function() {
                        $(this).fadeTo("show", 0.7);
                    }, function() {
                        $(this).fadeTo("show", 0.1);
                    })
                    $(".jiaodiantu1").slide({
                        titCell : ".num ul",
                        mainCell : ".buypic",
                        effect : "fold",
                        autoPlay : true,
                        delayTime : 700,
                        autoPage : true
                    });
                </script>

            </div>

            <div class="right-column-con">
                <a class="grid one-grid"  href="/sanxing/59.htm">
                    <div class="title">【低价疯抢】Appl

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/02161238e7wo.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/bg/16.htm">
                    <div class="title">虚拟现实3d眼镜

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/061626478mo5.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/tsj/15.htm">
                    <div class="title">Edifier/漫步者

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/061625384z8h.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/bjb/14.htm">
                    <div class="title">Asus/华硕 FX

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/06162402vno3.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/xj/13.htm">
                    <div class="title">天猫魔盒3Pro

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/06162301f2zj.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/Iphone/12.htm">
                    <div class="title">小米手环2蓝牙

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/0616183833km.jpg">
                    </img>

                </a>
            </div>

        </div>
    </div>
</div>
<!-----------------------1end-------------------------------->


<!-----------------------2start-------------------------------->
<div class="j_floor floor-con">
    <div class="floor-line-con color-type-pink">
        <i class="color-mark"></i>
        <div class="floor-name">服装</div>
        <div class="line-body">
            <div class="hot-word-con">
                <a href="/woman/index.htm" class="hot-word">女装</a>
                <a href="/man/index.htm" class="hot-word">男装</a>
                <a href="/child/index.htm" class="hot-word">童装</a>
                <a href="/neiyi/index.htm" class="hot-word">内衣</a>
                <a href="/kuzi/index.htm" class="hot-word">裤子</a>
            </div>
            <div class="left-column-con pinkBg">
                <div class="title">卧室个性巧搭</div>
                <div class="sub-title">懂你 懂生活</div>
                <div class="bg-title">2件8折优惠</div>
                <img src="picture/left-column-con-pink-pic.jpg"
                     width="190" />
                <div class="keyword-list">

                </div>
            </div>
            <div class="big-banner-con">
                <div class="jiaodiantu2">
                    <!--<ul class="buypic">
                        <li><a href=""><img src="picture/f2.jpg" /></a></li>
                        <li><a href=""><img src="picture/f2b.jpg" /></a></li>
                        <li><a href=""><img src="picture/f2.jpg" /></a></li>
                    </ul>-->



                    <ul class="buypic">
                        <li><a href="/woman/index.htm"><img src="picture/f2.jpg" /></a></li>
                        <li><a href="/man/index.htm"><img src="picture/f2b.jpg" /></a></li>
                        <li><a href="/neiyi/index.htm"><img src="picture/f2c.jpg" /></a></li>
                    </ul>





                    <a class="prev" href="javascript:void(0)"></a> <a class="next"
                                                                      href="javascript:void(0)"></a>
                    <div class="num">
                        <ul></ul>
                    </div>
                </div>
                <script>
                    /*鼠标移过，左右按钮显示*/
                    $(".jiaodiantu2").hover(function() {
                        $(this).find(".prev,.next").fadeTo("show", 0.1);
                    }, function() {
                        $(this).find(".prev,.next").hide();
                    })
                    /*鼠标移过某个按钮 高亮显示*/

                    $(".prev,.next").hover(function() {
                        $(this).fadeTo("show", 0.7);
                    }, function() {
                        $(this).fadeTo("show", 0.1);
                    })
                    $(".jiaodiantu2").slide({
                        titCell : ".num ul",
                        mainCell : ".buypic",
                        effect : "fold",
                        autoPlay : true,
                        delayTime : 700,
                        autoPage : true
                    });
                </script>
            </div>
            <div class="right-column-con">
                <a class="grid one-grid"  href="/woman/37.htm">
                    <div class="title">牛仔裤

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/09110440ls2s.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/woman/22.htm">
                    <div class="title">茵曼内衣

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/06171019ezrz.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/woman/21.htm">
                    <div class="title">派克外套

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/06170852f8wr.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/woman/20.htm">
                    <div class="title">蝴蝶结饰牛仔夹克

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/06170735f214.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/man/19.htm">
                    <div class="title">青年外衣棒球服

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/06170631wgix.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/man/18.htm">
                    <div class="title">男长袖白衬衫

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/06170500mfam.jpg">
                    </img>

                </a>
            </div>
        </div>
    </div>
</div>


<div class="j_floor floor-con">
    <div class="floor-line-con color-type-green">

        <i class="color-mark"></i>
        <div class="floor-name">家居建材</div>
        <div class="line-body">
            <div class="hot-word-con">
                <a href="/wujingongju/index.htm" class="hot-word">五金工具</a>
                <a href="/woshijiaj/index.htm" class="hot-word">卧室家具</a>
            </div>
            <div class="left-column-con greenBg">
                <div class="title">卧室个性巧搭</div>
                <div class="sub-title">懂你 懂生活</div>
                <div class="bg-title">2件8折优惠</div>
                <img src="picture/left-column-con-green-pic.jpg"
                     width="190" />
                <div class="keyword-list">

                </div>
            </div>
            <div class="big-banner-con">
                <div class="jiaodiantu3">


                    <ul class="buypic">
                        <li><a href="/wujingongju/index.htm"><img src="picture/f3c.jpg" /></a></li>
                        <li><a href="/woshijiaj/index.htm"><img src="picture/f3.jpg" /></a></li>
                    </ul>


                    <a class="prev" href="javascript:void(0)"></a> <a class="next"
                                                                      href="javascript:void(0)"></a>
                    <div class="num">
                        <ul></ul>
                    </div>
                </div>
                <script>
                    /*鼠标移过，左右按钮显示*/
                    $(".jiaodiantu3").hover(function() {
                        $(this).find(".prev,.next").fadeTo("show", 0.1);
                    }, function() {
                        $(this).find(".prev,.next").hide();
                    })
                    /*鼠标移过某个按钮 高亮显示*/

                    $(".prev,.next").hover(function() {
                        $(this).fadeTo("show", 0.7);
                    }, function() {
                        $(this).fadeTo("show", 0.1);
                    })
                    $(".jiaodiantu3").slide({
                        titCell : ".num ul",
                        mainCell : ".buypic",
                        effect : "fold",
                        autoPlay : true,
                        delayTime : 700,
                        autoPage : true
                    });
                </script>
            </div>
            <div class="right-column-con">
                <a class="grid one-grid"  href="/wujingongju/39.htm">
                    <div class="title">不锈钢三角支架承

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/130946189262.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/woshijiaj/36.htm">
                    <div class="title">天然乳胶床垫席梦

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/091056187tib.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/woshijiaj/28.htm">
                    <div class="title">伊甸嘉园真皮沙发

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/13095401tlfm.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/woshijiaj/26.htm">
                    <div class="title">护腰靠垫办公室腰

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/06172100h4h8.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/woshijiaj/25.htm">
                    <div class="title">推拉门衣柜 推拉

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/13102848c957.jpg">
                    </img>

                </a>
                <a class="grid one-grid"  href="/woshijiaj/24.htm">
                    <div class="title">后现代时尚个性铜

                    </div>
                    <div class="sub-title">联合营销</div>
                    <img
                            src="picture/1310173552gr.jpg">
                    </img>

                </a>
            </div>
        </div>
    </div>
</div>





<div class="guess_main">
    <div class="title">猜你喜欢</div>
    <div class="wonderful-con">
        <ul style="display: block">



            <li>  <a href="/kongtiao/56.htm">
                <img src="picture/10132243iug1.jpg">
                <p class="guess_title">奥克斯（AUX）1.5匹 变频 冷暖电辅 二级能</p>
                <p class="guess_price">
                    <span class="yuan">¥</span> 1599
                </p>
            </a>
            </li>
            <li>  <a href="/pingbandianshi/55.htm">
                <img src="picture/10132132cm7d.jpg">
                <p class="guess_title">海尔彩电LE32G310G 32英寸高清LED液晶电视</p>
                <p class="guess_price">
                    <span class="yuan">¥</span> 1299
                </p>
            </a>
            </li>
            <li>  <a href="/jiehunzuanjie/54.htm">
                <img src="picture/10132034y3zr.jpg">
                <p class="guess_title">梦克拉白18K金钻石戒指 缘美 女戒指</p>
                <p class="guess_price">
                    <span class="yuan">¥</span> 11999
                </p>
            </a>
            </li>
            <li>  <a href="/ipad/53.htm">
                <img src="picture/10131953rujl.jpg">
                <p class="guess_title">Apple iPad Air 2 平板电脑</p>
                <p class="guess_price">
                    <span class="yuan">¥</span> 1399
                </p>
            </a>
            </li>
            <li>  <a href="/banxie/52.htm">
                <img src="picture/10131853kztz.jpg">
                <p class="guess_title">阿迪达斯adidas男鞋跑步鞋 AQ2182</p>
                <p class="guess_price">
                    <span class="yuan">¥</span> 418
                </p>
            </a>
            </li>
            <li>  <a href="/ruishimingbiao/51.htm">
                <img src="picture/101317544ckb.jpg">
                <p class="guess_title">天梭/Tissot 瑞士手表 俊雅系列多功能钢带</p>
                <p class="guess_price">
                    <span class="yuan">¥</span> 1599.9
                </p>
            </a>
            </li>

        </ul>
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
</div></body>
</html>
