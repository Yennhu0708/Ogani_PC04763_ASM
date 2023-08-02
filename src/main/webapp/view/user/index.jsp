<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hashira | Online Entertainment</title>

<!-- Head -->
<%@ include file="/view/same/head.jsp"%>

</head>

<style>

.col-12 {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    
    
.navigation-section {
	text-align: center;
}

.navigation-buttons {
	display: flex;
	justify-content: space-between;
	width: 200px; /* Điều chỉnh chiều rộng của nút cha */
	margin: 0 auto; /* Canh giữa nút cha */
}

.nav-button {
	display: block;
	width: 40px; /* Kích thước vuông cho nút */
	height: 40px; /* Kích thước vuông cho nút */
	line-height: 40px; /* Dùng để căn giữa icon trong nút */
	text-align: center;
	background-color: #7fad39; /* Màu nền xanh lá */
	color: white; /* Màu chữ trắng */
	border-radius: 5px; /* Bo góc nút */
}

.nav-button:hover {
	color: white;
	background-color: #f44336; /* Màu nền đỏ khi hover */
}

    .page-label {
        /* Các thuộc tính CSS cho số trang hiện tại */
        text-align: right; /* Canh phải số trang hiện tại */
    }

</style>

<body>

	<!-- Header -->
	<%@ include file="/view/same/header.jsp"%>

	<!-- Categories Of Movie -->
	<section class="categories pt-0">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 mb-2">
					<div class="section-title">
						<h2>Categories</h2>
					</div>
				</div>
				<div class="categories__slider owl-carousel">
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="<c:url value='view/assets/user/img/categories/cat-1.jpg'/>">
							<h5>
								<a href="">Action</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="<c:url value='view/assets/user/img/categories/cat-2.jpg'/>">
							<h5>
								<a href="">Horror</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="<c:url value='view/assets/user/img/categories/cat-3.jpg'/>">
							<h5>
								<a href="">Drama</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="<c:url value='view/assets/user/img/categories/cat-4.jpg'/>">
							<h5>
								<a href="">Sci-Fiction</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="<c:url value='view/assets/user/img/categories/cat-5.jpg'/>">
							<h5>
								<a href="">Anime</a>
							</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Movie List -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 mb-2">
					<div class="section-title">
						<h2>Enjoy your spare time!</h2>
					</div>
				</div>
			</div>
			<div class="row featured__filter">
				<c:forEach items="${videos}" var="video">
					<div class="col-lg-4 col-md-4 col-sm-6 mix oranges fresh-meat">
						<div class="featured__item">
							<div class="featured__item__pic set-bg"
								data-setbg="<c:url value='${video.poster}'/>">
								<div class="featured__item__stats">
									<div class="featured__item__views">

										<span class="views-count"><i class="fa fa-eye"></i>&nbsp;${video.view}</span>
									</div>
									<div class="featured__item__shares">

										<span class="shares-count"><i class="fa fa-share-alt"></i>&nbsp;${video.shares}</span>
									</div>
								</div>
							</div>
							<div class="featured__item__text">
								<h6>
									<a class="btn"
										href="<c:url value = '/video?action=watch&id=${video.href}'/>">${video.title}</a>
								</h6>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<!--Nút điều hướng video list-->
	<section class="navigation-section" style="margin-top: 20px;">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="navigation-buttons">
						<c:if test="${currentPage == 1}">
							<!--<a href="#"><i class="fa fa-angle-double-left disabled"></i></a>-->
							<a class="nav-button" href="#"><i class="fa fa-fast-backward disabled"></i></a>
						</c:if>
						<c:if test="${currentPage > 1}">
							<!--<a href="index?page=${currenPage - 1}"><i class="fa fa-angle-double-left"></i></a>-->
							<a class="nav-button" href="Index?page=${currentPage - 1}"><i class="fa fa-backward"></i></a>
						</c:if>
						<c:forEach varStatus="i" begin="1" end="${maxPage}">
							<a class="nav-button" href="Index?page=${i.index}"  class="current-page ${currentPage == i.index ? 'active' : ''}">${i.index}</a>
						</c:forEach>
						<c:if test="${currentPage == maxPage}">
							<!--<a href="#"><i class="fa fa-angle-double-right disabled"></i></a>-->
							<a class="nav-button" href="#"><i class="fa fa-forward"></i></a>
						</c:if>
						<c:if test="${currentPage < maxPage}">
							<!--<a href="index?page=${currenPage + 1}"><i class="fa fa-angle-double-right"></i></a>-->
							<a class="nav-button" href="Index?page=${currentPage + 1}"><i class="fa fa-fast-forward"></i></a>
						</c:if>						
					</div>
					<span style="color: #7fad39;">Page&nbsp</span>
					<span id="currentPageNumber" class="page-label">${currentPage}</span>&nbsp
					<span style="color: #7fad39;">/&nbsp${maxPage}</span>
				</div>
			</div>
		</div>
	</section>

	<!-- Banner -->
	<div class="banner mt-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 mb-2">
					<div class="section-title">
						<h2>Coming Soon</h2>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img
							src="<c:url value='view/assets/user/img/banner/banner-01.jpg'/>"
							alt="">
						<div class="hero__text">
							<h3 class="primary-btn">July 2023</h3>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 text-right">
					<div class="banner__pic">
						<img
							src="<c:url value='view/assets/user/img/banner/banner-02.jpg'/>"
							alt="">
						<div class="hero__text">
							<h3 class="primary-btn">August 2023</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Blog Section Begin -->
	<section class="from-blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title from-blog__title">
						<h2>From The Blog</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img
								src="https://img.youtube.com/vi/Y9dr2zw-TXQ/maxresdefault.jpg"
								alt="">
						</div>
						<div class="blog__item__text">
							<ul>
								<li><i class="fa fa-calendar-o"></i> May 4,2023</li>
								<li><i class="fa fa-comment-o"></i> 5</li>
							</ul>
							<h5 style="font-weight: bolder; font-size: 20px;">Fantastic
								Beasts vs Harry Potter Stars</h5>
							<p>For many people who are fans of the wizarding world, they
								will love both the Fantastic Beasts series and all things Harry
								Potter.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img
								src="https://img.youtube.com/vi/LM3qt-gHkWU/maxresdefault.jpg"
								alt="">
						</div>
						<div class="blog__item__text">
							<ul>
								<li><i class="fa fa-calendar-o"></i> June 15,2023</li>
								<li><i class="fa fa-comment-o"></i> 5</li>
							</ul>
							<h5 style="font-weight: bolder; font-size: 20px;">Brendan
								Fraser stuns in The Whale</h5>
							<p>From director Darren Aronofsky and starring Brendan
								Fraser, Sadie Sink, and Hong Chau. The Whale opens in Australian
								cinemas February 2.
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img
								src="https://img.youtube.com/vi/H4vHc9iQc3c/maxresdefault.jpg"
								alt="">
						</div>
						<div class="blog__item__text">
							<ul>
								<li><i class="fa fa-calendar-o"></i> July 10,2023</li>
								<li><i class="fa fa-comment-o"></i> 5</li>
							</ul>
							<h5 style="font-weight: bolder; font-size: 20px;">Behind of
								Optimus</h5>
							<p>Transformers, an epic science fiction story about cars and
								robots. List of characters: Bumblebee, Optimus Prime,
								Megatron,... Superhero Movies 2023.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<%@ include file="/view/same/footer.jsp"%>
	
	<script>
    const urlParams = new URLSearchParams(window.location.search);
    const currentPage = parseInt(urlParams.get('page')) || 1;
    document.getElementById('currentPageNumber').textContent = currentPage;
</script>

</body>

</html>