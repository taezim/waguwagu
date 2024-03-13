<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form modelAttribute="updateatbatmodel" method="post">
    <p>선수 식별자: <form:input path="atbatplayerID" value="${atbat.getAtbatplayerID()}" /></p>
	<p>경기 횟수: <form:input path="matches" value="${atbat.getMatches()}" /></p>
	<p>승리 횟수: <form:input path="win" value="${atbat.getWin()}" /></p>
	<p>패배 횟수: <form:input path="loss" value="${atbat.getLoss()}" /></p>
	<p>세이브 횟수: <form:input path="save" value="${atbat.getSave()}" /></p>
	<p>홀드 횟수: <form:input path="hold" value="${atbat.getHold()}" /></p>
	<p>승률: <form:input path="odds" readonly="true" value="${atbat.getOdds()}" /></p>
	<p>이닝 수: <form:input path="innings"  value="${atbat.getInnings()}" /></p>
	<p>피안타 수: <form:input path="hitsAllowed" value="${atbat.getHitsAllowed()}" /></p>
	<p>피홈런 수: <form:input path="homeRunsAllowed" value="${atbat.getHomeRunsAllowed()}" /></p>
	<p>볼넷 수: <form:input path="walks" value="${atbat.getWalks()}" /></p>
	<p>사구 수: <form:input path="hitByPitch" value="${atbat.getHitByPitch()}" /></p>
	<p>삼진 수: <form:input path="strikeouts" value="${atbat.getStrikeouts()}" /></p>
	<p>실점 수: <form:input path="runs" value="${atbat.getRuns()}" /></p>
	<p>자책점 수: <form:input path="earnedRuns" value="${atbat.getEarnedRuns()}" /></p>
	<p>출루 허용률: <form:input path="onBaseAllowed" readonly="true" value="${atbat.getOnBaseAllowed()}" /></p>
    <input type="submit" value="등록" />
</form:form>
</body>
</html>