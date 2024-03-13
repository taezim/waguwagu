<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>

	<div class="container-fluid px-4">
		<h1 class="mt-4">QnA 답변</h1>
		<div class="card mb-4">
			<div class="card-body">
				<form>
					<div class="mb-3 mt-3">
						<label for="bno" class="form-label">답변번호</label> <input type="text"
							class="form-control" id="bno" name="bno" value="${answerlistone.answernumber}"
							disabled>
					</div>
					<div class="mb-3">
						<label for="title" class="form-label">질문번호</label><input
							type="text" class="form-control" id="title" name="title"
							value="${answerlistone.questionnumber}" disabled>
					</div>
					<div class="mb-3">
						<label class="form-label">답변내용</label>
						<textarea class="form-control" id="content" 
							disabled>${answerlistone.answercontent}</textarea>
					</div>
					<div class="mb-3">
						<label for="regDate" class="form-label">답변자 아이디</label> <input
							type="text" class="form-control" id="regDate" name="regDate"
							value="${answerlistone.respondentid}" disabled>
					</div>
					<div class="mb-3">
						<label for="writer" class="form-label">답변날짜</label> <input
							type="text" class="form-control" id="writer" name="writer"
							value="${answerlistone.replaydate}" disabled>
					</div>
					<a href="<c:url value="/answers" />" class="btn btn-outline-secondary">목록</a> <a
						href="<c:url value="/classanswers/classupdate?classupdatean=${answerlistone.classid}"/>" class="btn btn-outline-warning">수정</a>
					<a href="<c:url value="javascript:deleteConfirm('${answerlistone.classid }')"/>" class="btn btn-outline-danger">삭제</a>
				</form>
			</div>
		</div>
	</div> 
	 <canvas id="myChart"></canvas>

    <script>
        // 선택한 값들
        var selectedValues = [10, 20, 30, 40, 50];

        // 그래프 생성을 위한 데이터 설정
        var data = {
            labels: ['값 1', '값 2', '값 3', '값 4', '값 5'],
            datasets: [{
                label: '선택한 값들',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1,
                data: selectedValues
            }]
        };

        // 그래프 생성
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: data,
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
	<script>
	function deleteConfirm(answerjs)
	{
		if(confirm("삭제하시겠습니까?")==true) location.href = "./classdelete?answerjs=" +answerjs;
		else return;	
	}
	</script>
</body>
</html>