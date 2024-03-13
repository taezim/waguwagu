<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    
/* UI Object */
.tbl_type,.tbl_type th,.tbl_type td{border:0}
.tbl_type a{color:#383838;text-decoration:none}
.tbl_type{width:100%;border-bottom:1px solid #999;color:#666;font-size:12px;table-layout:fixed}
.tbl_type caption,.tbl_type .frm label{display:none}
.tbl_type th{padding:5px 0 4px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:18px;vertical-align:top}
.tbl_type td{padding:8px 0 5px;border-bottom:solid 1px #d2d2d2;text-align:center}
.tbl_type .frm{padding:0;text-align:center}
.tbl_type .frm input{margin:0}
.tbl_type .num,.tbl_type .date,.tbl_type .hit{padding:0;font-family:Tahoma;font-size:11px;line-height:normal}
.tbl_type .title{text-align:left}
.tbl_type .title .pic,.tbl_type .title .new{margin:0 0 2px;vertical-align:middle}
.tbl_type tr.reply .title a{padding-left:12px;background:url(img/ic_reply.gif) 0 1px no-repeat}
.tbl_type tr.reply td a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
/* //UI Object */
.divbox
{
	/* border : 1px solid red; */
	display : flex;
	justify-content : right;
}

</style>
<body>
	<!-- UI Object -->
<table cellspacing="0" border="1" summary="게시판의 글제목 리스트" class="tbl_type">
    <caption>게시판 리스트</caption>
    <colgroup>
    <col width="30"><col width="80"><col>
    <col width="115"><col width="85"><col width="60">
    </colgroup>
    <thead>
    <tr>
    <th scope="col">&nbsp;</th>
    <th scope="col">No</th>
    <th scope="col">답변내용</th>
    <th scope="col">답변자 아이디</th>
    <th scope="col">질문번호</th>
    <th scope="col">답변날짜</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    <c:forEach items="${answerLists}" var="answer123">
    <tr>
    <td class="frm"><input type="checkbox" name="" id="chk_sel10" value=""><label for="chk_sel10">선택</label></td>
    <td class="num">${answer123.answernumber}</td>
    <td class="title"><a href="./productanswers/productanswer?an=${answer123.productid}">${answer123.answercontent}</a></td>
    <td> <a href="#">${answer123.respondentid}</a></td>
    <td class="hit">${answer123.questionnumber}</td>
    <td class="date">${answer123.replaydate}</td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
    <br>
    <div class="divbox">
    <a href="<c:url value="/productanswers/productadd" />" class="btn btn-outline-secondary">글쓰기</a>
    <!-- //UI Object -->
   	</div>
</body>
</html>