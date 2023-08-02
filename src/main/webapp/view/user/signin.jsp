<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hashira | Signin</title>
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
				<li class="breadcrumb-item active" aria-current="page">Sign in</li>
			</ol>
		</nav>
	</div>
	<!-- Signin -->
	<div class="pb-4" style="background-color: #ffffff;">
		<div class="container py-5 h-300">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-8 col-xl-6">
					<div class="card rounded-3">
						<img height="180px" src="https://ndf.vn/media/cache/data/old/Sunset-Sky-over-Salzburg,-Austria-L-cr-800x300.jpg" class="w-100 d-none d-lg-block"
                                style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
                                alt="Sample photo">
						<div class="card-body p-4 p-md-5 ">
							<h3 class="text-center"
								style="font-weight: bolder; color: #7fad39;"">SIGN IN</h3>
							<br>
							<div class=" row justify-content-center align-items-center">
								<form action="Signin" method="POST">
									<div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<label class="fw-bold" for="profileID">Username <span
													class="text-danger">(*)</span></label> <input type="text"
													id="profileID" class="form-control mt-2 mb-2"
													name="username" required>
											</div>
										</div>
										<div class="col-lg-12">
											<div class="form-group">
												<label class="fw-bold" for="profilePass">Password <span
													class="text-danger">(*)</span></label> <input type="password"
													id="profilePass" class="form-control mt-2 mb-2"
													name="password" required> <a href="#"
													class="show-password"><i class="fa fa-eye"></i>Hiện mật khẩu</a>
											</div>
										</div>
										<div class="col-lg-12">
											<div class="form-group">
												<input type="checkbox" name="" id=""> Remember me?
											</div>
										</div>
									</div>
									<hr>
									<div class="text-center">
										<button type="submit" class="btn btn-lg courseHover"
											style="background-color: #7fad39;">Sign in</button>
										<br> 
										<label class="text-center mt-3"
											style="color: #7fad39;">Not account? Let's<a
											href="Signup"> sign up</a> now.
										</label>
										<br>
										<label class="text-center mt-3"
											style="color: #7fad39;"><a href="ForgotPassword"> Quên mật khẩu </a>
										</label>
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


	<!-- JS Xem mật khẩu -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const showPasswordLink = document.querySelector('.show-password');
			const passwordInput = document.getElementById('profilePass');

			showPasswordLink.addEventListener('click', function(event) {
				event.preventDefault();
				if (passwordInput.type === 'password') {
					passwordInput.type = 'text';
					showPasswordLink.textContent = 'Ẩn mật khẩu';
				} else {
					passwordInput.type = 'password';
					showPasswordLink.textContent = 'Hiện mật khẩu';
				}
			});
		});
	
			// Kiểm tra xem có thông báo gửi mail thành công từ servlet hay không
			var mailSentSuccess = <%=request.getAttribute("mailSentSuccess")%>;
	
			// Nếu có thông báo gửi mail thành công, hiển thị alert
			if (mailSentSuccess) {
				alert("Gửi mail thành công! Vui lòng kiểm tra email để nhận mật khẩu mới.");
			}
	</script>
</body>
</html>