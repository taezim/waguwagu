
function deleteConfirm(id){
	if(confirm("삭제합니다!!") == true) location.href="./delete?id="+id;
	else return;
}

function createMember(action){
	document.createMember.action = action;
	document.createMember.submit();
	alert("회원가입이 되었습니다!");
}