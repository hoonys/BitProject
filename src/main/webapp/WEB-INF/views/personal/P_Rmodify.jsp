<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>   
<%@include file="../include/pheader.jsp"%>

<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<div class="col-md-9">
	<h1>${PUserVO.id}님의 이력서 수정</h1>
	<form role="form" method="post">
	 	<input type="text" class="form-control" id="bno" name="bno" value="${ResumeVO.bno}" readonly>
		<br>	
		<div class="form-group">
			<label for="title">제목</label> <input class="form-control" id="title" name="title" value="${ResumeVO.title}">
		</div>
      	<div class="table-responsive">
         <table class="table table-bordered">
            <tbody>
               <tr>
                <th class="table-active" scope="row"><label for="pname">이름</label> </th>
	          	<td class="col-sm-4">
	           		<input type="text" class="form-control" id="pname" name="pname" value="${PUserVO.pname}" readonly>
	           	</td>
                <th rowspan = "3" class="table-active" scope="row"><label for="img">사진</label></th>
                <td rowspan = "3" class="col-sm-4">
                    <div id= 'uploadedList' style = 'width : 127px; height : 152px; border : 1px dotted blue;'>
				    <img id = 'imgsrc' height = "150px;" alt="${ResumeVO.img}" /> 
				   </div>
				   	<!--  사진 보이는 div  -->
				   	
                   	<input id='imgsrccheck' type='hidden' value = "${ResumeVO.img}"/>
                   	 <!-- db에 있는 file img 이름 받아오는 hidden input -->
                   	 <input type = 'hidden' id='uploadfilename' name = 'img' >
					<!-- db에 올라갈 file img 이름 받아오는 hidden input -->
					
					<br>
					<input type = 'file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp">
					<!--파일 업로드 하는 버튼-->
					
				   	<input type = 'hidden' id = 'xornot' value = '0'>
				   	<input type = 'hidden' id = 'preexistenceimg' value = '0'>
               	 </td>
               </tr>
               <tr>
                  <th class="table-active" scope="row"><label>생년월일</label></th>
                  <td>
                  	<div class="form-group">
						<input type="text" class="form-control" id="" name="birth" value="${PUserVO.birth}" readonly>
					</div>
				  </td>
			    </tr>
			  	<tr>
                  <th class="table-active" scope="row"><label for="email">이메일</label></th>
            	  <td>
				  	<div class="form-group">
					 <input type="text" class="form-control" id="email" name="email" value="${PUserVO.email}" readonly>
					</div>
				</td>
               </tr>
             </tbody>
         </table>
      	 </div>
      	 
      	<hr style="border: solid 4px #ccc;">
		<h4>
			<b>연락처 목록</b>
		</h4>
		<div id="tel_div"></div>
		<hr style="border: solid 4px #ccc;">
		
		<!-- r.code 03/13 : 학력/경력 폼 수정-->
		<hr style="border: solid 1px #ccc;">
		<h4>
			<b>학력사항</b>
			<div class="form-group col-md-3">
			<select class="form-control" name=levelofeducation id="CodeList2">
	          <c:forEach items="${CodeVOlist }" var="CodeVO">
	             <c:if test="${CodeVO.tid == 2 }">
	                <option value="${CodeVO.id }" <c:if test="${CodeVO.id == ResumeVO.levelofeducation}">selected</c:if> > ${CodeVO.career} </option>
	             </c:if>
	          </c:forEach>
	       </select>
	       </div>
		</h4>
		<div id="edu_div"></div>
		<hr style="border: solid 1px #ccc;">
		<h4>
			<b>경력사항</b>
			<div class="form-group col-md-3">
			<select class="form-control" name="lastcareer" id="CodeList1">
	          <c:forEach items="${CodeVOlist }" var="CodeVO">
	             <c:if test="${CodeVO.tid == 1 }">
	                <option value="${CodeVO.id }" <c:if test="${CodeVO.id == ResumeVO.lastcareer}">selected</c:if> > ${CodeVO.career} </option>
	             </c:if>
	          </c:forEach>
	       </select>
	       </div>
		</h4>
		<div id="exp_div"></div>
		<hr style="border: solid 1px #ccc;">
		<!-- end of r.code -->
	    <hr style="border: solid 4px #ccc;">
		<h4>
			<b>사이트 목록</b>
		</h4>
		<div id="web_div"></div>
		<hr style="border: solid 4px #ccc;">
	    <hr style="border: solid 4px #ccc;">
		<h4>
			<b>보유 자격증 목록</b>
		</h4>
		<div id="license_div"></div>
		<hr style="border: solid 4px #ccc;">
	   <hr style="border: solid 4px #ccc;">
		<h4>
			<b>어학 능력(자격증) 목록</b>
		</h4>
		<div id="language_div"></div>
		<hr style="border: solid 4px #ccc;">
	     
	     <div class="table-responsive">
	       <table class="table table-bordered">
	          <tbody>
	            <tr>
	               <th class="table-active" colspan="5" scope="row" style="text-align: center;">자기소개서</th>
	            </tr> 
	            <tr>
	             <td colspan="5" rowspan="2">
	               	<div class="form-group">
					<textarea class="form-control" rows="13" id="coverletter" name="coverletter" style = "resize:none;" required>${ResumeVO.coverletter}</textarea>
					</div>
	             </td>   
	            </tr>
	           </tbody>
	       </table>      
	    </div> 
  	</form>
		<button id="write-success" class="btn btn-success col-md-offset-10" type="submit">등록</button>
		<button id ="write-cancel" class="btn btn-danger" onClick="javascript:self.location='/personal/detail?bno=${ResumeVO.bno}';" type="button">취소</button>
