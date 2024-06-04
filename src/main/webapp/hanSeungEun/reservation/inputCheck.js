/*input이 비어있을 때 알림(예약조회, 예약번호))*/
function inputCheck1(){
		
	if(document.revCheckForm.num.value==""){
		alert("예약번호를 입력해 주세요.");
		document.revCheckForm.num.focus();
		return;
	}
	
	if(document.revCheckForm.name.value==""){
		alert("이름을 입력해 주세요.");
		document.revCheckForm.name.focus();
		return;
	}

	if(document.revCheckForm.phonenum.value==""){
		alert("전화번호를 입력해 주세요.");
		document.revCheckForm.phonenum.focus();
		return;
	}
	if(document.revCheckForm.pwd.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.revCheckForm.pwd.focus();
		return;
	}
document.revCheckForm.submit();
	
}


function inputCheck2(){
		
	if(document.findRevFrom.name.value==""){
		alert("이름을 입력해 주세요.");
		document.findRevFrom.name.focus();
		return;
	}

	if(document.findRevFrom.phonenum.value==""){
		alert("전화번호를 입력해 주세요.");
		document.findRevFrom.phonenum.focus();
		return;
	}
	if(document.findRevFrom.pwd.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.findRevFrom.pwd.focus();
		return;
	}
document.findRevFrom.submit();
	
}
