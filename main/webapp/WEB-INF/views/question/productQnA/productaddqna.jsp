<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Product Details</title>
	<link rel="icon" href="resources/resources/images/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="resources/vendors/linericon/style.css">
  <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="resources/css/style.css">
  <style>
	.fade{
		/* text-align: center; */
	}
	.fade-1{
		display: flex;
		align-items: center;
	}
	.input-text{
		border: 1px solid black;
	}
	.bcbc{
		background-color: transparent; 
		border-bottom: 1px solid #777;
	}
  </style>
</head>
<body>
	
  
	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
					 aria-selected="false">QnA</a>
				</li>
			</ul>
				<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="comment_list">
							<c:forEach items="${productqnaList}" var="productqna">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="resources/images/product/review2.png" alt="#">
										</div>
										<div class="media-body">
											<h4>${productqna.number}</h4>
											<h5>${productqna.date}</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>${productqna.content}</p>
								</div>
								</c:forEach>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
							<form:form modelAttribute="productplus" method="post" action="/productquestion/add" id="contactForm" novalidate="novalidate">
					            <div class="col-md-12">
					                <div class="form-group">
					                    <form:input type="text" path="number" class="form-control" id="number" name="number" placeholder="이름을 입력하세요."/>
					                </div>
					            </div>
					            <div class="col-md-12">
					                <div class="form-group">
					                    <form:input type="email" path="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요."/>
					                </div>
					            </div>
					            <div class="col-md-12">
					                <div class="form-group">
					                    <form:input type="date" path="date" class="form-control" id="date" name="date" placeholder="전화번호를 입력하세요."/>
					                </div>
					            </div>
					            <div class="col-md-12">
					                <div class="form-group">
					                    <textarea class="form-control"  name="content" id="content" rows="1" placeholder="글을 작성하세요."></textarea>
					                </div>
					            </div>
					            <div class="col-md-12 text-right">
					                <input type="submit" value="등록" class="btn primary-btn">
					            </div>
					        </form:form>

									<a href="./productquestion/productadd">QnA 등록하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	<!--================End Product Description Area =================-->

	



  <script src="resources/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="resources/vendors/skrollr.min.js"></script>
  <script src="resources/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="resources/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="resources/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="resources/vendors/mail-script.js"></script>
  <script src="resources/js/main.js"></script>
</body>
</html>