<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="egovframework.product.service.ProductVO"%>
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
						console.log("함수돌긴하니?");
						/* 이미지 정보 호출 */
						let nno = '<c:out value="${menu.mno}"/>';
						console.log(nno);
						let uploadResult = $("#uploadResult");

						$
								.getJSON(
										"/TeamPl/getAttachList2.do",
										{
											nno : nno
										},
										function(arr) {
											console.log("함수돌긴하냐구");

											if (arr.length === 0) {

												let str = "";
												str += "<div id='result_card'>";
												str += "<img src='/TeamPl/src/main/webapp/resources/imgUpload/test.png'>";
												str += "</div>";

												uploadResult.html(str);

												return;
											}
											console.log("ㅎㅇ");
											console.log(arr);
											console.log("arr.obj "
													+ arr.obj.body[0]);
											let str = "";
											let obj = arr[0];

											var js = arr;
											var jsonOb = JSON.stringify(js);
											var parsedData = JSON.parse(jsonOb);
											console.log(jsonOb);

											var uploadPath = parsedData.obj.body[0].uploadPath;
											var uuid = parsedData.obj.body[0].uuid;
											var fileName = parsedData.obj.body[0].fileName;

											//let fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
											let fileCallPath = uploadPath
													.replace(/\\/g, '/')
													+ "/s_"
													+ uuid
													+ "_"
													+ fileName;
											str += "<div id='result_card'";
			str += "data-path='" + uploadPath + "' data-uuid='" + uuid + "' data-filename='" + fileName + "'";
			str += ">";
											str += "<img src='display2.do?fileName="
													+ fileCallPath + "'>";
											str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
											str += "<input type='hidden' name='imageList[0].fileName' value='"+ fileName +"'>";
											str += "<input type='hidden' name='imageList[0].uuid' value='"+ uuid +"'>";
											str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ uploadPath +"'>";
											str += "</div>";

											uploadResult.html(str);
											return;
										});
						/* 새로운 이미지 출력 */
						function showUploadImage(uploadResultArr) {
							/* 전달받은 데이터 검증 */
							if (!uploadResultArr || uploadResultArr.length == 0) {
								return;
							}
							let uploadResult = $("#uploadResult");
							var js = uploadResultArr;
							var jsonOb = JSON.parse(js);

							var bodyArray = jsonOb.obj.body;

							if (bodyArray.length > 0) {
								var firstObject = bodyArray[0];
								var uploadPath = firstObject.uploadPath;
								var uuid = firstObject.uuid;
								var fileName = firstObject.fileName;
								console.log("uploadPath: " + uploadPath);
								console.log("uuid: " + uuid);
								console.log("fileName: " + fileName);
								//let obj = uploadResultArr;
								let str = "";

								console.log("ㅎㅇ1");
								//let fileCallPath = uploadPath + "/s_" + uuid + "_" + fileName;
								let fileCallPath = uploadPath.replace(/\\/g,
										'/')
										+ "/s_" + uuid + "_" + fileName;
								console.log("ㅎㅇ2");
								str += "<div id='result_card'>";
								str += "<img src='display2.do?fileName="
										+ fileCallPath + "'>";
								str += "<div class='imgDeleteBtn' data-file='"+fileCallPath+"'>x</div>";
								str += "<input type='hidden' name='imageList[0].fileName' value='"+ fileName +"'>";
								str += "<input type='hidden' name='imageList[0].uuid' value='"+ uuid +"'>";
								str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ uploadPath +"'>";
								str += "</div>";
								uploadResult.append(str);
							} else {
								console
										.log("No 'uploadPath' found in the JSON data.");
							}
						}

						/* 이미지 삭제 버튼 동작 */
						$("#uploadResult").on("click", ".imgDeleteBtn",
								function(e) {
									console.log("이미지삭제버튼 누름");
									deleteFile();

								});

						/* 파일 삭제 메서드 */
						function deleteFile() {
							console.log("이미지삭제동작");
							$("#result_card").remove();
						}
						/* 이미지 업로드 */
						$("input[type='file']").on("change", function(e) {

							if ($(".imgDeleteBtn").length > 0) {
								deleteFile();
							}

							let formData = new FormData();
							let fileInput = $('input[name="uploadFile"]');
							let fileList = fileInput[0].files;
							let fileObj = fileList[0];
							if (!fileCheck(fileObj.name, fileObj.size)) {
								return false;
							}
							alert("통과");
							formData.append("uploadFile", fileObj);

							$.ajax({
								url : 'uploadAjaxAction2.do',
								processData : false,
								contentType : false,
								data : formData,
								type : 'POST',
								dataType : 'text',//text
								success : function(result) {
									alert("success");
									//location="/display.do";
									console.log("RESULT: " + result);
									showUploadImage(result);
								},
								error : function(result) {
									alert("이미지 파일이 아닙니다.");
								}
							});
						});

						/* var, method related with attachFile */
						let regex = new RegExp("(.*?)\.(jpg|png)$");
						let maxSize = 1048576; //1MB	

						function fileCheck(fileName, fileSize) {
							if (fileSize >= maxSize) {
								alert("파일 사이즈 초과");
								return false;
							}
							if (!regex.test(fileName)) {
								alert("해당 종류의 파일은 업로드할 수 없습니다.");
								return false;
							}
							return true;
						}

						function removeCheck() {
							if (confirm("정말 삭제하시겠습니까??") == true) { //확인

								document.removefrm.submit();

							} else { //취소
								history.back();
								return false;
							}
						}
					}); //$(document).ready(function(){
</script>
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

				<!-- <div class="card mb-4">
					<div class="card-body">
						<h2></h2>
					</div>
				</div> -->
				<div id="form">
					<form action="updateMenu.do" method="post">
						<input name="mno" type="hidden" value="${menu.mno }">
					<table border="1" cellpadding="0" cellspacing="0">
						<tr>
							<td>년도</td>
							<td align="left"><input name="myear" type="text" value="${menu.myear }" size="52"/></td>
						</tr>
						<tr>
							<td>월</td>
							<td align="left"><input name="month" type="text" value="${menu.month }" size="52"/></td>
						</tr>
						<tr>
							<td>추천수</td>
							<td align="left">${menu.mlike }</td>
						</tr>
						<tr>
							<th id="thum">이미지</th>
							<td><input type="file" id="fileItem" name="uploadFile"></td>
						</tr>
					
							<tr>
								<td id="thum">썸네일</td>
								<td>
									<div id="uploadResult"></div>
								</td>
							</tr>
		
					</table>
					<center>
						<input type="submit" value="메뉴수정">
						<button type="reset">취소</button>
					</center>
					</form>
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

	<c:choose>
		<c:when test="${sessionScope.level ne 'admin'}">
			<!-- <script>
				alert("로그인을 해야 작성 가능합니다.");
				location.href = "http://localhost:8800/TeamPl/loginWrite.do";
			</script> -->
			<script>
				alert("관리자만 접근 가능한 페이지입니다.");
				location.href = "${pageContext.request.contextPath}/main.do";
			</script>
		</c:when>
	</c:choose>
</body>
</html>