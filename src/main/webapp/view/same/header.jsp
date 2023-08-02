<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>

<div id="preloder">
	<div class="loader"></div>
</div>

<!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="<c:url value='/view/assets/user/img/logo.png'/>" alt=""></a>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Tiếng Việt</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="Index">Home</a></li>
                <c:choose>
							<c:when test="${not empty sessionScope.currentUser}">
								<li><a href="">Hi,
										${sessionScope.currentUser.fullname}!</a>
									<ul class="header__menu__dropdown">
										<li><a href="ForgotPassword">Forgot Password</a></li>
										<li><a href="ChangePassword">Change Password</a></li>
										<li><a href="EditProfile">Edit Profile</a></li>
										<li><a href="Favourite">My Favourite</a></li>
										<li><a href="Signout">Signout</a></li>
									</ul></li>
							</c:when>
							<c:otherwise>
								<li><a href="Signin">Signin</a></li>
								<li><a href="Signup">Signup</a></li>
								<li><a href="ForgotPassword">Forgot Password</a></li>
							</c:otherwise>
						</c:choose>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        
    </div>
    <!-- Humberger End -->

<!-- Header For User-->
<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="header__top__left">
						<ul>
							<li><i class="fa fa-envelope"></i> hashira@entertainment.com</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="header__top__right">
						<div class="header__top__right__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-linkedin"></i></a> <a href="#"><i
								class="fa fa-pinterest-p"></i></a>
						</div>
						<div class="header__top__right__language">
							<img src="<c:url value='/view/assets/user/img/language.png'/>"
								alt="">
							<div>English</div>
							<span class="arrow_carrot-down"></span>
							<ul>
								<li><a href="">Tiếng Việt</a></li>
								<li><a href="">English</a></li>
							</ul>
						</div>
						<!-- <div class="header__top__right__auth">
                                <a href="#"><i class="fa fa-user"></i> Login</a>
                            </div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
				<div class="header__logo">
					<a href="Index"> <img
						src="<c:url value='/view/assets/user/img/logo.png'/>" alt=""
						width="170px"></a>
				</div>
			</div>
			<div class="col-lg-5">
				<nav class="header__menu">
					<ul>
						<li class="active"><a href="Index">Home</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Blog</a></li>
						<c:if test="${sessionScope.currentUser != null && sessionScope.currentUser.isAdmin == true}">
						<li><a href="Admin">Admin</a>
							<ul class="header__menu__dropdown">
								<li><a href="VideoManagement">Video Management</a></li>
								<li><a href="UserManagement">User Management</a></li>
								<li><a href="FavouriteManagement">Favourite Management</a></li>

							</ul>
						</li>
						</c:if>
					</ul>
				</nav>
			</div>
			<div class="col-lg-5 text-right">
				<nav class="header__menu">
					<ul>
						<c:choose>
							<c:when test="${not empty sessionScope.currentUser}">
								<li><a href="">Hi,
										${sessionScope.currentUser.fullname}!</a>
									<ul class="header__menu__dropdown">
										<li><a href="ChangePassword">Change Password</a></li>
										<li><a href="EditProfile">Edit Profile</a></li>
										<li><a href="Favourite">My Favourite</a></li>
										<li><a href="Signout">Signout</a></li>
									</ul></li>
							</c:when>
							<c:otherwise>
								<li><a href="Signin">Signin</a></li>
								<li><a href="Signup">Signup</a></li>
								<li><a href="ForgotPassword">Forgot Password</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
		</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>
<section class="hero">
	<div class="container">
		<div class="row">

			<div class="col-lg-12">
				<div class="hero__search">
					<div class="hero__search__form">
						<form action="#">
							<div class="hero__search__categories">
								All Categories <span class="arrow_carrot-down"></span>
							</div>
							<input type="text" placeholder="What is your favourite movie?">
							<button type="" class="site-btn">SEARCH</button>
						</form>
					</div>
					<div class="hero__search__phone">
						<div class="hero__search__phone__icon">
							<i class="fa fa-phone"></i>
						</div>
						<div class="hero__search__phone__text">
							<h5>+123 456 789</h5>
							<span>Support 24/7 time</span>
						</div>
					</div>
				</div>
				<div class="hero__item set-bg"
					data-setbg="https://i.pinimg.com/originals/8f/86/2d/8f862dd74a106b5e26164f77c642a8c3.jpg"
					w-100>
					<div class="hero__text">
						<h3
							style="text-align: center; background-color: red; font-weight: bold; color: rgb(255, 214, 49);">JUJUTSU</h3>
						<h3
							style="text-align: center; background-color: red; font-weight: bold; color: rgb(255, 214, 49);">KAISEN</h3>
						<a href="#" class="primary-btn">SEASON 2</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>