<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 생략 -->
<div class="row" align="center">
  <c:forEach items="${atbatList}" var="atbatlists">
    <div class="col-md-4">
      <h3>${atbatlists.atbatplayerID}</h3>
      <!-- 선수를 선택하는 체크박스 추가 -->
      <input type="checkbox" class="player-checkbox" data-player-id="${atbatlists.atbatplayerID}">
      <p>${atbatlists.matches}
        <br>${atbatlists.win}
      <p>${atbatlists.loss}
    </div><br>
    <p><a href="<c:url value="/atbatstart/atbat?atbatRequest=${atbatlists.atbatplayerID}"/>"class="btn btn-secondary" role="button">상세정보 &raquo;</a><br>
  </c:forEach>
</div>
<a href="./atbatstart/createatbat">선수 등록하기</a>
<!-- 생략 -->
<canvas id="myChart"></canvas>

<script>
$(document).ready(function(){
  var ctx = document.getElementById('myChart').getContext('2d');
  var chart; // 전역 변수로 차트를 선언합니다.

  $('.player-checkbox').change(function(){
    var playerId = $(this).data('player-id');

    if($(this).is(':checked')){
      // 선수가 선택되면, 해당 선수의 데이터를 가져오는 AJAX 요청을 만들 수 있습니다.
      // 이 예시에서는 임의의 데이터를 사용합니다.
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