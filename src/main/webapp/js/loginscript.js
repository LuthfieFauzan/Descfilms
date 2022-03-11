function regis(){
	document.getElementById("login").style.display ="none";
	document.getElementById("regist").style.display ="block";
	document.getElementById("title").innerText = "Register";
	localStorage.setItem("user", "1");
}
function cancel(){
	document.getElementById("login").style.display ="block";
	document.getElementById("regist").style.display ="none";
	document.getElementById("title").innerText = "Login";
	localStorage.setItem("user", "0");
}
var a = localStorage.getItem("user");
if (a=="0"){
	document.getElementById("login").style.display ="none";
	document.getElementById("regist").style.display ="block";
	document.getElementById("title").innerText = "Register";
}


