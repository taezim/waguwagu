<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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




 <form:form modelAttribute="atbatmodel">
	<table>
	 	<tr>
            <td>선수 식별자:</td>
            <td><form:input path="atbatplayerID" value="0" /></td>
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
                    <option value="batter">타수</option>
                </select>
            </td>
        </tr>
       
        <tr>
            <td>승리 횟수:</td>
            <td><form:input path="win" value="0" /></td>
        </tr>
        <tr>
            <td>패배 횟수:</td>
            <td><form:input path="loss" value="0" /></td>
        </tr>
        <tr>
            <td>세이브 횟수:</td>
            <td><form:input path="save" value="0" /></td>
        </tr>
        <tr>
            <td>홀드 횟수:</td>
            <td><form:input path="hold" value="0" /></td>
        </tr>
        <tr>
            <td>승률:</td>
            <td><form:input path="odds" readonly="true" value="0" /></td>
        </tr>
        <tr>
            <td>이닝 수:</td>
            <td><form:input path="innings" value="0" /></td>
        </tr>
        <tr>
            <td>피안타 수:</td>
            <td><form:input path="hitsAllowed" value="0" /></td>
        </tr>
        <tr>
            <td>피홈런 수:</td>
            <td><form:input path="homeRunsAllowed" value="0" /></td>
        </tr>
        <tr>
            <td>볼넷 수:</td>
            <td><form:input path="walks" value="0" /></td>
        </tr>
        <tr>
            <td>사구 수:</td>
            <td><form:input path="hitByPitch" value="0" /></td>
        </tr>
        <tr>
            <td>삼진 수:</td>
            <td><form:input path="strikeouts" value="0" /></td>
        </tr>
        <tr>
            <td>실점 수:</td>
            <td><form:input path="runs" value="0" /></td>
        </tr>
        <tr>
            <td>자책점 수:</td>
            <td><form:input path="earnedRuns" value="0" /></td>
        </tr>
        <tr>
            <td>출루 허용률:</td>
            <td><form:input path="onBaseAllowed" readonly="true" value="0" /></td>
        </tr>
    </table>
    <input type="submit" value="등록" onclick="calculateStats()" />
</form:form>







<script>
    function calculateStats() {
        var win = parseFloat(document.getElementById('win').value);
        var loss = parseFloat(document.getElementById('loss').value);
        var hitsAllowed = parseFloat(document.getElementById('hitsAllowed').value);
        var walks = parseFloat(document.getElementById('walks').value);
        var hitByPitch = parseFloat(document.getElementById('hitByPitch').value);
        var innings = parseFloat(document.getElementById('innings').value);

        if (!isNaN(win) && !isNaN(loss) && !isNaN(hitsAllowed) && !isNaN(walks) && !isNaN(hitByPitch) && !isNaN(innings)) {
            // 승률 계산
            var odds = win / (win + loss);
            if (!isNaN(odds)) {
                document.getElementById('odds').value = odds.toFixed(3);
            }
            
            // 출루 허용률 계산
            var onBaseAllowed = (hitsAllowed + walks + hitByPitch) / innings;
            if (!isNaN(onBaseAllowed)) {
                document.getElementById('onBaseAllowed').value = onBaseAllowed.toFixed(3);
            }
        }
    }
</script>


</body>
</html>