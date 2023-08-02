<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hashira | ${video.title}</title>
<%@ include file="/view/same/head.jsp"%>
</head>

<style>
.video-title2 {
	display: block;
	margin-top: 5px;
	color: #7fad39;
	font-weight: bolder;
}

.video-title2:hover {
	color: #f44336;
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
				<li class="breadcrumb-item active" aria-current="page"> ${video.title}</li>
			</ol>
		</nav>
	</div>
	
	<!-- Form Video Chi Tiết -->
    <div class="container">
        <div class="row">
          <div class="col-lg-8 col-xs-12">
            <div class="frame9">
              <div class="bbb mb-3 mt-3">
                <iframe width="932" height="498" src="https://www.youtube.com/embed/${video.href}" title="${video.title}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
              </div>
            </div>
            <div class="video-title mt-2">
                <h4 style="color:green; font-weight:bolder;">${video.title}</h4>
                <p>${video.description}</p>
                
            </div>
            <div class="video-buttons">
              <c:if test="${not empty sessionScope.currentUser}">
	              <button id="LikeAndDislike" class="btn like-button">
	              	<c:choose>
	              		<c:when test="${likeTag == true}">
	              			Dislike
	              		</c:when>
	              		<c:otherwise>
	              			Like
	              		</c:otherwise>
	              	</c:choose>
	              </button>
	              <button class="share-button">Share</button>
	          </c:if>
            </div>
            <input id="videoHrefHD" type="hidden" value="${video.href}">
          </div>
          <div class="col-lg-4 mb-2">
            <h4 class="fw-bold text-success pb-2 text-center"><i class="fa fa-film"></i>&nbsp; WATCHED MOVIE &nbsp;<i class="fa fa-film"></i></h4>
            
            <div class="scrollable-div">
            <c:forEach items="${watchedVideos}" var="watchedvideo">                
	                <a class="video-title2" href="<c:url value = '/video?action=watch&id=${watchedvideo.href}'/>">${watchedvideo.title}</a>
	              <div class="video-container mb-3 mt-3">
	                <!-- Video 1 -->
	                <iframe src="https://www.youtube.com/embed/${watchedvideo.href}" title="INSIDIOUS: THE RED DOOR – Official Trailer (HD)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>                
	              </div>            
	              <!-- Thêm video khác nếu cần -->
	        </c:forEach>
            </div>
            
          </div>
        </div>
    </div>

	<!-- Footer -->
	<%@ include file="/view/same/footer.jsp"%>
	
	<script>
		$('#LikeAndDislike').click(function() {
			var videoId = $('#videoHrefHD').val();
			$.ajax({
				url : 'video?action=like&id=' + videoId
			}).then(function() {
				var text = $('#LikeAndDislike').text();
				console.log("LẸ LẸ LẸ LẸ: " + text);
				if (text.indexOf('Like') != -1) {
					$('#LikeAndDislike').text('Dislike');
				} else {
					$('#LikeAndDislike').text('Like');
				}
			}).fail(function(error) {
				alert('Failure')
			})
		});
	</script>
</body>
</html>