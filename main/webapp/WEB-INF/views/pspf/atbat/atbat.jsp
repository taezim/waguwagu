<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
     
<!DOCTYPE html>

<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>선수 정보</h1>
<form:form>
    <table>
        <tr>
            <th>선수 식별자</th>
            <td>${atbatOne.atbatplayerID}</td>
        </tr>
        <tr>
            <th>경기 횟수</th>
            <td>${atbatOne.matches}</td>
        </tr>
        <tr>
            <th>승리 횟수</th>
            <td>${atbatOne.win}</td>
        </tr>
        <tr>
            <th>패배 횟수</th>
            <td>${atbatOne.loss}</td>
        </tr>
        <tr>
            <th>세이브 횟수</th>
            <td>${atbatOne.save}</td>
        </tr>
        <tr>
            <th>홀드 횟수</th>
            <td>${atbatOne.hold}</td>
        </tr>
        <tr>
            <th>승률</th>
            <td>${atbatOne.odds}</td>
        </tr>
        <tr>
            <th>이닝 수</th>
            <td>${atbatOne.innings}</td>
        </tr>
        <tr>
            <th>피안타 수</th>
            <td>${atbatOne.hitsAllowed}</td>
        </tr>
        <tr>
            <th>피홈런 수</th>
            <td>${atbatOne.homeRunsAllowed}</td>
        </tr>
        <tr>
            <th>볼넷 수</th>
            <td>${atbatOne.walks}</td>
        </tr>
        <tr>
            <th>사구 수</th>
            <td>${atbatOne.hitByPitch}</td>
        </tr>
        <tr>
            <th>삼진 수</th>
            <td>${atbatOne.strikeouts}</td>
        </tr>
        <tr>
            <th>실점 수</th>
            <td>${atbatOne.runs}</td>
        </tr>
        <tr>
            <th>자책점 수</th>
            <td>${atbatOne.earnedRuns}</td>
        </tr>
        <tr>
            <th>출루 허용률</th>
            <td>${atbatOne.onBaseAllowed}</td>
        </tr>
    </table>
    <a href="<c:url value='/atbatstart/updateatbat?paramatbat=${atbatOne.atbatplayerID}' />" class="btn btn-outline-danger">수정하기</a>
    <a href="<c:url value="javascript:deleteConfirm('${atbatOne.atbatplayerID}')" />" class="btn btn-outline-danger" >삭제하기</a>
</form:form>
    
    <canvas id="myChart"></canvas>

    
<canvas id="myDoughnutChart" style="max-width: 300px;"></canvas>
<script>
  var doughnutData = {
    labels: ['승리 횟수', '패배 횟수', '세이브 횟수', '홀드 횟수'],
    datasets: [{
      data: [${atbatOne.win}, ${atbatOne.loss}, ${atbatOne.save}, ${atbatOne.hold}],
      backgroundColor: ['rgba(255, 99, 132, 0.5)', 'rgba(54, 162, 235, 0.5)', 'rgba(255, 206, 86, 0.5)', 'rgba(75, 192, 192, 0.5)'],
      borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)'],
      borderWidth: 1
    }]
  };
  // 도넛 차트 생성
  var ctx = document.getElementById('myDoughnutChart').getContext('2d');
  var myDoughnutChart = new Chart(ctx, {
    type: 'doughnut',
    data: doughnutData,
  });
</script>

    
	<script>
// 그래프를 그릴 데이터
var playerData = {
  labels: ['선수 식별자', '경기 횟수', '승리 횟수', '패배 횟수', '세이브 횟수', '홀드 횟수', '승률', '이닝 수', '피안타 수', '피홈런 수', '볼넷 수', '사구 수', '삼진 수', '실점 수', '자책점 수', '출루 허용률'],
  datasets: [{
    label: '${atbatOne.atbatplayerID}',
    data: ['${atbatOne.atbatplayerID}', ${atbatOne.matches}, ${atbatOne.win}, ${atbatOne.loss}, ${atbatOne.save}, ${atbatOne.hold}, ${atbatOne.odds}, ${atbatOne.innings}, ${atbatOne.hitsAllowed}, ${atbatOne.homeRunsAllowed}, ${atbatOne.walks}, ${atbatOne.hitByPitch}, ${atbatOne.strikeouts}, ${atbatOne.runs}, ${atbatOne.earnedRuns}, ${atbatOne.onBaseAllowed}],
    backgroundColor: 'rgba(75, 192, 192, 0.5)',
    borderColor: 'rgba(75, 192, 192, 1)',
    borderWidth: 1
  }]
};

//그래프 생성
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
  type: 'line', // 선 그래프 유형으로 변경
  data: playerData,
  options: {
    scales: {
      y: {
        beginAtZero: true // y축의 시작 값을 0으로 설정
      }
    }
  }
});
</script> 

<script>
	function deleteConfirm(atbatId)
	{
		if(confirm("삭제하시겠습니까?")==true) location.href = "./atbatdelete?atbatId=" +atbatId;
		else return;	
	}
	</script>
</body>
</html>