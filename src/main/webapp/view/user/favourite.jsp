<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hashira | Favourite Movies</title>
<%@ include file="/view/same/head.jsp"%>
</head>

<style>
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
  
  /*Xử lý nút LIKE SHARE trong form Favourite*/
/* CSS thể hiện nút THICH và CHIASE */
.favourite-video-buttons {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 5px; /* Khoảng cách giữa nút và tiêu đề */
}

.favourite-like-button,
.favourite-share-button {
	font-size: 16px;
	color: white;
	padding: 8px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s, box-shadow 0.3s;
}

.favourite-like-button {
	background-color: #f44336;
	/* Nền xanh dương */
}

.favourite-share-button {
	background-color: rgb(128, 0, 255);
	/* Nền tím */
	margin-left: 10px;
	/* Khoảng cách giữa nút THICH và CHIASE */
}

/* Hiệu ứng khi hover vào nút */
.favourite-like-button:hover,
.favourite-share-button:hover {
	box-shadow: 0 5px 5px rgba(0, 0, 0, 0.2);
	color:#000;
}

/* Hiệu ứng khi click vào nút THICH */
.favourite-like-button:active {
	background-color: #f44336;
	/* Nền đỏ */
}
</style>

<body>
	<!-- Header -->
	<%@ include file="/view/same/header.jsp"%>

	<!-- Breadcrumb -->
	<div class="container">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="Index">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page"> Favourite Movies</li>
			</ol>
		</nav>
	</div>
	
<!-- Movie List -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 mb-2">
					<div class="section-title">
						<h2>Your favourite movies!</h2>
					</div>
				</div>
			</div>
			<div class="row featured__filter">
				<c:forEach items="${videos}" var="video">
					<div class="col-lg-4 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg"
                            data-setbg="<c:url value='${video.poster}'/>">
                                                        
                        </div>
                        <div class="featured__item__text">
                        	<div class="favourite-video-buttons">
                                <a class="favourite-like-button float-left" style="margin-left: 5px" 
                                href="<c:url value = '/video?action=remove&id=${video.href}'/>" >REMOVE</a>
                                <a class="favourite-share-button float-right" style="margin-right: 5px""
                                href="Index"  >SHARE</a>
                            </div>
                            <h6>
                                <a class="btn" href="<c:url value = '/video?action=watch&id=${video.href}'/>">${video.title}</a>
                            </h6>
                        </div>
                        
                    </div>
                </div>
				</c:forEach>
			</div>
		</div>
	</section>
	
	<!--Nút điều hướng video list-->
    <section class="navigation-section" style="margin-top: 20px;margin-bottom: 20px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="navigation-buttons">
                        <a class="nav-button" href="#"><i class="fa fa-fast-backward"></i></a>
                        <a class="nav-button" href="#"><i class="fa fa-backward"></i></a>
                        <a class="nav-button" href="#"><i class="fa fa-forward"></i></a>
                        <a class="nav-button" href="#"><i class="fa fa-fast-forward"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>


	<!-- Footer -->
	<%@ include file="/view/same/footer.jsp"%>
	
</body>
</html>