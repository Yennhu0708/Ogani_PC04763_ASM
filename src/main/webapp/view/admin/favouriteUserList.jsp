<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hashira | Favourite User</title>

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

           <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">FAVOURITE USERS</h4>
                    <div class="form-group">
                        <label for="exampleSelectGender">Video Title</label>
                          <select class="form-control" id="exampleSelectGender">
                            <option>Male</option>
                            <option>Female</option>
                          </select>
                        </div>
                    </p>
                    <div class="table-responsive pt-3">
                      <table class="table table-bordered">
                        <thead>
                          <tr>
                            <th>Username</th>
                            <th>Fullname</th>
                            <th>Email</th>
                            <th>Favourite Date</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>1</td>
                            <td>Herman Beck</td>
                            <td>Herman Beck</td>
                            <td>$ 77.99</td>
                          </tr>
                        </tbody>
                        <tfoot>
                          <tr>
                              <td colspan="6" style="text-align: center;">
                                <a type="" style="background-color: #4B49AC; color:white" class="btn mr-2 text-right">F</a>
                                <a type="" style="background-color: #4B49AC; color:white" class="btn mr-2 text-right">P</a>
                                <a type="" style="background-color: #4B49AC; color:white" class="btn mr-2 text-right">N</a>
                                <a type="" style="background-color: #4B49AC; color:white" class="btn mr-2 text-right">L</a>
                              </td>
                        </tfoot>
                      </table>
                    </div>
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