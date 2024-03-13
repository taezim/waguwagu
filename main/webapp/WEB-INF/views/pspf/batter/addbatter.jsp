<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form:form modelAttribute="battermodel" method="post">
    <table>
        <tr>
            <td>선수 식별자:</td>
            <td><form:input path="batterplayerID" value="0" /></td>
        </tr>
        <tr>
            <td>경기 횟수:</td>
            <td><form:input path="matches" value="0" /></td>
        </tr>
    </table>
    <table>
        <tr>
            <td>카테고리</td>
            <td>
                <select name="category" id="category">
                    <option value="batter">타자</option>
                </select>
            </td>
        </tr>
        <tr>
    <td>타석 수:</td>
    <td><form:input path="atBats" id="atBats" value="0" oninput="calculateStats()" /></td>
</tr>
<tr>
    <td>타수 수:</td>
    <td><form:input path="strokes" id="strokes" value="0" oninput="calculateStats()" /></td>
</tr>
<tr>
    <td>득점 수:</td>
    <td><form:input path="score" id="score" value="0" oninput="calculateStats()" /></td>
</tr>
<tr>
    <td>안타 수:</td>
    <td><form:input path="hits" id="hits" value="0" oninput="calculateStats()" /></td>
</tr>
<tr>
    <td>2루타 수:</td>
    <td><form:input path="doubles" id="doubles" value="0" oninput="calculateStats()" /></td>
</tr>
<tr>
    <td>3루타 수:</td>
    <td><form:input path="triples" id="triples" value="0" oninput="calculateStats()" /></td>
</tr>
<tr>
    <td>홈런 수:</td>
    <td><form:input path="homeRuns" id="homeRuns" value="0" oninput="calculateStats()" /></td>
</tr>
<tr>
    <td>타점 수:</td>
    <td><form:input path="rbis" id="rbis" value="0" oninput="calculateStats()" /></td>
</tr>
<tr>
    <td>도루 수:</td>
    <td><form:input path="stolenBases" id="stolenBases" value="0" oninput="calculateStats()" /></td>
</tr>
<tr>
    <td>병살타:</td>
    <td><form:input path="doublePlays" id="doublePlays" value="0" oninput="calculateStats()" /></td>
</tr>
<tr>
    <td>타율:</td>
    <td><form:input path="battingAverage" id="battingAverage" readonly="true" value="0" /></td>
</tr>
<tr>
    <td>장타율:</td>
    <td><form:input path="sluggingPercentage" id="sluggingPercentage" readonly="true" value="0" /></td>
</tr>
<tr>
    <td>출루율:</td>
    <td><form:input path="onBasePercentage" id="onBasePercentage" readonly="true" value="0" /></td>
</tr>
    </table>
    <input type="submit" value="등록" />
</form:form>

<script>
    function calculateStats() {
        var atBats = parseFloat(document.getElementById('atBats').value);
        var hits = parseFloat(document.getElementById('hits').value);
        var doubles = parseFloat(document.getElementById('doubles').value);
        var triples = parseFloat(document.getElementById('triples').value);
        var homeRuns = parseFloat(document.getElementById('homeRuns').value);

        if (!isNaN(atBats) && !isNaN(hits) && !isNaN(doubles) && !isNaN(triples) && !isNaN(homeRuns)) {
            // 타율 계산
            var battingAverage = hits / atBats;
            if (!isNaN(battingAverage)) {
                document.getElementById('battingAverage').value = battingAverage.toFixed(3);
            }

            // 장타율 계산
            var sluggingPercentage = (hits + (2 * doubles) + (3 * triples) + (4 * homeRuns)) / atBats;
            if (!isNaN(sluggingPercentage)) {
                document.getElementById('sluggingPercentage').value = sluggingPercentage.toFixed(3);
            }

            // 출루율 계산
            var onBasePercentage = hits / atBats; 
            if (!isNaN(onBasePercentage)) {
                document.getElementById('onBasePercentage').value = onBasePercentage.toFixed(3);
            }
        }
    }
</script>


</body>
</html>
