<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" />
</head>
<body>
<h2>classqna 페이지 입니다.</h2>
	<div class="container">
    <div class="row" align="center">
        <c:forEach items="${batterLists}" var="batterlists">
            <div class="col-md-4">
                <h3>${batterlists.batterplayerID}</h3>
                <input type="checkbox" class="player-checkbox" data-player-id="${batterlists.batterplayerID}" />
                <p>${batterlists.matches}</p>
                <p>${batterlists.atBats}</p>
                <p>${batterlists.score}</p>
                <a href="<c:url value="/batterstart/batter?batterrequest=${batterlists.batterplayerID}"/>" class="btn btn-secondary" role="button">상세정보 &raquo;</a>
            </div>
        </c:forEach>
    </div>
    <div>
        <a href="./batterstart/createbatter">add</a>
    </div>
</div>
<canvas id="myChart"></canvas>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$(document).ready(function(){
    var ctx = document.getElementById('myChart').getContext('2d');
    var chart;

    $('.player-checkbox').change(function(){
        var playerId = $(this).data('player-id');

        if($(this).is(':checked')){
            var playerData = {
                matches: Math.floor(Math.random() * 100),
                win: Math.floor(Math.random() * 100),
                loss: Math.floor(Math.random() * 100)
            };

            var data = {
                labels: ['Matches', 'Win', 'Loss'],
                datasets: [{
                    label: playerId,
                    data: [playerData.matches, playerData.win, playerData.loss],
                    borderWidth: 1
                }]
            };

            if(chart){
                chart.data.datasets.push(data.datasets[0]);
            } else {
                chart = new Chart(ctx, {
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
            }
            chart.update();
        } else {
            var datasetIndex = chart.data.datasets.findIndex(dataset => dataset.label === playerId);
            chart.data.datasets.splice(datasetIndex, 1);
            chart.update();
        }
    });
});
</script>
</body>
</html>