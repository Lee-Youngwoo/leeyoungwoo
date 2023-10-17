<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
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
<title>두레비앙</title>
<style>
    /* 스타일링을 위한 CSS */
    /* input 요소 스타일링 */
    input[type="text"] {
        width: 100%; /* 100% 폭을 가집니다. */
        padding: 5px; /* 내부 패딩을 조절할 수 있습니다. */
        box-sizing: border-box; /* 내부 패딩을 폭에 포함합니다. */
    }

    /* textarea 요소 스타일링 */
    textarea {
        width: 100%; /* 100% 폭을 가집니다. */
       	height: 500px;
        padding: 5px; /* 내부 패딩을 조절할 수 있습니다. */
        box-sizing: border-box; /* 내부 패딩을 폭에 포함합니다. */
    }
    
    .manage{
    	float: right;
    }
</style>

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/contain.css" rel="stylesheet">

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

</head>

<body class="sb-nav-fixed">
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
						<c:if test="${sessionScope.level eq 'admin'}">
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
						</c:if>
					</div>
				</div>

			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>

				<div class="card mb-4">
					<div class="card-body">
						<h2>공지사항 등록</h2><br>
						<div class="manage">
							<button type="button" onclick="location.href='NoticeList.do'" class="btn btn-dark" >목록</button>
						</div>
					</div>
				</div>
				<center>

					<form action="insertNotice.do" method="post"
						encType="multipart/form-data">

						<table border="1" cellpadding="0" cellspacing="0">
							<tr>
								<td width="70">제목</td>
								<td align="left"><input name="ntitle" type="text"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td align="left"><textarea name="ncontent" cols="40"
										rows="5"></textarea></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td><input type="file" name="uploadfile"></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input
									type="submit" value="INSERT"></td>
							</tr>
						</table>
					</form>
				</center>

				<c:choose>
					<c:when test="${sessionScope.level ne 'admin'}">
						<script>
							alert("관리자만 등록가능합니다.");
							location.href = "/TeamPl/main.do";
						</script>
					</c:when>

				</c:choose>
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


</body>

</html>