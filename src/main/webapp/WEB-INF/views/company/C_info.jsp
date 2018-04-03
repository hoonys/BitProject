<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/pheader.jsp"%>

<!-- Main content -->
<!-- 기업 페이지 -->
<div class="col-md-9">
	<!-- 기업 페이지 첫번째(이미지, 이름, 소개) -->
	<div class="top_cont">
		<div class="corp_logo">
			<img src="/resources/rpjt/img/${CInfoVO.img}" width="209" height="117" / name="img" value="${CInfoVO.img}" /> <br> <br>
			<h1 class="ci_name">${CInfoVO.cname}</h1>
			<br>
		</div>
		<div class="ci_desc">
			<p class="txt">${CInfoVO.intro}</p>
		</div>
	</div>
	<!-- //기업 페이지 첫번째 -->
	<br> <br>
	<!-- 기업 페이지 두번째(기본 정보) -->
	<div class="company_info_content">
		<!-- ★아래 두 줄의 class 설정으로 인해 테이블이 반응형으로 적용됨 -->
		<div class="table-responsive">
			<!-- ★클래스를 여러 개 쓰고 싶으면 한 칸 띄우고 쓰기/table-striped는 홀수번째마다 색칠하기 -->
			<table class="table table-bordered">


				<tbody>
					<tr>
						<!-- ★scope="row"는 태그가 있는 행의 나머지 셀에 적용 -->
						<!-- ★class="table-active"는 셀 바탕색,active말고도 success, warning, danger, info -->
						<th class="table-active" scope="row">기업명</th>
						<td>${CInfoVO.cname}</td>
						<th class="table-active" scope="row">대표자명</th>
						<td>${CInfoVO.ceo}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">업종</th>
						<td colspan="3">${CInfoVO.ctype}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">기업형태</th>
						<td colspan="3">${CInfoVO.form}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">설립일</th>
						<td colspan="3">${CInfoVO.establish}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">사원수</th>
						<td>${CInfoVO.numemp}명</td>
						<th class="table-active" scope="row">매출액</th>
						<td>${CInfoVO.sales}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">대표전화</th>
						<td>${CInfoVO.tel}</td>
						<th class="table-active" scope="row">FAX</th>
						<td>${CInfoVO.fax}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">홈페이지</th>
						<td>
							<a href="${CInfoVO.homepage}" class="link_site" target="_blank" rel="nofollow">${CInfoVO.homepage}</a>
						</td>
						<th class="table-active" scope="row">SNS</th>
						<td>
							<a href="${CInfoVO.sns}" class="link_site" target="_blank" rel="nofollow">${CInfoVO.sns}</a>
						</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">기업주소</th>
						<td colspan="3">${CInfoVO.location}</td>
					</tr>
					<!-- ★복지는 2차 개발 -->
					<!-- <tr>
                        <th class="table-active" scope="row">복지</th>
                        <td colspan="3">하하하하하하 </td>
                      </tr> -->
				</tbody>
			</table>
			<!-- //table class -->
		</div>
		<!-- //table-responsive -->
	</div>
	<!-- //기업 페이지 두번째(company_info_content) -->
	<br> <br>


	<h1>
		<a>'${CInfoVO.cname}'</a>진행중인 채용 공고
	</h1>

	<div class="row">
		<c:forEach items="${RecruitList}" var="list">
			<div class="col-sm-6 col-md-4">

				<div class="thumbnail">

					<div class="caption">
						<span>~${list.period}</span> <img src=/resources/rpjt/img/non.png> <br>
						<a id="r1" value="${list.bno}">${list.title}</a><br> <span>${list.career}</span>|<span>${list.edu}</span>|<span>${list.rgbid}</span>|<span>${list.jobgroup1}</span>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>





	<!-- //수정 버튼 -->
	<br> <br>
</div>
<!-- //기업 페이지 -->

<script>
	$(document).on("click", '#r1', function() {

		var a = $(this).attr("value");

		self.location = "/company/C_recruitMent?recruitNum=" + a;

	})
</script>


<%@include file="../include/cfooter.jsp"%>