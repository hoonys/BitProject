<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>퍼팩트 매칭</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/rpjt/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<!-- <link href="css/shop-item.css" rel="stylesheet"> -->
<link href="/resources/rpjt/css/lovelyB_022711.css" rel="stylesheet">
<link href="/resources/rpjt/css/styles.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
         <![endif]-->
<style>
.badge {
  padding: 1px 9px 2px;
  font-size: 12.025px;
  font-weight: bold;
  white-space: nowrap;
  color: #ffffff;
  background-color: #999999;
  -webkit-border-radius: 9px;
  -moz-border-radius: 9px;
  border-radius: 9px;
}
/* .badge:hover {
  color: #ffffff;
  text-decoration: none;
  cursor: pointer;
} */
.badge-error {
  background-color: #b94a48;
}
.badge-error:hover {
  background-color: #953b39;
}
.badge-warning {
  background-color: #f89406;
}
.badge-warning:hover {
  background-color: #c67605;
}
.badge-primary {
  background-color: #2f79b9;
}
/* .badge-primary:hover {
  background-color: #356635;
} */
.badge-success {
  background-color: #58b957;
}
/* .badge-success:hover {
  background-color: #356635;
}  */
.badge-info {
  background-color: #56c0e0;
}
/* .badge-info:hover {
  background-color: #2d6987;
} */
.badge-inverse {
  background-color: #333333;
}
.badge-inverse:hover {
  background-color: #1a1a1a;
}


</style>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>

<body>
	
	<%@include file="../include/jheader.jsp"%>

<%
	try{
		if(cname != null){
			%>
			<script>
			alert("개인 회원이 아닙니다.");
			self.location = "/company/C_index";
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

	<!-- Page Content -->
	<div class="container">
		<div class="col-md-3">
			<p class="lead">마이페이지</p>
			<div class="list-grozup">
				<a href="/personal/index" class="list-group-item"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;&nbsp;&nbsp;개인정보관리</a><!-- p08 --> <a
					href="/personal/write" class="list-group-item"><span class="glyphicon glyphicon-file"></span>&nbsp;&nbsp;&nbsp;&nbsp;이력서 작성</a> <!-- p02 --><a
					href="/personal/manage" class="list-group-item"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;&nbsp;&nbsp;이력서 관리</a> <!-- p01 --><a
					href="/personal/recom" class="list-group-item"><span class="glyphicon glyphicon-send"></span>&nbsp;&nbsp;&nbsp;&nbsp;추천채용공고</a> <!-- p04 --><a
					href="/personal/favor" id = "P_favor" class="list-group-item"><span class="glyphicon glyphicon-bookmark"></span>&nbsp;&nbsp;&nbsp;&nbsp;관심채용공고</a> <!-- p05 --><a
					href="/personal/applied_all" class="list-group-item"><span class="glyphicon glyphicon-flag"></span>&nbsp;&nbsp;&nbsp;&nbsp;지원현황리스트</a><!-- p07 -->
			</div>
		</div>
