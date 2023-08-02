<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hashira | Edit Profile</title>
<%@ include file="/view/same/head.jsp"%>
</head>
<body>
	<!-- Header -->
	<%@ include file="/view/same/header.jsp"%>

	<!-- Breadcrumb -->
	<div class="container">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="Index">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Edit
					Profile</li>
			</ol>
		</nav>
	</div>

	<!-- Edit profile -->
	<div class="pb-2" style="background-color: #ffffff;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-8 col-xl-6">
					<div class="card rounded-3">
						<img height="180px"
							src="https://ndf.vn/media/cache/data/old/Sunset-Sky-over-Salzburg,-Austria-L-cr-800x300.jpg"
							class="w-100 d-none d-lg-block"
							style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
							alt="Sample photo">
						<div class="card-body p-4 p-md-5 ">
							<h3 class="text-center"
								style="font-weight: bolder; color: #7fad39;">EDIT PROFILE</h3>
							<br>
							<div class="row justify-content-center align-items-center">
								<form action="EditProfile" method="POST">
									<div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<label class="fw-bold" for="profileID">Username <span
													class="text-danger">(*)</span></label> <input type="text"
													id="profileID" class="form-control mt-2 mb-2"
													name="username" value="${username}" readonly>
											</div>
										</div>
										<div class="col-lg-12">
											<div class="form-group">
												<label class="fw-bold" for="profileID">Fullname <span
													class="text-danger">(*)</span></label> <input type="text"
													id="profileID" class="form-control mt-2 mb-2"
													name="fullname" value="${fullname}" required>
											</div>
										</div>
										<div class="col-lg-12">
											<div class="form-group">
												<label class="fw-bold" for="profileID">Email <span
													class="text-danger">(*)</span></label> <input type="text"
													class="form-control mt-2 mb-2" name="email" value="${email}" required>
												<c:if test="${param.error == 'EmailAlreadyExists'}">
													<p class="text-danger">Email đã tồn tại. Vui lòng nhập
														email khác.</p>
												</c:if>
											</div>
										</div>
									</div>
									<hr>
									<div class="text-center">
										<button type="submit" class="btn btn-lg courseHover"
											style="background-color: #7fad39;">EDIT</button>
										<br>
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/view/same/footer.jsp"%>

</body>
</html>