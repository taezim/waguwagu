<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
            <td>${batterOne.batterplayerID}</td>
        </tr>
        <tr>
            <th>경기 횟수</th>
            <td>${batterOne.matches}</td>
        </tr>
        <tr>
            <th>타석 수</th>
            <td>${batterOne.atBats}</td>
        </tr>
        <tr>
            <th>타수 수</th>
            <td>${batterOne.strokes}</td>
        </tr>
        <tr>
            <th>득점 수</th>
            <td>${batterOne.score}</td>
        </tr>
        <tr>
            <th>안타 수</th>
            <td>${batterOne.hits}</td>
        </tr>
        <tr>
            <th>2루타 수</th>
            <td>${batterOne.doubles}</td>
        </tr>
        <tr>
            <th>3루타 수</th>
            <td>${batterOne.triples}</td>
        </tr>
        <tr>
            <th>홈런 수</th>
            <td>${batterOne.homeRuns}</td>
        </tr>
        <tr>
            <th>타점 수</th>
            <td>${batterOne.rbis}</td>
        </tr>
        <tr>
            <th>도루 수</th>
            <td>${batterOne.stolenBases}</td>
        </tr>
        <tr>
            <th>병살타 수</th>
            <td>${batterOne.doublePlays}</td>
        </tr>
        <tr>
            <th>타율</th>
            <td>${batterOne.battingAverage}</td>
        </tr>
        <tr>
            <th>장타율</th>
            <td>${batterOne.sluggingPercentage}</td>
        </tr>
        <tr>
            <th>출루율</th>
            <td>${batterOne.onBasePercentage}</td>
        </tr>
    </table>
    <a href="<c:url value='/batterstart/updatebatter?parambatter=${batterOne.batterplayerID}' />" class="btn btn-outline-danger">수정하기</a>
    <a href="<c:url value="javascript:deleteConfirm('${batterOne.batterplayerID}')" />" class="btn btn-outline-danger" >삭제하기</a>
</form:form>

	 <div class="chart-container">
        <canvas id="lineChart"></canvas>
        <canvas id="doughnutChart" style="max-width: 300px;"></canvas>
    </div>
   
<script>
    // 선 그래프 코드...
    
    var doughnutCtx = document.getElementById('doughnutChart').getContext('2d');
    var doughnutChart = new Chart(doughnutCtx, {
        type: 'doughnut',
        data: {
            labels: ['승리횟수', '패배횟수', '세이브횟수', '홀드횟수'],
            datasets: [{
                data: [10, 5, 2, 3], // 임의의 데이터, 실제로는 데이터를 가져와야 합니다.
                backgroundColor: ['rgba(75, 192, 192, 0.5)', 'rgba(255, 99, 132, 0.5)', 'rgba(255, 205, 86, 0.5)', 'rgba(201, 203, 207, 0.5)'],
                borderColor: ['rgba(75, 192, 192, 1)', 'rgba(255, 99, 132, 1)', 'rgba(255, 205, 86, 1)', 'rgba(201, 203, 207, 1)'],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true
        }
    });
</script>

    
    <script>
    var lineCtx = document.getElementById('lineChart').getContext('2d');
    var lineChart = new Chart(lineCtx, {
        type: 'line',
        data: {
            labels: ['선수 식별자', '경기 횟수','타석 수', '타수 수', '득점 수', '안타 수', '2루타 수', '3루타 수', '홈런 수', '타점 수', '도루 수', '병살타 수', '타율', '장타율', '출루율'],
            datasets: [{
                label: '${batterOne.batterplayerID}',
                data: ['${batterOne.batterplayerID}', ${batterOne.matches}, ${batterOne.atBats}, ${batterOne.strokes}, ${batterOne.score}, ${batterOne.hits}, ${batterOne.doubles}, ${batterOne.triples}, ${batterOne.homeRuns}, ${batterOne.rbis}, ${batterOne.stolenBases}, ${batterOne.doublePlays}, ${batterOne.battingAverage}, ${batterOne.sluggingPercentage}, ${batterOne.onBasePercentage}],
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1,
                fill: false
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

 
    </script>
</body>
</html>
