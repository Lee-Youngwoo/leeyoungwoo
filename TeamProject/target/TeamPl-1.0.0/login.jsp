<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-eqiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
<meta name="description" content=""/>
<meta name="author" content=""/>
<title>Insert title here</title>
<link href="css/styles.css" rel="stylesheet"/>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>
	
	<div id="layoutAuthentication">
	<div id="layoutAuthentication_content">
		<main>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-5">
					<div class="card shadow-lg border-0 rounded-lg mt-5">
						<div class="card-header"><h3 class="text-center font-weight-light my-4">로그인</h3>
						</div>
						<div class="card-body">
							<form>
								<div class="form-floating mb-3">
									<input class="form-control" id="inputId" type="email" placeholder="id"/>
									<label for="inputId">아이디</label>
								</div>
								<div class="form-floating mb-3">
									<input class="form-control" id="inputPassword" type="password" placeholder="password"/>
									<label for="inputPassword">비밀번호</label>
								</div>
								<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
									<a class="small" href="id.jsp">아이디 찾기</a>
									<a class="small" href="passowrd.jsp">비밀번호 찾기</a>
									<a class="btn btn-primary" href="main.jsp">로그인2</a>
								</div>
								<img src="KakaoTalk_20230906_102751734.png" alt="느낌표">
							</form>
						</div>
						<div class="card-footer text-center py-3">
							<div class="small"><a href="register.jsp">회원가입하기</a></div>
						</div>
					</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	</div>
	<div id="layoutAuthentication_footer">
		<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid px-4">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; Your Website 2023</div>
					<div>
						<a href="#">Privacy Policy</a>
						&middot;
						<a href="#">Terms &amp; Conditions</a>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>