</div>
<script id="template_tel" type="text/x-handlebars-template">
<div class="row tel_row_number">
	<hr style="border: solid 0.5px #ccc;">

	<input type="hidden" class="form-control telid" value="{{telid}}"></input>
	<input type="hidden" class="form-control rid telclass" name="ptelvolist[].rid" value="{{rid}}"></input>
	
	<div class="form-group col-md-3">
		<label for="teltitle">전화번호 (종류)</label> 
		<input class="form-control teltitle telclass" name="ptelvolist[].teltitle" value="{{teltitle}}"></input>
	</div>
	
	<div class="form-group col-md-4">
		<label for="tel">전화번호</label> 
		<input class="form-control tel telclass" name="ptelvolist[].tel" value="{{tel}}"></input>
	</div>
	
	<div class="form-group col-md-2">
		<label id="tel_label">추가/삭제</label>
		<br>
		<button class="btn btn-default btn-sm tel_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm tel_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>
<script id="template_edu" type="text/x-handlebars-template">
<div class="row edu_row_number">
	<hr style="border: solid 0.5px #ccc;">
	<div class="form-group col-md-2">
		<input class="edu" type="hidden" name="listEdu[].resumenum" value="{{resumenum}}">
		<label>입학일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control enterdate edu edudates"
				name="listEdu[].enterdate" value="{{enterdate}}">
			<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	<div class="form-group col-md-2">
		<label>졸업일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control gradudate edu edudates"
				name="listEdu[].gradudate" value="{{gradudate}}">
			<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	<div class="form-group col-md-3">
		<label for="schoolname">학교명</label> <input class="form-control schoolname edu"
			name="listEdu[].schoolname" value="{{schoolname}}"></input>
	</div>
	<div class="form-group col-md-2">
		<label for="major">학과</label> <input class="form-control major edu"
			name="listEdu[].major" value="{{major}}"></input>
	</div>
	<div class="form-group col-md-2">
		<label for="edustatus">졸업상태</label>
		<select class="form-control edustatus edu" name="listEdu[].edustatus">
			{{#select edustatus}}
			<option value="102">선택</option>
			<option value="15">재학</option>
			<option value="16">졸업</option>
			<option value="17">중퇴</option>
			<option value="18">졸업예정</option>
			<option value="19">휴학</option>
			{{/select}}
		</select>
	</div>
	<div class="form-group col-md-2">
		<label id="edu_label">추가/삭제</label><br />
		<button class="btn btn-default btn-sm edu_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm edu_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>
<script id="template_exp" type="text/x-handlebars-template">
<div class="row exp_row_number">
	<input class="career" type="hidden" name="listCareer[].resumenum" value="{{resumenum}}">
	<hr style="border: solid 0.5px #ccc;">
	<div class="form-group col-md-3">
		<label>입사일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control career careerdates" name="listCareer[].startjob"
				value="{{startjob}}"> <span
				class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	<div class="form-group col-md-3">
		<label>퇴사일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control career careerdates"
				name="listCareer[].finishjob" value="{{finishjob}}"> <span
				class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	<div class="form-group col-md-3">
		<label for="cname">회사명</label>
		<input class="form-control career" name="listCareer[].cname" value="{{cname}}"></input>
	</div>
	<div class="form-group col-md-3">
		<label for="jobdescription">담당업무</label>
		<input class="form-control career" name="listCareer[].jobdescription" value="{{jobdescription}}">
		</input>
	</div>
	<div class="form-group col-md-3">
		<label for="salary">연봉</label>
		<select class="form-control career" name="listCareer[].salary">
			{{#select salary}}
			<option value="102">선택</option>
			<option value="34">~ 2,000</option>
			<option value="35">2,000 ~ 2,500</option>
			<option value="36">2,500 ~ 3,000</option>
			<option value="37">3,000 ~ 3,500</option>
			<option value="38">3,500 ~ 4,000</option>
			<option value="39">4,000 ~ 4,500</option>
			<option value="40">4,500 ~ 5,000</option>
			<option value="41">5,000 ~ 6,000</option>
			<option value="42">6,000 ~ 6,500</option>
			<option value="43">6,500 ~ 7,000</option>
			<option value="44">7,000 ~ 7,500</option>
			<option value="45">7,500 ~ 8,000</option>
			<option value="46">8,000 ~ 8,500</option>
			<option value="47">8,500 ~ 9,000</option>
			<option value="48">9,000 ~ 9,500</option>
			<option value="49">9,500 ~ 10,000</option>
			<option value="50">10,000 ~ 10,500</option>
			<option value="51">10,500 ~</option>
			{{/select}}
		</select>
	</div>
	<div class="form-group col-md-2">
		<label id="exp_label">추가/삭제</label><br />
		<button class="btn btn-default exp_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default exp_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>
<script id="template_web" type="text/x-handlebars-template">
<div class="row web_row_number">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control webid" value="{{webid}}"></input>
	<input type="hidden" class="form-control webclass rid" name="pwebsitesvolist[].rid" value="{{rid}}"></input>

	<div class="form-group col-md-3">
		<label for="webtitle">사이트 (종류)</label> 
		<input class="form-control webtitle webclass" name= "pwebsitesvolist[].webtitle" value="{{webtitle}}"> </input>
	</div>

	<div class="form-group col-md-4">
		<label for="webadd">주소</label> 
		<input class="form-control webadd webclass" name="pwebsitesvolist[].webadd" value="{{webadd}}"></input>
	</div>

	<div class="form-group col-md-2">
		<label id="web_label">추가/삭제</label><br />
		<button class="btn btn-default btn-sm web_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm web_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>

</div>
<!-- end of row -->
</script>
 <script id="template_license" type="text/x-handlebars-template">
<div class="row license_row_number">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control licenseid" value="{{licenseid}}"></input>
	<input type="hidden" class="form-control rid licenseclass" name="rlicensevolist[].rid" value="{{rid}}"></input>
	
	<div class="form-group col-md-3">
		<label for="licensename">자격증명</label> 
		<input class="form-control licensename licenseclass" name="rlicensevolist[].licensename" value="{{licensename}}"></input>
	</div>

	<div class="form-group col-md-3">
		<label for="publeoffice">발행기관</label> 
		<input class="form-control publeoffice licenseclass" name="rlicensevolist[].publeoffice" value="{{publeoffice}}"></input>
	</div>
	
	<div class="form-group col-md-3">
		<label for="acquidate">취득일자</label> 
			<div class="input-group date" data-provide="datepicker">
				<input type="text" class="input-group date form-control acquidate licenseacquidate licenseclass" name="rlicensevolist[].acquidate" value="{{acquidate}}">
				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			</div>
	</div>

	<div class="form-group col-md-2">
		<label id="license_label">추가/삭제</label><br/>
		<button class="btn btn-default btn-sm license_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm license_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>

</div>
<!-- end of row -->
</script>           
            
 <script id="template_language" type="text/x-handlebars-template">
<div class="row lang_row_number">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control resumelangid" value="{{resumelangid}}"></input>
	<input type="hidden" class="form-control rid langclass" name="rlangvolist[].rid" value="{{rid}}"></input>

	<div class="form-group col-md-2">
		<label for="lid">언어 선택</label>
		<select class="form-control lid langclass" name="rlangvolist[].lid" value="{{lid}} >
			{{#select lid}}
			<option value="102">선택</option>
			<option value="102" selected>선택</option>
			<option value="52">영어</option>
			<option value="53">일본어</option>
			<option value="54">중국어</option>
			<option value="55">그리스어</option>
			<option value="56">네덜란드어</option>
			<option value="57">노르웨이어</option>
			<option value="58">독일어</option>
			<option value="59">러시아어</option>
			<option value="60">루마니아어</option>
			<option value="61">마인어</option>
			<option value="62">몽골어</option>
			<option value="63">미얀마어</option>
			<option value="64">베트남어</option>
			<option value="65">세르비아어</option>
			<option value="66">스웨덴어</option>
			<option value="67">스페인어</option>
			<option value="68">슬로바키아어</option>
			<option value="69">아랍어</option>
			<option value="70">유고어</option>
			<option value="71">이란(페르시아어)</option>
			<option value="72">이탈리아어</option>
			<option value="73">체코어</option>
			<option value="74">태국어</option>
			<option value="75">터키어</option>
			<option value="76">포르투갈어</option>
			<option value="77">폴란드어</option>
			<option value="78">프랑스어</option>
			<option value="79">헝가리어</option>
			<option value="80">히브리어</option>
			<option value="81">히브리어</option>
			<option value="82">그 외</option>
			{{/select}}
		</select>
	</div>
	
	<div class="form-group col-md-2">
		<label for="test">공인인증시험명</label> 
		<input class="form-control test langclass" name="rlangvolist[].test" value="{{test}}"></input>
	</div>
	
	<div class="form-group col-md-2">
		<label for="score">점수</label> 
		<input class="form-control score langclass" name="rlangvolist[].score" value="{{score}}"></input>
	</div>
	<div class="form-group col-md-2">
		<label for="publeoffice">발행기관</label> 
		<input class="form-control publeoffice langclass" name="rlangvolist[].publeoffice" value="{{publeoffice}}"></input>
	</div>
	<div class="form-group col-md-2">
		<label for="acquidate">취득일자</label> 
		<div class="input-group date" data-provide="datepicker">
				<input type="text" class="input-group date form-control acquidate languageacquidate langclass"  name="rlangvolist[].acquidate" value="{{acquidate}}">
				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	<div class="form-group col-md-2">
		<label id="lang_label">추가/삭제</label><br/>
		<button class="btn btn-default btn-sm lang_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm lang_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>
<script type='text/javascript'>
$(document).ready(function() {
		
	Handlebars.registerHelper('select', function( value, options ){
        var $el = $('<select />').html( options.fn(this) );
        $el.find('[value="' + value + '"]').attr({'selected':'selected'});
        return $el.html();
    });
	
	var formObj = $("form[role = 'form']");
	var xornot = document.getElementById('xornot');
	var preexistenceimg = document.getElementById('preexistenceimg');
	
	function datepick() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy-mm-dd",
			language : "kr"
		});
	}
	
	console.log('${PWebSitelist}');
	var imgsrccheck = ('#imgsrccheck');
	
		 if($('#imgsrccheck').val()!=""){
		console.log(" val이 널값아님");
		$('#imgsrc').attr("src", 'displayFile?fileName=${ResumeVO.img}');
		var str = "";
		str = 
			  "<a href='displayFile?fileName=${ResumeVO.img}' target='_blank'; return false;'>원본 확인"
			  +"</a>"
			  +"<small data-src=${ResumeVO.img}>X</small>";
		  $("#uploadedList").append(str); 
		  console.log("uploadedlist에 x버튼 추가");
		  $("#preexistenceimg").val("1");
	}else{
		console.log(" val이 널값이다");
		$('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
		$('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
		$("#preexistenceimg").val("0");
	}  
	var upload = document.getElementById('fileupload');
    var uploadedList = document.getElementById('uploadedList');
  
	if (typeof window.FileReader === 'undefined') {
	 console.log("window.FileReader 'fail'");
	} else {
	 console.log("window.FileReader 'success'");
	}  //fileLeader라는 프로그램 로딩이 제대로 되지 않았을 때
	  
 	  upload.onchange = function (e) {
	
		 var file = upload.files[0];
		 var reader = new FileReader();
		 //p542다시 보기
		 $("#uploadedList").empty();
		 //reader.onload start
		 reader.onload = function (event) {
			 var image = new Image();
			 image.src = event.target.result;
			  
			 uploadedList.innerHTML = '';
			 image.height = 150;
			 uploadedList.appendChild(image);
		 };//reader.onload end
	 
			 event.preventDefault();
			 //var files = event.originalEvent.dataTransfer.files;
			 
			 console.log("file name");
			 console.log(file);
			 
			 var formData = new FormData();
			 
			 formData.append("file", file);
			 
			 $.ajax({
				 url:'uploadAjax',
				 data: formData,
				 dataType : 'text',
				 processData : false,
				 contentType : false,
				 type : 'POST',
				 success : function(data){
					   var str = "";
					  
					 	console.log(data);
					 	
						  str = 
							  "<a href='displayFile?fileName="+getImageLink(data)+"' target='_blank'; return false;'>원본 확인"
							  +"</a>"
							  +"<small data-src="+data+">X</small>";

					  $("#uploadedList").append(str); 
					  console.log("uploadAjax 들어갔냐? getImageLink(data)가 뭐냐" + getImageLink(data));
					  document.getElementById('uploadfilename').value = getImageLink(data);
				  }//success : function(data) end
	 		  });//ajax end
	 console.log(file);
	 reader.readAsDataURL(file);
	};//upload change end   
	
	$("#uploadedList").on("click", "small", function(event){
		event.preventDefault();
		var that = $(this);
		
		if($("#xornot").val()==0){
			
			fileName = $(this).attr("data-src"); //전역변수로 설정
			var front = fileName.substring(0, 12);
			var end = fileName.substring(12);
			var thumcheck = fileName.substring(12,14);
			
			if(thumcheck!="s_"){
				console.log(thumcheck + "썸네일 아닐 때 fileName" + fileName);
				fileName = front + "s_" + end;
				console.log("썸네일 아니라서 바뀐 fileName" + fileName);
			}else{
				console.log(thumcheck + "썸네일인 fileName" + fileName);
			}
		
			$("#fileupload").val("");
			$("#uploadedList").empty();
			console.log("img File appended deleted");
			console.log("fileName"+fileName);
			$('#uploadfilename').val('');
			
			$("#xornot").val("1");
			console.log($("#xornot").val());
		}else if($("#xornot").val()==1){
			console.log("img File on server deleted");
			$(this).parent("div").empty();
			$("#fileupload").val("");
			$('#uploadfilename').val('');
			$("#uploadedList").empty();
			console.log("2번 이상 삭제 누름 img File appended deleted");
			console.log("2번 이상 삭제 누름 fileName"+fileName);
			
			$("#xornot").val("1");
			console.log($("#xornot").val());
		}
	}); 
	
	function getOriginalName(fileName){
      	var idx = fileName.indexOf("_")+1;
      	return fileName.substr(idx);
      }
	function getImageLink(fileName){
      	var front = fileName.substr(0,12);
      	var end = fileName.substr(14);
      	
      	return front + end;
      } 
	 
	$("#write-success").on("click", function() {
		
		console.log("write-success clicked");
		
		if($('#birth').val()==''){
			console.log("#birth.val()==''");
			$('#birth').val("0000-00-00");
		}
		$('.licenseacquidate').each(function(){ 
			if($(this).val()==''){
				console.log($(this).val());
				console.log(".licenseacquidate.val()==''");
				$(this).val("0000-00-00");
				console.log($(this).val());
			}
		});
		$('.languageacquidate').each(function(){ 
			if($(this).val()==''){
				console.log($(this).val());
				console.log(".languageacquidate.val()==''");
				$(this).val("0000-00-00");
				console.log($(this).val());
			}
		});
		$('.careerdates').each(function(){ 
			if($(this).val()==''){
				console.log($(this).val());
				console.log(".careerdates.val()==''");
				$(this).val("0000-00-00");
				console.log($(this).val());
			}
		});
		$('.edudates').each(function(){ 
			if($(this).val()==''){
				console.log($(this).val());
				console.log(".edudates.val()==''");
				$(this).val("0000-00-00");
				console.log($(this).val());
			}
		});
		
		if($("#xornot").val()==0){
			console.log("xornot.val()==0");
			console.log("사진 삭제 안함");

		}else if($("#xornot").val()==1&&$("#preexistenceimg").val()==1){
			//삭제 시키기 ajax 실행 후에 Rmodify로 넘어가기
			console.log("사진 삭제 후 filename" + fileName);
			console.log("사진 삭제함");		
			$.ajax({
				url:"deleteFile",
				type:"post",
				//data : {fileName:$(this).attr("data-src")},
				data: {fileName:fileName},
				dataType:"text",
				success:function(result){
					if(result=='deleted'){
						console.log("img File on server deleted");
						$(this).parent("div").remove();
					}
				}
			}); 
		}else if($("#xornot").val()==1&&$("#preexistenceimg").val()==0){
			console.log("preexistenceimg가 없었고 삭제 버튼을 누른 상태 : img File on server deleted");
			//$(this).parent("div").remove();
		}else{
			console.log("Exception : 어느 if문에도 들어가지 못함");
			console.log(("#preexistenceimg").val());
		}
		console.log("submit직전");
		formObj.attr("action", "/personal/Rmodify");
		formObj.attr("method", "post");
		numberingList();
		formObj.submit();
	});
	
	function numberingList() {
		$(".telclass").each(function(index){
			var num = 3;
			var name = $(this).attr("name");
			name = name.substring(0, 11) + parseInt(index/num) + name.substring(11);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		});
		$(".edu").each(function(index){
			var num = 6;
			var name = $(this).attr("name");
			name = name.substring(0, 8) + parseInt(index/num) + name.substring(8);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		});
		$(".career").each(function(index){
			var num = 6;
			var name = $(this).attr("name");
			name = name.substring(0, 11) + parseInt(index/num) + name.substring(11);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		});
		$(".webclass").each(function(index){
			var num = 3;
			var name = $(this).attr("name");
			name = name.substring(0, 16) + parseInt(index/num) + name.substring(16);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		}); 
	 	$(".langclass").each(function(index){
			var num = 6;
			var name = $(this).attr("name");
			name = name.substring(0, 12) + parseInt(index/num) + name.substring(12);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		}); 
		$(".licenseclass").each(function(index){
			var num = 4;
			var name = $(this).attr("name");
			name = name.substring(0, 15) + parseInt(index/num) + name.substring(15);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		}); 
	}
	// tel 추가버튼 이벤트
	$("#tel_div").on("click", ".tel_plus_btn", function(){
		 var item = {
			rid : ${ResumeVO.bno}
		}; 
		add_tel(item);
	});
	// tel 삭제버튼 이벤트
	$("#tel_div").on("click", ".tel_minus_btn", function(){
		 var tel_index = $(".tel_minus_btn").index(this);  // 존재하는 tel_minus_btn를 기준으로 index
		 console.log(tel_index);
		 if(tel_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	// edu 추가버튼 이벤트
	$("#edu_div").on("click", ".edu_plus_btn", function(){
		var item = {
			resumenum : ${ResumeVO.bno}
		};
		add_edu(item);
	});
	//edu minus 버튼 이벤트
	$("#edu_div").on("click", ".edu_minus_btn", function(){
		 var edu_index = $(".edu_minus_btn").index(this);  // 존재하는 edu_minus_btn를 기준으로 index
		 console.log(edu_index);
		 if(edu_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	// exp 추가버튼 이벤트
	$("#exp_div").on("click", ".exp_plus_btn", function(){
		var item = {
			resumenum : ${ResumeVO.bno}
		};
		add_exp(item);
	});
	//exp minus 버튼 이벤트
	$("#exp_div").on("click", ".exp_minus_btn", function(){
		 var exp_index = $(".exp_minus_btn").index(this);  // 존재하는 exp_minus_btn를 기준으로 index
		 console.log(exp_index);
		 if(exp_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	//웹 추가 버튼 이벤트
	$("#web_div").on("click", ".web_plus_btn", function(){
		var item = {
			rid : ${ResumeVO.bno}
		};
		add_web(item);
	});
	//웹 삭제 버튼 이벤트
	$("#web_div").on("click", ".web_minus_btn", function(){
		 var web_index = $(".web_minus_btn").index(this);  // 존재하는 web_minus_btn를 기준으로 index
		 console.log(web_index);
		 if(web_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	//자격증 추가 버튼 이벤트
	$("#license_div").on("click", ".license_plus_btn", function(){
		var item = {
			rid : ${ResumeVO.bno}
		};
		add_license(item);
	});
	//자격증 삭제 버튼 이벤트
	$("#license_div").on("click", ".license_minus_btn", function(){
		 var license_index = $(".license_minus_btn").index(this);  // 존재하는 web_minus_btn를 기준으로 index
		 console.log(license_index);
		 if(license_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	//언어 추가 버튼 이벤트
	$("#language_div").on("click", ".lang_plus_btn", function(){
		var item = {
			rid : ${ResumeVO.bno}
		};
		add_language(item);
	});
	//언어 삭제 버튼 이벤트
	$("#language_div").on("click", ".lang_minus_btn", function(){
		var lang_index = $(".lang_minus_btn").index(this);  // 존재하는 web_minus_btn를 기준으로 index
		 console.log(lang_index);
		 if(lang_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	function add_tel(item) {
		var source_tel = $("#template_tel").html();
		var template_tel = Handlebars.compile(source_tel);
		$("#tel_div").append(template_tel(item));
		datepick();
	}
	function add_edu(item) {
		var source_edu = $("#template_edu").html();
		var template_edu = Handlebars.compile(source_edu);
		$("#edu_div").append(template_edu(item));
		datepick();
	}
	function add_exp(item) {
		var source_exp = $("#template_exp").html();
		var template_exp = Handlebars.compile(source_exp);
		$("#exp_div").append(template_exp(item));
		datepick();
	}
	function add_web(item) {
		var source_web = $("#template_web").html();
		var template_web = Handlebars.compile(source_web);
		$("#web_div").append(template_web(item));
		datepick();
	}
	function add_license(item) {
		var source_license = $("#template_license").html();
		var template_license = Handlebars.compile(source_license);
		$("#license_div").append(template_license(item));
		datepick();
	}
	function add_language(item) {
		var source_language = $("#template_language").html();
		var template_language = Handlebars.compile(source_language);
		$("#language_div").append(template_language(item));
		datepick();
	}
	function tel_list() {
		var len = (${PTelVOlist.size()});
		
		if( len > 0 ) {
			<c:forEach items="${PTelVOlist}" var="PTelVO">
				var item = {
					telid : ${PTelVO.telid},
					rid : ${PTelVO.rid},
					teltitle : "${PTelVO.teltitle}", 
					tel : "${PTelVO.tel}" 
				};
				add_tel(item);
			</c:forEach>
		}else{
			var item = {
					telid : "",
					rid : ${ResumeVO.bno},
					teltitle : "", 
					tel : "" 
				};
			add_tel(item);
		}
	}
	function edu_list() {
		var len = (${eduVOlist.size()});
		
		if( len > 0 ) {
			<c:forEach items="${eduVOlist}" var="eduVO">
				var item = {
					resumenum : ${eduVO.resumenum},
					schoolname : "${eduVO.schoolname}",
					major : "${eduVO.major}",
					enterdate : "${eduVO.enterdate}",
					gradudate : "${eduVO.gradudate}",
					edustatus : ${eduVO.edustatus}
				};
				add_edu(item);
			</c:forEach>
		}else{
			var item = {
					resumenum : ${ResumeVO.bno},
					schoolname : "",
					major : "",
					enterdate : "",
					gradudate : "",
					edustatus : ""
				};
				add_edu(item);
		}
	}
	
	function exp_list() {
		var len = (${careerVOList.size()});
		
		if( len > 0 ) {
			<c:forEach items="${careerVOList}" var="careerVO">
				var item = {
					resumenum : ${careerVO.resumenum},
					cname : "${careerVO.cname}",
					jobdescription : "${careerVO.jobdescription}",
					startjob : "${careerVO.startjob}",
					finishjob : "${careerVO.finishjob}",
					salary : ${careerVO.salary}
				};
				
				add_exp(item);
			</c:forEach>
		}else{
			var item = {
					resumenum : ${ResumeVO.bno},
					cname : "",
					jobdescription : "",
					startjob : "",
					finishjob : "",
					salary : ""
				};
				add_exp(item);
		}
		
	}		
	function web_list() {
		var len = (${PWebSiteVOlist.size()});
		
		if( len > 0 ) {
			<c:forEach items="${PWebSiteVOlist}" var="PWebSiteVO">
				var item = {
					webid : ${PWebSiteVO.webid},
					rid : ${PWebSiteVO.rid},
					webtitle : "${PWebSiteVO.webtitle}", 
					webadd : "${PWebSiteVO.webadd}"
				};
				add_web(item);
			</c:forEach>
		}else{
			var item = {
					webid : "",
					rid : ${ResumeVO.bno},
					webtitle : "", 
					webadd : ""
				};
				add_web(item);
		}
	}

	function license_list() {
		var len = (${RLicenselist.size()});
		
		if( len > 0 ) {
			<c:forEach items="${RLicenselist}" var="RLicenseVO">
				var item = {
					rid : ${RLicenseVO.rid},
					licensename : "${RLicenseVO.licensename}", 
					publeoffice : "${RLicenseVO.publeoffice}",
					acquidate : "${RLicenseVO.acquidate}"
				};
				add_license(item);
			</c:forEach>
		}else{
			var item = {
					rid : ${ResumeVO.bno},
					licensename : "", 
					publeoffice : "",
					acquidate : ""
				};
				add_license(item);
		}
	}
	function language_list() {
		var len = (${RLanguagelist.size()});
		
		if( len > 0 ) {
			<c:forEach items="${RLanguagelist}" var="ResumeLanguageVO">
				var item = {
					rid : ${ResumeLanguageVO.rid},
					lid : ${ResumeLanguageVO.lid},
					test : "${ResumeLanguageVO.test}", 
					score : "${ResumeLanguageVO.score}",
					publeoffice : "${ResumeLanguageVO.publeoffice}",
					acquidate : "${ResumeLanguageVO.acquidate}"
				};
				add_language(item);
			</c:forEach>
		}else{
			var item = {
					rid : ${ResumeVO.bno},
					lid : "",
					test : "", 
					score : "",
					publeoffice : "",
					acquidate : ""
				};
			add_language(item);
		}
	}
	tel_list();
	edu_list();
	exp_list();
	web_list();
	license_list();
	language_list();
	
	minus_btn();
	
	function minus_btn(){
		$('.tel_row_number').each(function(index) {
			if($(this).index()==0){
				$(this).find('#tel_label').text('추가');
				$(this).find('.tel_minus_btn').hide();
			}
		});
		$('.edu_row_number').each(function(index) {
			if($(this).index()==0){
				$(this).find('#edu_label').text('추가');
				$(this).find('.edu_minus_btn').hide();
			}
		});
		$('.exp_row_number').each(function(index) {
			if($(this).index()==0){
				$(this).find('#exp_label').text('추가');
				$(this).find('.exp_minus_btn').hide();
			}
		});
		$('.web_row_number').each(function(index) {
			if($(this).index()==0){
				$(this).find('#web_label').text('추가');
				$(this).find('.web_minus_btn').hide();
			}
		});
		$('.license_row_number').each(function(index) {
			if($(this).index()==0){
				$(this).find('#license_label').text('추가');
				$(this).find('.license_minus_btn').hide();
			}
		});
		$('.lang_row_number').each(function(index) {
			if($(this).index()==0){
				$(this).find('#lang_label').text('추가');
				$(this).find('.lang_minus_btn').hide();
			}
		});
	}
});
});
</script>

<%@include file="../include/cfooter.jsp"%>