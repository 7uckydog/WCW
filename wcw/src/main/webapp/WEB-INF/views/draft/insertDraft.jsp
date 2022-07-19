<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/draft/insertDraft.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<meta charset="UTF-8">
<title>기안 작성</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
<script>
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="section">
        <span class="title">기안 작성</span><br>
        <div id="content">
            <span class="sub_title" id="draft_select_title">기안 분류</span>
            <select id="draft_select" class="select">
                <option value="1">기안서</option>
                <option value="2">지출결의서</option>
                <option value="3">정산서</option>
            </select>
            <span class="sub_title" id="emp_select_title">결재자</span>
            <select id="emp_select1" class="select">
            	<option selected disabled value="default">결재자1</option>
            	<c:forEach items="${employeeList}" var="list">
            		<c:if test="${list.job_level <= loginSSInfo.job_level}">
            			<option value="${list.job_level}">${list.name}</option>
            		</c:if>
            	</c:forEach>
            </select>
            <select id="emp_select2" class="select" disabled>
            <option selected disabled>결재자2</option>
                <option value="default">선택안함</option>
                <option>테스트용</option>
            </select>
            <select id="emp_select3" class="select" disabled>
            <option selected disabled>결재자3</option>
                <option value="default">선택안함</option>
            </select>
            <form id="tables">
                <table class="table" id="table1" border="1px">
                    <tr>
                        <td class="first_td">기안 제목</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">경유</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">목적</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">기안 내용</td>
                        <td class="first_td_textarea"><textarea class="textarea" class="write_td"></textarea></td>
                    </tr>
                    <tr>
                        <td class="first_td">비고</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                </table>
                <table class="table" id="table2">
                    <tr>
                        <td class="first_td">결의서 제목</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">지출 예정 일자</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">결의서 내용</td>
                        <td class="first_td_textarea"><textarea class="textarea" class="write_td"></textarea></td>
                    </tr>
                    <tr>
                        <td class="first_td">비고</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                </table>
                <table class="table" id="table3" border="1px">
                    <tr>
                        <td class="first_td">정산서 제목</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">발생 기간</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">목적</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">기안 내용</td>
                        <td class="first_td_textarea"><textarea class="textarea" class="write_td"></textarea></td>
                    </tr>
                    <tr>
                        <td class="first_td"></td>
                        <td class="count_td">
                            <table id="second_table"> 
                                <tr class="second_tr">
                                    <td class="first_td_scd">항목</td>
                                    <td id="first_td_scd2">내용</td>
                                    <td id="first_td_scd3">금액(숫자)</td>
                                </tr>
                                <tr class="second_tr">
                                    <td class="first_td_scd">법인 카드</td>
                                    <td><input type="text" class="card_content"></td>
                                    <td><input type="number" class="card_won" id="cp_card"></td>
                                </tr>
                                <tr class="second_tr">
                                    <td class="first_td_scd">개인 카드</td>
                                    <td><input type="text" class="card_content"></td>
                                    <td><input type="number" class="card_won" id="ep_card"></td>
                                </tr>
                                <tr class="second_tr">
                                    <td class="first_td_scd">합계</td>
                                    <td></td>
                                    <td><input type="number" class="card_won" id="total_won" readonly></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="first_td">비고</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                </table>
                <input type="submit" id="ok_btn" value="상신">
            </form>
        </div>
    </section>
<script>
// 기안 분류 변경 시
$("#draft_select").on('change', function() {
	var option = $('#draft_select').val();
	if(option == 1){
		$('#table1').show();
		$('#table2').hide();
		$('#table3').hide();
	}
	else if(option == 2){
		$('#table1').hide();
		$('#table2').show();
		$('#table3').hide();
	}
	else if(option == 3){
		$('#table1').hide();
		$('#table2').hide();
		$('#table3').show();
	}
});

// 결재자 선택
$('#emp_select1').change(function(){
	// 결재자1 선택이 되었으면
	if($('#emp_select1').val() != "default"){
		// 결재자2 선택할 수 있도록
		$('#emp_select2').removeAttr("disabled");
		
		/* for(var i = 0; ${employeeList}.length; i++){
			// 결재자 2에는 결재가 1보다 높은 직급만
			if(${employeeList[i].job_level} <= $('#emp_select1').val()){
				var option = $("<option value='"+ ${employeeList[i].job_level}+"'>" + ${employeeList[i].name} + "</option>");
			}
			$('#emp_select2').append(option);
		}  */
	}
})
$('#emp_select2').change(function(){
	// 결재자2가 선택이 되었으면
	if($('#emp_select2').val() != "default"){
		// 결재자3 선택할 수 있도록
		$('#emp_select3').removeAttr("disabled");
	}
	// 결재자2가 선택되지 않았다면
	else if ($('#emp_select2').val() == "default"){
		// 결재자3 선택 불가
		$('#emp_select3').attr("disabled", true);
	}
})



</script>


<script>
// 정산서 - 카드 금액(숫자) 입력 시 숫자만 입력하도록
/* $('#total_won').on("change", function(){
	console.log("어쩔");
	var x = $(this).val();
	x = removeCommas(x);
	$(this).val(x);

}).on("focusout", function(){
	var x = $(this).val();
	if(x && x.length > 0){
		if(!$.isNumeric(x)){
			x = x.replace(/[^0-9]/g,"");
		}
		x = addCommas(x);
		$(this).val(x);
	}
}).on("keyup", function(){
	$(this).val( $(this).val().replace(/[^0-9]/g,""));
})

function addCommas(x){
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
}

function removeCommas(x){
	if(!x || x.length == 0 ) return "";
	else return x.split(",").join("");
} */

// 정산서 - 카드 금약(숫자) 입력 시 자동 합계 계산
$('.card_won').focusout(function(){
	var cpCard = -999;
	var epCard = -99999;
	
	if($('#cp_card').val() == ""){
		cpCard = 0;	
	}
	else{
		cpCard = parseInt($('#cp_card').val());
	}

	if($('#ep_card').val() == ""){
		epCard = 0;	
	}
	else{
		epCard = parseInt($('#ep_card').val());
	}
	
	var total = cpCard + epCard;
	$('#total_won').val(total);
})
</script>   
</body>
</html>