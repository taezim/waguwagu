<<<<<<< HEAD


function deleteConfirm(id){
	if(confirm("삭제합니다!!") == true) location.href="./delete?id="+id;
	else return;
}

function createMember(action){
	document.createMember.action = action;
	document.createMember.submit();
	alert("회원가입이 되었습니다!");
}

=======
>>>>>>> ad2e2c5c3754155773093c6487dd25d17cd83483
/**
 * 
 */

 function addToCart(action)
{
	console.log("dsa");
	 document.addForm.action = action;
	 document.addForm.submit();
	 alert("도서가 장바구니에 추가되었습니다");
}

function removeFromCart(action)
{
	alert("ttt");
	document.removeForm.action = action;
	document.removeForm.submit();
	setTimeout(function () {window.location.reload();}, 500);
}

function clearCart()
{
	alert("dsa");
	document.clearForm.submit();
	setTimeout(function () {window.location.reload();}, 500);
}

function deleteConfirm(number)
{
	if(confirm("삭제합니다!!")==true) location.href = "./delete?number=" +number;
	else return;	
<<<<<<< HEAD
}
=======
}
>>>>>>> ad2e2c5c3754155773093c6487dd25d17cd83483
