<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"
	class="fontawesome-i2svg-active fontawesome-i2svg-complete">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Dashboard - SB Admin</title>
<link href="css/styles.css" rel="stylesheet">
    <link href="css/style2.css" rel="stylesheet">
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-light bg-light">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="main.jsp">DuraeBiang 두래비앙</a>
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
				ㅎㅇㅎㅇ
			</div>
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
					<li><a class="dropdown-item" href="#!">로그인</a></li>
					<li><a class="dropdown-item" href="#!">회원가입</a></li>
					<li>
						<hr class="dropdown-divider">
					</li>
					<li><a class="dropdown-item" href="#!">로그아웃</a></li>
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
						<a class="nav-link" href="http://localhost:8800/TeamPl/MenuList.do">
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
						</a> <a class="nav-link collapsed" href="http://localhost:8800/TeamPl/ProductList.do">
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
						</a> <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
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
						</a> <a class="nav-link collapsed" href="http://localhost:8800/TeamPl/ComplList.do" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
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
							</div>건의사항
						</a>
					</div>
				</div>
				<!--<div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    Start Bootstrap 
                </div> -->
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>

				<div class="card mb-4">
					<div class="card-header">
						<!-- <svg class="svg-inline--fa fa-table me-1" aria-hidden="true"
							focusable="false" data-prefix="fas" data-icon="table" role="img"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
							data-fa-i2svg=""> -->
						<path fill="currentColor"
							d="M64 256V160H224v96H64zm0 64H224v96H64V320zm224 96V320H448v96H288zM448 256H288V160H448v96zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64z">
						</path>

						<!-- </svg> -->
						<i class="fas fa-table me-1"></i>
						<!-- Font Awesome fontawesome.com -->
						메뉴 입력
					</div>
					<div class="card-body">
						<iframe src="selectMenuList.do" width="100%" height="500"
							frameborder="0"></iframe>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright © Your Website 2023</div>
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


</body>

</html>