function passwordCheck() {
	var password = document.getElementById("r-password").value;
	var confirmPassword = document.getElementById("r-confirm-password").value;
	if (password != confirmPassword) {
		document.getElementById("confirm-password-alert").style.display = "";
		return false;
	}
	document.getElementById("confirm-password-alert").style.display = "none";
}