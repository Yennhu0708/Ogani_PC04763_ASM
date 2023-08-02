<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>

<!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="Admin">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li> 
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#account" aria-expanded="false" aria-controls="charts">
              <i class="icon-cloud menu-icon"></i>
              <span class="menu-title">My Account</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="account">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="Index">User Page</a></li>
                <li class="nav-item"> <a class="nav-link" href="Signout">Sign Out</a></li>
              </ul>
            </div>
          </li>         
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#video-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-video menu-icon"></i>
              <span class="menu-title">Video</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="video-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="VideoEdition">Video Edition</a></li>
                <li class="nav-item"> <a class="nav-link" href="VideoNew">Video New</a></li>
                <li class="nav-item"> <a class="nav-link" href="VideoList">Video List</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#user-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">User</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="user-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="UserEdition">User Edition</a></li>
                <li class="nav-item"> <a class="nav-link" href="UserList">User List</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#favourite" aria-expanded="false" aria-controls="charts">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">Favourite</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="favourite">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="<c:url value = '/view/assets/admin/pages/favourite/favourite.html'/>">Favourite</a></li>
                <li class="nav-item"> <a class="nav-link" href="<c:url value = '/view/assets/admin/pages/favourite/favouriteuser.html'/>">Favourite Users</a></li>
                <li class="nav-item"> <a class="nav-link" href="<c:url value = '/view/assets/admin/pages/favourite/shared.html'/>">Shared Friends</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </nav>
      <!-- partial -->