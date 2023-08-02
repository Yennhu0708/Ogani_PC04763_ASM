<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hashira | Video Create</title>

<!-- Head -->
<%@ include file="/view/admin/same/head.jsp"%>

</head>

<body>

	<!-- Up Header -->
	<%@ include file="/view/admin/same/upheader.jsp"%>

	<div class="container-fluid page-body-wrapper">

		<!-- Header -->
		<%@ include file="/view/admin/same/header.jsp"%>

		<!-- Video Edition -->
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="row">

					<div class="col-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">NEW VIDEO</h4>
								<p class="card-description"></p>
								<form action="VideoNew" class="forms-sample" method="post">
									<div class="form-group">
										<label for="exampleInputName1">Youtube ID</label> <input
											type="text" class="form-control"
											id="exampleInputName1" name="href" required>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail3">Video Title</label> <input
											type="text" class="form-control"
											id="exampleInputEmail3" name="title" required>
									</div>
									<div class="form-group">
										<label for="exampleInputName1">Image Link</label> <input
											type="text" class="form-control"
											id="exampleInputName1" name="poster"
											onchange="previewImage(this.value)" required>
									</div>
									<div class="form-group">
										<label for="imagePreview">Image Preview:</label>
										<div class="image-container">
											<img alt="" src="" class="img-fluid w-50"
												id="previewImg">
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">Status</label>
										<div class="col-sm-4">
											<div class="form-check">
												<label class="form-check-label"> 
												<input type="radio" class="form-check-input" name="status"
													id="membershipRadios1" value="true" checked required> Active
												</label>
											</div>
										</div>
										<div class="col-sm-5">
											<div class="form-check">
												<label class="form-check-label"> 
												<input type="radio" class="form-check-input" name="status"
													id="membershipRadios2" value="false" required> Inactive
												</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="exampleTextarea1">Description</label>
										<textarea value="" class="form-control"
											id="exampleTextarea1" rows="4description" name="description" required></textarea>
									</div>
									<input type="hidden" class="form-control" name="id">
									<button type="submit" style="background-color: #4B49AC; color:white" class="btn mr-2">Create</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- main-panel ends -->
	</div>

	<!-- Footer -->
	<%@ include file="/view/admin/same/footer.jsp"%>

	<script>
		function previewImage(imageURL) {
			const imagePreview = document.getElementById('previewImg');
			if (isValidURL(imageURL)) {
				imagePreview.src = imageURL;
			} else {
				// Nếu URL không hợp lệ hoặc không có URL được nhập, hiển thị hình ảnh mặc định hoặc xóa hình ảnh
				imagePreview.src = 'URL của hình ảnh mặc định';
				// hoặc có thể xóa hình ảnh bằng cách sử dụng dòng sau:
				// imagePreview.src = '';
			}
		}

		// Kiểm tra xem URL có hợp lệ hay không
		function isValidURL(url) {
			// Regex kiểm tra URL
			const pattern = /^(ftp|http|https):\/\/[^ "]+$/;
			return pattern.test(url);
		}
	</script>
</body>

</html>