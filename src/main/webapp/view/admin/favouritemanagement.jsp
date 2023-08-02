<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hashira | Favourite Management</title>
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
				<li class="breadcrumb-item active" aria-current="page">
					Favourite Management</li>
			</ol>
		</nav>
	</div>

	<!-- Favourite for admin -->
	<div class="container mt-3 mb-2">
		<ul class="nav nav-pills pb-3" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				id="favourite-tab" data-toggle="pill" href="#favourite" role="tab"
				aria-controls="favourite" aria-selected="true">Favourite</a></li>
			<li class="nav-item"><a class="nav-link" id="favouriteuser-tab"
				data-toggle="pill" href="#favouriteuser" role="tab"
				aria-controls="favouriteuser" aria-selected="false">Favourite
					Users</a></li>
			<li class="nav-item"><a class="nav-link" id="share-tab"
				data-toggle="pill" href="#share" role="tab" aria-controls="share"
				aria-selected="false">Share Friend</a></li>
		</ul>

		<div class="tab-content" id="myTabContent">
			<!-- Favourite -->
			<div class="tab-pane fade  show active" id="favourite"
				role="tabpanel" aria-labelledby="favourite-tab">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Video title</th>
							<th scope="col">Favourite count</th>
							<th scope="col">Latest date</th>
							<th scope="col">Oldest date</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Hashira Training</td>
							<td>15000</td>
							<td>31/12/2022</td>
							<td>12/06/2023</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- Favourite users -->
			<div class="tab-pane fade" id="favouriteuser" role="tabpanel"
				aria-labelledby="favouriteuser-tab">
				<div class="form-group row align-items-center">
					<label for="exampleFormControlSelect1"
						class=" col-lg-2 col-sm-2 col-form-label">Video Title</label>
					<div class="col-lg-10 col-sm-10 d-flex align-center">
						<select class="form-control w-100" id="exampleFormControlSelect1">
							<option>Avatar 2: The way of water</option>
							<option>Insidious 5: The red door</option>
							<option>Mugen Train</option>
						</select>
					</div>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Username</th>
							<th scope="col">Fullname</th>
							<th scope="col">Email</th>
							<th scope="col">Favourite date</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="align-middle">ThanhCaty</td>
							<td class="align-middle">Nguyễn Thanh Vy</td>
							<td class="align-middle">thanhvy@gmail.com</td>
							<td class="align-middle">02/07/2023</td>
						</tr>
						<tr>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
						</tr>
						<tr>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- Share friend -->
			<div class="tab-pane fade" id="share" role="tabpanel"
				aria-labelledby="share-tab">
				<div class="form-group row ">
					<label for="exampleFormControlSelect1"
						class=" col-lg-2 col-sm-2 col-form-label">Video Title</label>
					<div class="col-lg-10 col-sm-10">
						<select class="form-control w-100 align-center" id="exampleFormControlSelect1">
							<option>Avatar 2: The way of water</option>
							<option>Insidious 5: The red door</option>
							<option>Mugen Train</option>
						</select>
					</div>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Sender name</th>
							<th scope="col">Sender email</th>
							<th scope="col">Receiver email</th>
							<th scope="col">Send date</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="align-middle">Nguyễn Thanh Vy</td>
							<td class="align-middle">thanhvy@gmail.com</td>
							<td class="align-middle">ivy78@gmail.com</td>
							<td class="align-middle">01/05/2023</td>
						</tr>
						<tr>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
						</tr>
						<tr>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/view/same/footer.jsp"%>

</body>
</html>