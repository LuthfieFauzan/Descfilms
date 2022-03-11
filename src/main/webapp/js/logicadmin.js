function logs(){
	var user = document.getElementById("inputUsername").value;
	localStorage.setItem("admin", user);
	var pass = document.getElementById("inputPassword").value;
	if(user=="admin"&& pass=="admin") {
		document.getElementById("logen").style.display ="none";
	    document.getElementById("table1").style.display ="unset";
	    document.getElementById("table2").style.display ="unset";
	    document.getElementById("sectionnav").style.display ="unset";
	    document.getElementById("logoutnav").style.display ="unset";
		localStorage.setItem("admin", user);
	} else {
		alert('Invalid login credentials!');
	}
}

function logins(){
	document.getElementById("logen").style.display ="none";
	    document.getElementById("table1").style.display ="unset";
	    document.getElementById("table2").style.display ="unset";
	    document.getElementById("sectionnav").style.display ="unset";
	    document.getElementById("logoutnav").style.display ="unset";
		localStorage.setItem("admin", user);
}

function loads(){
	var test=localStorage.getItem("admin");
	if(test!="") {
		document.getElementById("logen").style.display ="none";
	    document.getElementById("table1").style.display ="unset";
		document.getElementById("table2").style.display ="unset";
	    document.getElementById("sectionnav").style.display ="unset";
	    document.getElementById("logoutnav").style.display ="unset";
	}
}

function logot(){
	localStorage.setItem("admin", "");
}

function edit() {
	document.getElementById("addBtn").style.display ="none";
	document.getElementById("updateBtn").style.display ="unset";
	document.getElementById("removeBtn").style.display ="unset";
	document.getElementById("table1").style.display ="none";
	document.getElementById("forms").style.display ="unset";
	document.getElementById("table2").style.display ="none";
	document.getElementById("sectionnav").style.display ="none";
}

function adds(){
	document.getElementById("addBtn").style.display ="unset";
	document.getElementById("updateBtn").style.display ="none";
	document.getElementById("removeBtn").style.display ="none";
	document.getElementById("table1").style.display ="none";
	document.getElementById("forms").style.display ="unset";
	document.getElementById("table2").style.display ="none";
	document.getElementById("sectionnav").style.display ="none";
	document.getElementById("sectionnav").style.display ="none";
}

function cancels(){
	document.getElementById("table1").style.display ="unset";
	document.getElementById("forms").style.display ="none";
	document.getElementById("table2").style.display ="unset";
	document.getElementById("sectionnav").style.display ="unset";
}

function clearForm() {
	document.getElementById("tesform").reset();
}