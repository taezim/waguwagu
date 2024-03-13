<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
  * {
  margin:0;
  padding:0;
  font-family:Verdana,sans-serif;
  box-sizing:border-box;
}
.wrap1
{
 margin: 0 auto; 
 width: 60%;
 /* border: 1px solid red; */
}
body {color:#333;font-size:14px;}
#wrap {width:600px;}
/* table, ul */
table {width:100%;border:0; border-collapse:collapse;}
th,td {padding:8px 0;vertical-align:middle}
th {text-align:left;}
ul, li {margin:0;padding:0;list-style:none;}
/* input */
input[type=text] {display:inline-block;width:100%;height:32px;padding:0 10px;border:1px solid #ccc;font-size:14px;}
textarea {display:inline-block;width:100%;padding:10px;border:1px solid #ccc;font-size:14px;}
input[type=button],input[type=submit], button {border:0;font-size:14px;}
/* button */
.btn-wrap {margin:10px 0 0 0;text-align:right}
.btn {display:inline-block;padding:12px 20px;background-color:#333;color:#fff;text-align:center;line-height:1;}

.result {padding:15px;background-color:#eee;}
.result + .result {border-top:1px solid #ccc;}
.result ul {position:relative;overflow:hidden;}
.result li:nth-child(1),
.result li:nth-child(2) {float:right;color:#999;font-size:12px}
.result li:nth-child(1) {padding-left:8px}
.result li:nth-child(3) {font-weight:bold;}

fieldset {border:1px solid #ccc;padding:16px;}
legend {display:none}
.cont {overflow:hidden;height:27px;}
.commtIptBox {
  display:flex;
  display: -webkit-flex;
  flex-wrap: wrap;
  -webkit-flex-wrap: wrap;
  padding-top:20px;
}
.commtBox {flex:0 0 100%;font-size:12px;padding:10px 8px 0}
.contTxtBox {padding:10px 0 0;}
#btnCommt {display:block;flex:0 0 60px;height:32px;margin-left:8px;background:#666;color:#fff;line-height:1;}
#btnCommtInput {flex:1}
#btnCommtName {flex:0 0 100px;margin-right:8px}
.count {display:inline-block;margin-left:8px;font-style:normal;font-weight:bold;color:blue}
</style>
<body>
	<br><br><br>
  <div class="wrap1">
    <p>QnA 답변 등록 게시판</p>
    
      <div id="wrap">
        <div id="resultWrap"></div>
      
        <fieldset>
          <legend>board</legend>
          <form:form id="frm1" modelAttribute="hospitalcreateanswer" method="post">
            <table>
              <caption></caption>
              <colgroup>
                <col style="width:100px" />
                <col style="" />
              </colgroup>
              <tbody>
                <tr>
                  <th scope="row">답변 번호</th>
                  <td><form:input path="answernumber" id="iptName" /></td>
                </tr>
                <tr>
                  <th scope="row">질문 번호</th>
                  <td><form:input path="questionnumber" id="iptTitle"  /></td>
                </tr>
                <tr>
                  <th scope="row">내용</th>
                  <td><form:input path="answercontent" id="iptCont" cols="20" rows="5"  /></td>
                </tr>
                <tr>
                  <th scope="row">답변자 아이디</th>
                  <td><form:input path="respondentid" id="iptTitle"  /></td>
                </tr><tr>
                  <th scope="row">답변 날짜</th>
                  <td><form:input path="replaydate" id="iptTitle"  /></td>
                </tr>
              </tbody>
            </table>
             <input type="submit" id="btnRegist" class="btn" value="등록하기">
          </form:form>
          <div class="btn-wrap">
           
          </div>
        </fieldset>
      </div>
    </div>
     <script>
      $("#btnRegist").on('click', function() {
  var iptName = $("#iptName").val();
  var iptTitle = $("#iptTitle").val();
  var textArea = $("#iptCont").val();

  var date = new Date();
  var year = date.getFullYear();//2019
  var month = date.getMonth() + 1;//0,1,2,...11 + 1 -> 원래달.
  var day = date.getDate();//17
  var hour = date.getHours();//현재시간
  var min = date.getMinutes();//현재분
  var sec = date.getSeconds();//현재초
  var msec = date.getMilliseconds();//1000분의 1초 단위.
  //현재 시스템 시간.
  var fullDate = year + '-' + month + '-' + day + ' ' + hour + ':' + min + ':' + msec;
  console.log(fullDate);

  if(iptName == "") {
    alert("이름을 입력해주세요");
    $("#iptName").focus();
    return;
  } else if (iptTitle == "") {
    alert("제목을 입력해주세요");
    return;
  } else if (textArea == "") {
    alert("내용을 입력해주세요");
    return;
  } else {//글등록
    console.log("모두 다 입력하셨습니다");
    console.log(iptName,iptTitle,textArea );
    console.log(iptName,iptTitle,textArea );

    var wrap = document.getElementById("resultWrap");//일단 접근변수로 할당해놓고.
    //Element node를 생성. 메모리에 생성.
    var div = document.createElement("div"); //div추가 <div></div>
    var ul = document.createElement("ul");//정보 리스트 ul추가 <ul><li></li><li></li><li></li><li></li></ul>

    for(var i=0; i<4; i++){
      var li = document.createElement("li");//li 추가
      ul.appendChild(li);
    }

    wrap.prepend(div);//이때 우리눈에 보임.
    div.setAttribute('class','result');//
    //div가 element node이기 때문에 .appendChild() 이런 메소스를 쓸 수 있음. domscript.
    div.appendChild(ul);//jQuery의 append와 동일. <div class = 'result'> <ul><li>txt1</li><li></li><li></li><li></li></ul></div>
    var lis = document.getElementsByTagName("li");//배열이 리턴됨.[<li></li>,<li></li>,<li></li>,<li></li>]
    //<div>text</div>
    var txt1 = document.createTextNode(' | '+fullDate);//작성일
    var txt2 = document.createTextNode(iptName);//작성자
    var txt3 = document.createTextNode(iptTitle);//제목
    var txt4 = document.createTextNode(textArea);//내용

    //div 신규 생성.
    var cont = document.createElement("div");

    cont.setAttribute('class','cont');//<div class='cont'></div>
    var contTxtBox = document.createElement("div");
    contTxtBox.setAttribute('class','contTxtBox');//<div class='contTxtBox'></div>
    var appendCommt = document.createElement("div");
    appendCommt.setAttribute('class','commtIptBox');//<div class='commtIptBox'> </div>


    var ipt = document.createElement("input");
    var iptName = document.createElement("input");

    ipt.setAttribute('type','text');//<input type='text' id='btnCommtInput' value='' />
    ipt.setAttribute('id','btnCommtInput');
    ipt.setAttribute('value','');
    iptName.setAttribute('type','text');//<input type='text' id='btnCommtName' value='' />
    iptName.setAttribute('id','btnCommtName');
    iptName.setAttribute('value','');

    var ipBtn = document.createElement("button");//<button id='btnCommt>등록</button>
    var ipBtnTxt = document.createTextNode("등록");
    ipBtn.setAttribute('id','btnCommt');				
    ipBtn.appendChild(ipBtnTxt);
    appendCommt.appendChild(iptName);
    appendCommt.appendChild(ipt);
    appendCommt.appendChild(ipBtn);
    //<em class='count'>
    var count = document.createElement('em');
    count.setAttribute('class','count');

    lis[0].appendChild(txt1);
    lis[1].appendChild(txt2);
    lis[2].appendChild(txt3);
    lis[2].appendChild(count);
    lis[3].appendChild(cont);
    cont.appendChild(contTxtBox);
    contTxtBox.appendChild(txt4);
    cont.appendChild(appendCommt);

    //reset. $("#frm1")[0].reset(); -> dom을 의미. .reset(), .submit() -> form element node에 존재하는 메소드.
    //$("#frm1")[0] = document.getElementById("frm1").reset();
    //reset() -> 폼에 있는 요소들을 초기화.
    $("#frm1")[0].reset();

  }

  //본문클릭시.
  $(".cont").on('click', function(event) {//이벤트 핸들러함수의 첫번째 인자는 이벤트 객체가 들어온다.
    //div의 높이값을 구함. <div class='cont'> .find 하위의 요소 를 찾아서 .innerHeight() , .outerHeight(), Height()
    var contHeight = $(this).find('.contTxtBox').innerHeight() + $(this).find('.commtIptBox').innerHeight();

    //event.target : 이벤트 발생 원천지.  .closest : 현재위치에서 조건을 만족하는 가장 가까운 부모 element
    if(!(event.target).closest('.commtIptBox')) {//못찾았을 경우. if문이 false가 된다는것은 인풋박스를 클릭했을때를 의미함.
      if($(this).height() == 27){//최소줄어들었을때의 높이값.
        $(this).animate({
          minHeight: contHeight + 'px',
        });
      }else {
        $(this).animate({
          minHeight: '27px'
        });
      }
    }				

  });

  //이 변수는 이벤트 핸들러에 존재하는 변수.
  var countNum = 0;

  //코멘트 등록버튼 눌렀을때. 이벤트 핸들러 안에 또다시 내부 이벤트 핸들러가 존재.
  $("#btnCommt").on('click',function() {

    var parentCont = $(this).closest('.cont');//부모선택.
    var commtInput = parentCont.find('#btnCommtInput');
    var commtName = parentCont.find('#btnCommtName');

    var commtIptVal = commtInput.val();//본문.
    var commtIptNmVal = commtName.val();//글쓴이.


    if(commtIptVal == "") {
      alert("댓글을 입력해주세요");
    } else if(commtIptNmVal == "") {
      alert("이름을 입력해주세요");
    } else {

      var commtBox = document.createElement("div");
      commtBox.setAttribute('class','commtBox');

      var txt1 = document.createTextNode(commtIptVal);
      var txt2 = document.createTextNode(commtIptNmVal);

      var date = new Date();
      var year = date.getFullYear();//2019
      var month = date.getMonth() + 1;//0,1,2,...11 + 1 -> 원래달.
      var day = date.getDate();//17
      var hour = date.getHours();//현재시간
      var min = date.getMinutes();//현재분
      var sec = date.getSeconds();//현재초
      var msec = date.getMilliseconds();//1000분의 1초 단위.
      //현재 시스템 시간.
      var fullDate = year + '-' + month + '-' + day + ' ' + hour + ':' + min + ':' + msec;

      //바로 직계부모. this : 등록버튼.
      $(this).parent('.commtIptBox').append(commtBox);
      commtBox.append('[',txt2 ,'] ', txt1, ' | ' + fullDate);//textnode를 마지막 자식으로 덧붙임.

      //count
      countNum++;
      console.log(countNum);
      $(this).closest('.result').find(".count").text('['+countNum+']');//태그안에 존재하는 textnode 덮어쓴다.
      //.html(<span class='red'>글자</span>), .text(<span class='red'>글자</span>)

      var txtHeiPlus = parentCont.innerHeight() + parentCont.find('.commtBox').innerHeight();

      parentCont.animate({							
        minHeight: txtHeiPlus + 'px',
      });
    }
  })
});
/*
글쓰기 버튼
btnRegist 클릭시 이벤트 핸들러 함수 호출

그 이벤트 핸들러 함수에 내부 변수들이 존재.

이벤트 핸들러 함수내부에 돔이 생성.
그리고 그 돔이 내부 변수값을 활용함.

.count라는 태그에 내부변수값 countNum을 넣어서 textnode로 활용하고 있음.
<em class=‘count>countNum</em>
위 돔이 랜더 트리에 존재하는 한 변수가 메모리에서 삭제 되지 않음.
변수를 담고 있는 실행컨텍스트도 파괴되지 못한다.

다음번 글쓰기 버튼 클릭시 다시 이벤트 핸들러는 생성이 되고 -> 새로운 돔이 또 탄생.
<em class=‘count>countNum</em>
그래서 이때도 새로운 실행컨텍스트가 생성이 됨.
*/	

    </script>
</body>
</html>