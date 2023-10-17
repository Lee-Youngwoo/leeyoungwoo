<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Admin</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        margin: 0;
        padding: 0;
        background-color: white;
    }

    h1 {
        margin: 20px 0;
    }

    table {
        margin: 0 auto;
        border-collapse: collapse;
        width: 80%;
        background-color: #f8f9fa;
        border: 1px solid #ccc;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 8px;
    }

    th {
        background-color: #f8f9fa;
    }

    tr:nth-child(even) {
        background-color: white;
    }

    a.button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #0d6efd; /* 파스텔톤 하늘색 */
        color: white;
        text-decoration: none;
        border-radius: 5px;
        border: none;
        cursor: pointer;
    }
</style>
</head>
<body>
<h1>이달의 메뉴</h1>
<div class="row mb-3">
<div class="col-md-6">
<a href="insertMenu.do" class="button">등록</a>
<a href=" updateMenu.do" class="button">수정</a>
</div>
</div>
<table>
    <tr>
        <th>글번호</th>
        <th>작성일</th>
        <th>수정일</th>
        <th>년도</th>
        <th>월</th>
        <th>추천수</th>
    </tr>
    <c:forEach var="menu" items="${menuList}">
        <tr>
            <td><a href="selectMenu.do?mNo=${menu.mNo}">${menu.mNo}</a></td>
            <td>${menu.mUploadDate}</td>
            <td>${menu.mUpdateDate}</td>
            <td>${menu.mYear}</td>
            <td>${menu.month}</td>
            <td>${menu.mlike}</td>
        </tr>
    </c:forEach>
</table>
<br>
<a href="insertMenu.do" class="button">입력</a>
</body>
</html>