<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en"
	class="fontawesome-i2svg-active fontawesome-i2svg-complete">

<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>

	
	$(function() {
		//전역변수로 인증번호 확인변수 선언
		//인증번호 인증 성공 1 / 실패 0 
		var chkem=1;
		
		$("#btn_idcheck").click(function() {
			var uid = $.trim($("#uid").val());
			if (uid == "") {
				alert("아이디를 입력하세요");
				$("#uid").focus();
				return false;
			}
			//idcheck.do로 데이터 전송
			$.ajax({
				/*전송 전*/
				type : "POST",
				data : "uid=" + uid, //json
				url : "idcheck.do",
				dataType : "text",

				/*전송 후*/

				success : function(result) {
					if (result == "ok") {
						alert("사용가능한 아이디입니다.");
					} else {
						alert("이미 존재하는 아이디입니다.");
					}
				},
				error : function() {
					alert("오류발생");
				}
			})

		});

		$("#btn_submit").click(function() {

			var uid = $("#uid").val();
			var pwd = $("#pwd").val();
			var pwdchk = $("#pwdchk").val();
			var email = $("#email").val();
			var em = $("#em").val();
			var name = $("#name").val();
			var phone = $("#phone").val();
			
			uid = $.trim(uid);
			pwd = $.trim(pwd);
			pwdchk = $.trim(pwdchk);
			name = $.trim(name);
			email = $.trim(email);
			em = $.trim(em);
			phone = $.trim(phone);

			if (uid == "") {
				alert("아이디를 입력하세요");
				$("#uid").focus();
				return false;
			}
			if (pwd == "") {
				alert("비밀번호를 입력하세요");
				$("#pwd").focus();
				return false;
			}
			if(pwd!=pwdchk){
				alert("비밀번호가 일치하지않습니다.");
				$("#pwdchk").focus();
				return false;
				
			}
			if (name == "") {
				alert("이름을 입력하세요");
				$("#name").focus();
				return false;
			}
			if (email == "") {
				alert("이메일을 입력하세요");
				$("#email").focus();
				return false;
			}
			if (em == "") {
				alert("인증번호를 입력하세요");
				$("#em").focus();
				return false;
			}
			if (phone == "") {
				alert("전화번호를 입력하세요");
				$("#phone").focus();
				return false;
			}
			if (chkem == 0) {
				alert("인증번호를 확인하세요");
				$("#em").focus();
				return false;
			}else if(chkem==1){
				
			}
			
			
			$("#uid").val(uid);
			$("#pwd").val(pwd);
			$("#email").val(email);
			$("#phone").val(phone);
			
			$("#em").val(em);

			var formData = $("#frm").serialize();

			$.ajax({

				/*전송 전 세팅*/
				type : "POST",
				data : formData,
				url : "insertMember.do",
				dataType : "text",

				/*전송 후 세팅*/
				success : function(result) {
					if (result == "ok") {
						alert("성공");
						location = "index.do";
					} else {

					}
				},
				error : function() {
					alert("오류");
				}
			});

		});
		$('#mail-Check-Btn').click(function() {
			const email = $('#email').val(); // 이메일 주소값 얻어오기!
			if(email==""){
				alert("이메일을 입력하세요");
				$("#email").focus();
				return false;
			}
			console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
			$.ajax({
				/*전송 전*/
				type : "POST",
				data : "email=" + email, //json
				url : "emailcheck.do",
				dataType : "text",

				/*전송 후*/

				success : function(result) {
					if (result == "ok") {
						alert("사용가능한 이메일 입니다.");
						$.ajax({
							type : 'get',
							url : '<c:url value ="mailCheck.do?email="/>' + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
							success : function(data) {
								console.log("data : " + data);
								checkInput.attr('disabled', false);
								code = data;
								alert('인증번호가 전송되었습니다.')
							}
						});
					} else {
						alert("이미 존재하는 이메일입니다. 다른이메일을 사용해주세요.");
					}
				},
				error : function() {
					alert("오류발생");
				}
			})
		}); // end send eamil
			
			/*$.ajax({
				type : 'get',
				url : '<c:url value ="mailCheck.do?email="/>' + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
				success : function(data) {
					console.log("data : " + data);
					checkInput.attr('disabled', false);
					code = data;
					alert('인증번호가 전송되었습니다.')
				}
			});*/ // end ajax
		//
		
		//
		// 인증번호 비교 
		// blur -> focus가 벗어나는 경우 발생
		$('.mail-check-input').blur(
				function() {
					const inputCode = $(this).val();
					const $resultMsg = $('#mail-check-warn');

					if (inputCode === code) {
						chkem=1;
						$resultMsg.html('인증번호가 일치합니다.');
						console.log("성공 후"+chkem);
						$resultMsg.css('color', 'green');
						$('#mail-Check-Btn').attr('disabled', true);
						$('#userEamil1').attr('readonly', true);
						$('#userEamil2').attr('readonly', true);
						$('#userEmail2').attr('onFocus',
								'this.initialSelect = this.selectedIndex');
						$('#userEmail2').attr('onChange',
								'this.selectedIndex = this.initialSelect');
					} else {
						chkem=0;
						console.log("실패 후"+chkem);
						$resultMsg.html('<br>인증번호가 불일치 합니다. 다시 확인해주세요!.');
						$resultMsg.css('color', 'red');
					}
				});
		
	});
</script>
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
<link href="css/styles2.css" rel="stylesheet">
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
							<c:if test="${sessionScope.level eq 'admin'}">
								<li><a class="dropdown-item" href="ListMember.do">회원관리</a></li>
							</c:if>
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
						</a> 
					</div>
				</div>

			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
	<center>
		<div id="form">
			<form id="frm">
				<h1>회원가입</h1>
				<table border="1" cellpadding="0" cellspacing="0" style="width: 600px;">
					<tr>
						<td for="uid">아이디</td>
						<td><input type="text" id="uid" name="uid" style="width: 65%;" >
							<button type="button"  id="btn_idcheck"  class="btn btn-primary" >중복체크</button></td>
					</tr>
					<tr>
						<td for="pwd">비밀번호</td>
						<td><input type="password" id="pwd" name="pwd"></td>
					</tr>
					<tr>
						<td for="pwd">비밀번호확인</td>
						<td><input type="password" id="pwdchk" name="pwdchk"></td>
					</tr>
					<tr>
						<td for="name">이름</td>
						<td><input type="text" id="name" name="name" style="width: 65%;" ></td>
					</tr>
					<tr>
						<td for="email">이메일</td>
						<td><input type="email" id="email" name="email">
							<button type="button"  class="btn btn-primary"  id="mail-Check-Btn">본인인증</button></td>
					</tr>
					<tr>
						<td>이메일인증</td>
						<td><input name="em" id="em" class="mail-check-input" placeholder="인증번호 6자리" disable="disable" maxlength="6"> <span id="mail-check-warn"></span></td>
					</tr>
					<tr>
						<td for="phone">전화번호</td>
						<td><input type="text" id="phone" name="phone"  style="width: 65%;" ></td>
					</tr>
					
				</table>
				<br>
				<button type="button" class="btn btn-primary"  id="btn_submit">회원가입완료</button>
				<button type="reset"  class="btn btn-primary">취소</button>
			</form>
		</div>
	</center>
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