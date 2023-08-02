<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hashira | User Edition</title>

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
                  <h4 class="card-title">USER EDITION</h4>
                  <p class="card-description">
                    
                  </p>
                  <form action="UserEdition" class="forms-sample" method="post">
                    <div class="form-group">
                      <label for="exampleInputName1">Username</label>
                      <input type="text" value="${user.username}" class="form-control" readonly id="exampleInputName1" name="username">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail3">Password</label>
                      <input type="password" value="${user.password}" class="form-control" id="exampleInputEmail3" readonly placeholder="Email" name="password">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword4">Fullname</label>
                      <input type="text" value="${user.fullname}" class="form-control" id="exampleInputPassword4" placeholder="Password" name="fullname">
                    </div>
                    <div class="form-group row">
						<label class="col-sm-3 col-form-label">Role</label>
						<div class="col-sm-4">
							<div class="form-check">
								<label class="form-check-label"> 
								<input type="radio" ${user.isAdmin == true ? 'checked' : ''}
									class="form-check-input" name="role"
									id="membershipRadios1" value="true" checked> Admin
								</label>
							</div>
						</div>
						<div class="col-sm-5">
							<div class="form-check">
								<label class="form-check-label"> 
								<input type="radio" ${user.isAdmin == false ? 'checked' : ''}
									class="form-check-input" name="role"
									id="membershipRadios2" value="false"> User
								</label>
							</div>
						</div>
					</div>  
                    <div class="form-group">
                        <label for="exampleInputPassword4">Email</label>
                        <input type="email" value="${user.email}" readonly class="form-control" id="exampleInputPassword4" placeholder="Password" name="email">
                    </div>
                    <div class="form-group row">
						<label class="col-sm-3 col-form-label">Status</label>
						<div class="col-sm-4">
							<div class="form-check">
								<label class="form-check-label"> 
								<input type="radio" ${user.isActive == true ? 'checked' : ''}
									class="form-check-input" name="status"
									id="membershipRadios1" value="true" checked> Active
								</label>
							</div>
						</div>
						<div class="col-sm-5">
							<div class="form-check">
								<label class="form-check-label"> 
								<input type="radio" ${user.isActive == false ? 'checked' : ''}
									class="form-check-input" name="status"
									id="membershipRadios2" value="false"> In-Active
								</label>
							</div>
						</div>
					</div>                 
                    <button type="submit" style="background-color: #4B49AC; color:white" class="btn mr-2">Edit</button>
                    <a href="" style="background-color: #4B49AC; color:white" class="btn mr-2">Reset</a>
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

</body>

</html>