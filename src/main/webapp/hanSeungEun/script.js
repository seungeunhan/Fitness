
function inputCheck(){
	
	if(document.joinFrm.id.value==""){
		alert("아이디를 입력해 주세요.");
		document.joinFrm.id.focus();
		return;
	}
	if(document.joinFrm.pwd.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.joinFrm.pwd.focus();
		return;
	}

	if(document.joinFrm.name.value==""){
		alert("이름을 입력해 주세요.");
		document.joinFrm.name.focus();
		return;
	}
	if(document.joinFrm.birth.value==""){
		alert("생년월일을 입력해 주세요.");
		document.joinFrm.birth.focus();
		return;
	}
	if(document.joinFrm.email.value==""){
		alert("이메일을 입력해 주세요.");
		document.joinFrm.email.focus();
		return;
	}
    var str=document.joinFrm.email.value;	   
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
	      document.joinFrm.email.focus();
		  return;
    }

	if(document.joinFrm.phone.value==""){
		alert("휴대번호를 입력해 주세요.");
		document.joinFrm.phone.focus();
		return;
	}
document.joinFrm.submit();
	
}

function inputCheck1(){
	
	if(document.findIdFrom.name.value==""){
		alert("이름을 입력해 주세요.");
		document.findIdFrom.name.focus();
		return;
	}
	
	if(document.findIdFrom.email.value==""){
		alert("이메일을 입력해 주세요.");
		document.findIdFrom.email.focus();
		return;
	}
    var str=document.findIdFrom.email.value;	   
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
	      document.findIdFrom.email.focus();
		  return;
    }

document.findIdFrom.submit();
	
}
