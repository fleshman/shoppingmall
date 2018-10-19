<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image">
        <div>
          <p class="app-sidebar__user-name">${sessionUser.nickname}</p>
          <p class="app-sidebar__user-designation">Frontend Developer</p>
        </div>
      </div>
      <ul class="app-menu">
        <!-- 个人中心 -->
        <li><a class="app-menu__item active" href="userMessage"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">个人中心</span></a></li>
        
        <li><a class="app-menu__item" href="orderMessage"><i class="app-menu__icon fa fa-pie-chart"></i><span class="app-menu__label">订单管理</span></a></li>
       <c:if test="${sessionUser.isadmin==1}">
           <li><a class="app-menu__item active" href="totable"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">商品管理</span></a></li>

       </c:if>

        
        <li><a class="app-menu__item active" href="cart2"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">购物车</span></a></li>

        <li><a class="app-menu__item active" href="account"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">支付系统</span></a></li>

      </ul>
    </aside>