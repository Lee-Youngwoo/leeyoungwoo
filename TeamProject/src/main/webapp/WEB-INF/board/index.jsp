<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>두레비앙</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/contain.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var hiddenimg = document.querySelectorAll(".imgli1");
						var hiddenimgList = [];
						hiddenimg.forEach(function(input) {
							hiddenimgList
									.push(input.getAttribute("data-value"));
						});
						console.log("hiddening" + hiddenimg);
						console.log("hiddenImgLIst" + hiddenimgList);

						var bobj = hiddenimgList;

						bobj
								.forEach(function(str) {
									// [ ] 안의 내용 추출 (AttachImageVO 정보)
									var objStr = str.match(/\[(.*?)\]/)[1];

									// , 로 분할하여 속성들을 배열로 만듦
									var properties = objStr.split(", ");

									// 속성들을 객체로 파싱하고 필요한 정보 출력
									var info = {};
									properties.forEach(function(prop) {
										var keyValue = prop.split("=");
										info[keyValue[0].trim()] = keyValue[1];

									});
									console.log("info.nno" + info.nno);

									$(".image_wrap")
											.eq(hiddenimgList.indexOf(str))
											.find("img")
											.attr(
													'src',
													'/TeamPl/display1.do?fileName='
															+ encodeURIComponent(info.uploadPath
																	+ "/s_"
																	+ info.uuid
																	+ "_"
																	+ info.fileName));

								});
					});
	$(document)
			.ready(
					function() {
						var hiddenimg = document.querySelectorAll(".imgli2");
						var hiddenimgList = [];
						hiddenimg.forEach(function(input) {
							hiddenimgList.push(input
									.getAttribute("data-value2"));
						});
						console.log("hiddening" + hiddenimg);
						console.log("hiddenImgLIst" + hiddenimgList);

						var bobj = hiddenimgList;

						bobj
								.forEach(function(str) {
									// [ ] 안의 내용 추출 (AttachImageVO 정보)
									var objStr = str.match(/\[(.*?)\]/)[1];

									// , 로 분할하여 속성들을 배열로 만듦
									var properties = objStr.split(", ");

									// 속성들을 객체로 파싱하고 필요한 정보 출력
									var info = {};
									properties.forEach(function(prop) {
										var keyValue = prop.split("=");
										info[keyValue[0].trim()] = keyValue[1];

									});
									console.log("info.mno" + info.mno);

									$(".image_wrap2")
											.eq(hiddenimgList.indexOf(str))
											.find("img")
											.attr(
													'src',
													'/TeamPl/display2.do?fileName='
															+ encodeURIComponent(info.uploadPath
																	+ "/s_"
																	+ info.uuid
																	+ "_"
																	+ info.fileName));

								});
					}); //$(document).ready(function(){
</script>
<style>
.maincontent{	
	width:1400px;	
	margin:auto;
	padding:10px;	
}
.card-body1{
			padding:10px;
		}
