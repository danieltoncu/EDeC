function searchValidate() {

	var searchInput = document.getElementById("search-0D1").value;

	if (searchInput == null || searchInput == "") {
		return false;
	}
}

function ingredientSearchValidate() {

	var ingredientSearchInput = document.getElementById("search-0D2").value;
	var ingredientLike = document.getElementById("radio-0DL").checked;
	var ingredientDislike = document.getElementById("radio-0DD").checked;

	if (ingredientSearchInput == null || ingredientSearchInput == "") {
		return false;
	}

	if (!(ingredientLike || ingredientDislike)) {
		return false;
	}
}