<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/pheader.jsp"%>
<style>
.badge-info:hover {
  background-color: #2d6987;
}
</style>
<!-- Main content -->
<form role="form">
		<input type='hidden' name='id' value="${PUserVO.id}">
</form>
<!-- 지원현황 페이지 -->
<div class="col-md-9">
	<h1 class="ci_name">${PUserVO.pname}</h1><h4>님의 지원 현황</h4>
	<br>
	<div style='width : 100%; height : 190px; border : 1px solid #c0c6d3; padding:30px;'>
		<ul>
			<li>[${PUserVO.pname}]님이 지원한 이력서 목록입니다.</li>
			<li>공고 등록 순서에 따라 정렬됩니다.<br></li>
			<li>이력서를 등록하신 회원님께 <b>이력서 기반 추천 공고 서비스를 무료</b>로 제공합니다. </li>
		</ul>
		<br>※ 퍼펙트 매칭 채용정보 등록 규정상 부적합한 이력서로 판별된 경우, 별도 통보 없이 이력서가 비공개/삭제 처리될 수 있습니다.<br>
	</div>
	<br>
	<input type="hidden" id="controller_value" value="${controller_value}">
	<input type="hidden" id="order_value" value="${order_value}">
	<div class="container col-md-4">
		<small style="cursor:pointer" id="viewOrder">조회수<span class="order glyphicon glyphicon-chevron-down"> </span></small>
		| <small style="cursor:pointer" id="appOrder">지원자수<span class="order glyphicon glyphicon-chevron-down"> </span></small>
		| <small style="cursor:pointer" id="endOrder">마감일<span class="order glyphicon glyphicon-chevron-down"> </span></small>
	</div>
	<div class="container col-md-offset-9">
		<button id="all_btn" class="btn " onclick="all_recruits()">전체</button>
		<button id="ongoing_btn" class="btn" onclick="ongoing_recruits()">진행중</button>
		<button id="closed_btn" class="btn" onclick="closed_recruits()">마감</button>
	</div>
	<br>
	<div>
		<!-- 본 바디 틀 -->
		<table class="table table-bordered">
			<!-- 공고 메인 공고 테이블 순서 번호는 java문 counter로 처리-->
			<tr class="active">
				<th style="text-align:center;">상태</th>
				<th style="text-align:center;">회사명</th>
				<th style="text-align:center;">공고 제목</th>
				<th style="text-align:center; width: 90px;">모집기간</th>
				<th style="width: 79px;">지원자 수</th>
				<th style="text-align:center;">내이력서</th>
				<th style="text-align:center;">열람여부</th>
			</tr>
			<!-- 소연 crecruitMapper.selectAPList -->
			<c:forEach items = "${CRecruitVOList}" var = "CRecruitVO" varStatus="status">
			<tr>
				<td style="text-align:center;"><span class="jobdesc badge badge-pill">${CRecruitVO.jobdesc}</span></td>
				<td style="text-align:center;">${CRecruitVO.recruitform}</td>
				<td style="text-align:center;"><a href = '/company/C_recruitMent?recruitNum=${CRecruitVO.bno}' onClick="window.open(this.href, 'C${CRecruitVO.bno}', 'width=1240, height=960'); return false;">${CRecruitVO.bno} : ${CRecruitVO.title}</a></td>
				<td style="text-align:center;">${CRecruitVO.regdate}<br>~<br>${CRecruitVO.period}</td>
				<td style="text-align:center;"><span class="badge badge-pill badge-primary">${CRecruitVO.addesc}</span></td>
				<td style="text-align:center;"><a href = '/personal/detail_nonavi?bno=${CRecruitVO.viewcnt}' onClick="window.open(this.href, 'R${CRecruitVO.viewcnt}', 'width=1000, height=960'); return false;"><span class="badge badge-pill badge-info">내이력서</span></a></td>
				<td style="text-align:center;"><span class="creadornot badge badge-pill">${CRecruitVO.creadornot}</span></td><!--  ${CRecruitVO.acceptmethod} : 지원한 이력서 이름 -->
			</tr>
			</c:forEach>
		</table>
	</div>
	<br> <br>
</div>
<script>
function ongoing_recruits(){//모집중
	 self.location="/personal/applied_ongoing";
}
function closed_recruits(){//모집완료
	self.location="/personal/applied_closed";
}
function all_recruits(){//전체
	self.location="/personal/applied";	
}

$(document).ready(function(){
	
	if($("#controller_value").val()=="all"){
		$("#all_btn").addClass("btn-info");
	}else if($("#controller_value").val()=="ongoing"){
		$("#ongoing_btn").addClass("btn-info");
	}else if($("#controller_value").val()=="closed"){
		$("#closed_btn").addClass("btn-info");
	}

 	$(".jobdesc").each(function(index){
 		
 		console.log("아"+$(this).text());
	 	
 		if($(this).text()=='모집완료'){
 			$(this).addClass('');
		}else if($(this).text()=='모집중'){
			$(this).addClass('badge-success');
		}else{
			$(this).addClass('badge-warning');
		} 
	}); 
	$(".creadornot").each(function(index){
 		
 		console.log("아"+$(this).text());
	 	
 		if($(this).text()=='0'||$(this).text()=='읽지않음'){
 			$(this).text('읽지않음');
 			$(this).addClass('');
		}else if($(this).text()=='1'||$(this).text()=='읽음'){
			$(this).text('읽음');
			$(this).addClass('');
		}else{
			$(this).text('오류');
			$(this).addClass('badge-warning');
		} 
	});
});
</script>

<%@include file="../include/cfooter.jsp"%>