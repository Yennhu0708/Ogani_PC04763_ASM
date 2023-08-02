<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hashira | Video Management</title>
<%@ include file="/view/same/head.jsp"%>
</head>
<body>
	<!-- Header -->
	<%@ include file="/view/same/header.jsp"%>

	<!-- Breadcrumb -->
	<div class="container">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/view/admin/index2.jsp">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">
					Video Management</li>
			</ol>
		</nav>
	</div>

	<!-- Video for admin -->
	<div class="container mt-3 mb-2">
		<ul class="nav nav-pills pb-3" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				id="videoedition-tab" data-toggle="pill" href="#videoedition"
				role="tab" aria-controls="videoedition" aria-selected="true">Video
					Edition</a></li>
			<li class="nav-item"><a class="nav-link" id="videolist-tab"
				data-toggle="pill" href="#videolist" role="tab"
				aria-controls="videolist" aria-selected="false">Video List</a></li>
		</ul>

		<div class="tab-content" id="myTabContent">
			<!-- videoedition -->
			<div class="tab-pane fade show active" id="videoedition"
				role="tabpanel" aria-labelledby="videoedition-tab">
				<div class="container">
					<div class="card border-0">
						<div class="card-body">
							<div class="row">
								<div class="col-lg-6 col-xs-12 col-md-12">
									<div class="form-group">
										<label for="imageUpload" class="square-frame">Upload
											Image</label> <input type="file" class="form-control-file"
											id="imageUpload">
									</div>
								</div>
								<div class="col-lg-6 col-xs-12 col-md-12">
									<div class="form-group">
										<label for="label1">Youtube ID</label> <input type="text"
											class="form-control" id="label1">
									</div>
									<div class="form-group">
										<label for="label2">Video Title</label> <input type="text"
											class="form-control" id="label2">
									</div>
									<div class="form-group">
										<label for="label3">Video Count</label> <input type="text"
											class="form-control" id="label3">
									</div>
									<div class="form-group">
										<input type="checkbox" name="" id=""> Active <input
											type="checkbox" name="" id=""> Inactive
									</div>
									<div class="form-group">
										<label for="myTextarea">Description</label>
										<textarea class="form-control" id="myTextarea" rows="6"></textarea>
									</div>
								</div>
							</div>
						</div>		
						<div class="card-footer">
							<div class="row">
								<div class="col-6"></div>
								<div class="col-6 text-right">
									<button type="button" class="btn btnvideo ps-2 mx-2""><i class="fa fa-plus-square" aria-hidden="true"></i></button>
									<button type="button" class="btn btnvideo mx-2"><i class="fa fa-refresh" aria-hidden="true"></i></button>
									<button type="button" class="btn btnvideo mx-2"><i class="fa fa-pencil" aria-hidden="true"></i></button>
									<button type="button" class="btn btnvideo ps-2 mx-2""><i class="fa fa-trash" aria-hidden="true"></i></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- videolist -->
			<div class="tab-pane fade" id="videolist" role="tabpanel"
				aria-labelledby="videolist-tab">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Youtube ID</th>
							<th scope="col">Video Title</th>
							<th scope="col">Video count</th>
							<th scope="col">Status</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="align-middle">cFdJik-54Tg</td>
							<td class="align-middle">Mugen Train</td>
							<td class="align-middle">105</td>
							<td class="align-middle">Active</td>
							<td class="align-middle d-flex justify-content-end"><button type="button" class="btn btnvideo mx-2"><i class="fa fa-pencil" aria-hidden="true"></i></button></td>
						</tr>
						<tr>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle d-flex justify-content-end"><button type="button" class="btn btnvideo mx-2"><i class="fa fa-pencil" aria-hidden="true"></i></button></td>
						</tr>
						<tr>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle d-flex justify-content-end"><button type="button" class="btn btnvideo mx-2"><i class="fa fa-pencil" aria-hidden="true"></i></button></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" class="footer align-middle">
								<div class="row">
									<div class="col-lg-6">85 videos</div>
									<div class="col-lg-6 text-right">
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