.more{
	padding-right:50px;
} 
.notice{
	flex: 1;
	float: right;
    width: 500px; /* 공지 카드의 너비 조절 */
    margin: auto; /* 여백 조절 */
    clear: right; /* 오른쪽으로 이동하면 이전 요소 밑에 배치 */
}
.product{
	flex: 1;
	float: right;
    width: 500px; /* 테이블 너비 조절 */
    margin: auto; /* 여백 조절 */
    clear: right;
}
.menu{
	flex: 2;
	float: left;
    width: 800px; /* 테이블 너비 조절 */
    margin: auto; /* 여백 조절 */
    clear: left; /* 왼쪽으로 이동하면 이전 요소 밑에 배치 */
}
@media screen and (min-width: 1800px) {
	    .maincontent{	
		width:2000px;
		height:1800px;
		/* margin:auto; */	
		}
		/* .card mb-4{
			height:700px;
		} */
		.card-body{
			/* width:1300px; */
			height:1500px;
		}
		.image_wrap2 img{
			width:1000px;
			height:1200px;
		}
		.card-body1{
			padding:20px;
			height:600px;
		}
		.notice{
			flex: 1;
			float: right;
		    width: 800px; /* 공지 카드의 너비 조절 */
		    margin: auto; /* 여백 조절 */
		    clear: right; /* 오른쪽으로 이동하면 이전 요소 밑에 배치 */
		    height:900px;
		}
		.product{
			flex: 1;
			float: right;
		    width: 800px; /* 테이블 너비 조절 */
		    margin: auto; /* 여백 조절 */
		    clear: right;
		    height:900px;
		}
		.menu{
			flex: 2;
			float: left;
		    width: 1100px; /* 테이블 너비 조절 */
		    margin: auto; /* 여백 조절 */
		    clear: left; /* 왼쪽으로 이동하면 이전 요소 밑에 배치 */
		    height:1600px;
		}
}
</style>
<body class="sb-nav-fixed">
	ㅡㅡ
	<nav class="sb-topnav navbar navbar-expand navbar-light bg-light">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="main.do">DuraeBiang 두레비앙</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<svg class="svg-inline--fa fa-bars" aria-hidden="true"
				focusable="false" data-prefix="fas" data-icon="bars" role="img"
				xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"
				data-fa-i2svg="">
                <path fill="currentColor"
					d="M0 96C0 78.3 14.3 64 32 64H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H416c17.7 0 32 14.3 32 32z">
                </path>
            </svg>
			<!-- <i class="fas fa-bars"></i> Font Awesome fontawesome.com -->
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
			<c:if test="${sessionScope.id ne null}">
				<h3>반갑습니다. ${sessionScope.id} 님!</h3>
			</c:if>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><svg
						class="svg-inline--fa fa-user fa-fw" aria-hidden="true"
						focusable="false" data-prefix="fas" data-icon="user" role="img"
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"
						data-fa-i2svg="">
                        <path fill="currentColor"
							d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z">
                        </path>
                    </svg> <!-- <i class="fas fa-user fa-fw"></i> Font Awesome fontawesome.com --></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<c:choose>
						<c:when test="${sessionScope.id ne null}">
							<li><a class="dropdown-item" href="MyCompl.do?id=${sessionScope.id}">마이페이지</a></li>
							<li><a class="dropdown-item" href="logout.do">로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="dropdown-item" href="loginWrite.do">로그인</a></li>
							<li><a class="dropdown-item" href="insertMember.do">회원가입</a></li>
						</c:otherwise>
					</c:choose>

				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-light"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading"></div>
						 <a class="nav-link" href="NoticeList.do">
							<div class="sb-nav-link-icon">
								<svg class="svg-inline--fa fa-gauge-high" aria-hidden="true"
									focusable="false" data-prefix="fas" data-icon="gauge-high"
									role="img" xmlns="http://www.w3.org/2000/svg"
									viewBox="0 0 512 512" data-fa-i2svg="">
                                    <path fill="currentColor"
										d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zM288 96a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM256 416c35.3 0 64-28.7 64-64c0-17.4-6.9-33.1-18.1-44.6L366 161.7c5.3-12.1-.2-26.3-12.3-31.6s-26.3 .2-31.6 12.3L257.9 288c-.6 0-1.3 0-1.9 0c-35.3 0-64 28.7-64 64s28.7 64 64 64zM176 144a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM96 288a32 32 0 1 0 0-64 32 32 0 1 0 0 64zm352-32a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z">
                                    </path>
                                </svg>
								<!-- <i class="fas fa-tachometer-alt"></i> Font Awesome fontawesome.com -->
							</div> 공지사항
						</a> <a class="nav-link" href="ComplList.do">
							<div class="sb-nav-link-icon">
								<svg class="svg-inline--fa fa-gauge-high" aria-hidden="true"
									focusable="false" data-prefix="fas" data-icon="gauge-high"
									role="img" xmlns="http://www.w3.org/2000/svg"
									viewBox="0 0 512 512" data-fa-i2svg="">
                                    <path fill="currentColor"
										d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zM288 96a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM256 416c35.3 0 64-28.7 64-64c0-17.4-6.9-33.1-18.1-44.6L366 161.7c5.3-12.1-.2-26.3-12.3-31.6s-26.3 .2-31.6 12.3L257.9 288c-.6 0-1.3 0-1.9 0c-35.3 0-64 28.7-64 64s28.7 64 64 64zM176 144a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM96 288a32 32 0 1 0 0-64 32 32 0 1 0 0 64zm352-32a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z">
                                    </path>
                                </svg>
								<!-- <i class="fas fa-tachometer-alt"></i> Font Awesome fontawesome.com -->
							</div> 건의사항
						</a>
						<a class="nav-link" href="ProductList.do">
							<div class="sb-nav-link-icon">
								<svg class="svg-inline--fa fa-gauge-high" aria-hidden="true"
									focusable="false" data-prefix="fas" data-icon="gauge-high"
									role="img" xmlns="http://www.w3.org/2000/svg"
									viewBox="0 0 512 512" data-fa-i2svg="">
                                    <path fill="currentColor"
										d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zM288 96a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM256 416c35.3 0 64-28.7 64-64c0-17.4-6.9-33.1-18.1-44.6L366 161.7c5.3-12.1-.2-26.3-12.3-31.6s-26.3 .2-31.6 12.3L257.9 288c-.6 0-1.3 0-1.9 0c-35.3 0-64 28.7-64 64s28.7 64 64 64zM176 144a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM96 288a32 32 0 1 0 0-64 32 32 0 1 0 0 64zm352-32a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z">
                                    </path>
                                </svg>
								<!-- <i class="fas fa-tachometer-alt"></i> Font Awesome fontawesome.com -->
							</div> SHOP
						</a>
						<c:choose>
							<c:when test="${sessionScope.level eq 'admin'}">
								<a class="nav-link" href="ListMember.do">
									<div class="sb-nav-link-icon">
										<svg class="svg-inline--fa fa-gauge-high" aria-hidden="true"
											focusable="false" data-prefix="fas" data-icon="gauge-high"
											role="img" xmlns="http://www.w3.org/2000/svg"
											viewBox="0 0 512 512" data-fa-i2svg="">
		                                    <path fill="currentColor"
												d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zM288 96a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM256 416c35.3 0 64-28.7 64-64c0-17.4-6.9-33.1-18.1-44.6L366 161.7c5.3-12.1-.2-26.3-12.3-31.6s-26.3 .2-31.6 12.3L257.9 288c-.6 0-1.3 0-1.9 0c-35.3 0-64 28.7-64 64s28.7 64 64 64zM176 144a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM96 288a32 32 0 1 0 0-64 32 32 0 1 0 0 64zm352-32a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z">
		                                    </path>
		                                </svg>
										<!-- <i class="fas fa-tachometer-alt"></i> Font Awesome fontawesome.com -->
									</div> 회원관리
								</a><a class="nav-link" href="MenuList.do">
									<div class="sb-nav-link-icon">
										<svg class="svg-inline--fa fa-gauge-high" aria-hidden="true"
											focusable="false" data-prefix="fas" data-icon="gauge-high"
											role="img" xmlns="http://www.w3.org/2000/svg"
											viewBox="0 0 512 512" data-fa-i2svg="">
		                                    <path fill="currentColor"
												d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zM288 96a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM256 416c35.3 0 64-28.7 64-64c0-17.4-6.9-33.1-18.1-44.6L366 161.7c5.3-12.1-.2-26.3-12.3-31.6s-26.3 .2-31.6 12.3L257.9 288c-.6 0-1.3 0-1.9 0c-35.3 0-64 28.7-64 64s28.7 64 64 64zM176 144a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM96 288a32 32 0 1 0 0-64 32 32 0 1 0 0 64zm352-32a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z">
		                                    </path>
		                                </svg>
										<!-- <i class="fas fa-tachometer-alt"></i> Font Awesome fontawesome.com -->
									</div> 이달의 메뉴
								</a>
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>

				<!-- <div class="card mb-4">
					<div class="card-body">메인메뉴</div>
				</div> -->
				
				<div class="maincontent">
					<div class="menu">
						<table border="1">
							<div class="card mb-4">
								<div class="card-body">이달의 메뉴
										<c:forEach var="menu" items="${MainMenu}">
												<div align="center" class="image_wrap2"
													data-mno="${MainMenuI[status2.index].mno}"
													data-path="${MainMenuI[status2.index].uploadPath}"
													data-uuid="${MainMenuI[status2.index].uuid}"
													data-filename="${MainMenuI[status2.index].fileName}">
													<a href="selectMenu.do?mno=${menu.mno }"><img width="600"
														height="700"></a>
												</div> 
										</c:forEach>
								</div>
							</div>
						</table>
					</div>
					<div class="notice">
						<div class="card mb-4">
							<div class="card-body1">공지
								<div class="more" align="right"><button type="button" class="btn btn-secondary" onclick="location.href='NoticeList.do'" >더 보기</button></div>
									<table border="1" cellpadding="0" cellspacing="0">
										<tr>
											<td align="center">제목</td>
											<td align="center">날짜</td>
										</tr>
										<c:forEach var="notice" items="${MainNotice}" varStatus="status">
											<tr>
												<!-- 공지 -->
												<td align="center"><a
													href="selectNotice.do?nno=${notice.nno }">${notice.ntitle}</a></td>
												<td align="center">${notice.nuploaddate}</td>
												<c:if test="${sessionScope.SessionUserId eq 'admin'}">
													<td align="center"><a
														href="deleteNotice.do?nno=${notice.nno}">삭제</a></td>
												</c:if>
											</tr>
										</c:forEach>
									</table>
						</div>
					</div>
				</div>
					<div class="product">
						<div class="card mb-4">
							<div class="card-body1">새 상품
								<div class="more" align="right"><button type="button" class="btn btn-secondary" onclick="location.href='ProductList.do'" >더 보기</button></div>
									<table border="1">
										<c:forEach var="product" items="${MainProduct}">
											<td align="center">
												<div class="image_wrap"
													data-nno="${MainProductI[status1.index].nno}"
													data-path="${MainProductI[status1.index].uploadPath}"
													data-uuid="${MainProductI[status1.index].uuid}"
													data-filename="${MainProductI[status1.index].fileName}">
													<a href="selectProduct.do?pno=${product.pno }"><img
														width="120" height="200"></a>
												</div> ${product.pname }<br> 
											</td>
										</c:forEach>
									</table>
								</div>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright © 두레비앙 2조 2023</div>
						<div>
							<a href="#">Privacy Policy</a> · <a href="#">Terms &amp;
								Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>


	ㅡㅡ



	<!-- 상ㅇ품사진가져옴 -->
	<c:forEach var="productI" items="${MainProductI}" varStatus="status1">
		<input type="hidden" class="imgli1"
			data-value="${MainProductI[status1.index]}">
	</c:forEach>
	<br>

	<c:forEach var="menuI" items="${MainMenuI}" varStatus="status2">
		<input type="hidden" class="imgli2"
			data-value2="${MainMenuI[status2.index]}">
	</c:forEach>
</body>
</html>