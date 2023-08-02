<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hashira | User Management</title>
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
				<li class="breadcrumb-item active" aria-current="page">User
					Management</li>
			</ol>
		</nav>
	</div>

	<div class="container mt-3 mb-2">
		<ul class="nav nav-pills pb-3" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="home-tab"
				data-toggle="pill" href="#home" role="tab" aria-controls="home"
				aria-selected="true">User Edition</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="pill" href="#profile" role="tab"
				aria-controls="profile" aria-selected="false">User List</a></li>
		</ul>

		<div class="tab-content" id="myTabContent">
			<!-- useredition -->
			<div class="tab-pane fade show active" id="home" role="tabpanel"
				aria-labelledby="home-tab">
				<div class="container">
					<div class="card border-0">
						<div class="card-body">
							<div class="row">
								<div class="col-lg-6 col-xs-12 col-md-12">
									<div class="form-group">
										<label for="label1">Username</label> <input type="text"
											class="form-control" id="label1">
									</div>
								</div>
								<div class="col-lg-6 col-xs-12 col-md-12">
									<div class="form-group">
										<label for="label1">Password</label> <input type="text"
											class="form-control" id="label1">
									</div>
								</div>
								<div class="col-lg-6 col-xs-12 col-md-12">
									<div class="form-group">
										<label for="label1">Fullname</label> <input type="text"
											class="form-control" id="label1">
									</div>
								</div>
								<div class="col-lg-6 col-xs-12 col-md-12">
									<div class="form-group">
										<label for="label1">Email</label> <input type="text"
											class="form-control" id="label1">
									</div>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="row">
								<div class="col-6"></div>
								<div class="col-6 text-right">
									<button type="button" class="btn btnvideo mx-2"><i class="fa fa-pencil" aria-hidden="true"></i></button>
									<button type="button" class="btn btnvideo ps-2 mx-2""><i class="fa fa-trash" aria-hidden="true"></i></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- videolist -->
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Username</th>
							<th scope="col">Password</th>
							<th scope="col">Fullname</th>
							<th scope="col">Email</th>
							<th scope="col">Role</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="align-middle">TokitouMuichiro</td>
							<td class="align-middle">************</td>
							<td class="align-middle">Trần Mai Văn</td>
							<td class="align-middle">btokitou@gmail.com</td>
							<td class="align-middle">User</td>
							<td class="align-middle"><button type="button" class="btn btnvideo mx-2"><i class="fa fa-pencil" aria-hidden="true"></i></button></td>
						</tr>
						<tr>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"><button type="button" class="btn btnvideo mx-2"><i class="fa fa-pencil" aria-hidden="true"></i></button></td>
						</tr>
						<tr>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"><button type="button" class="btn btnvideo mx-2"><i class="fa fa-pencil" aria-hidden="true"></i></button></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6" class="footer">
								<div class="row">
									<div class="col-lg-6 align-middle">85 videos</div>
									<div class="col-lg-6 text-right align-middle">
										<button type="button" class="btn btnvideo ps-2 mx-2""><i class="fa fa-fast-backward" aria-hidden="true"></i></button>
										<button type="button" class="btn btnvideo mx-2"><i class="fa fa-backward" aria-hidden="true"></i></button>
										<button type="button" class="btn btnvideo mx-2"><i class="fa fa-forward" aria-hidden="true"></i></button>
										<button type="button" class="btn btnvideo ps-2 mx-2""><i class="fa fa-fast-forward" aria-hidden="true"></i></button>
									</div>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/view/same/footer.jsp"%>

</body>
</html>