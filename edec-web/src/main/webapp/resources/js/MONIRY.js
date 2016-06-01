$(document).ready(function() {
    $.ajax({
    	type:'GET',
    	dataType: 'json',
        url: "http://localhost:8181/edec/top5society"
    }).then(function(data) {
       appendResults(data);
    });
});

function appendResults(data)
{
	var url = $('#society-append').data('url');
	for (var i = 0; i <= data.length - 1; i++) {
		var text = '<div class="single-wid-product">'+
			'<a href="'+url+data[i].name+'"/>"><img src="'+data[i].pictureURL+'" alt="" class="product-thumb"></a>'+
	        '<h2><a href="<c:url value="/products/'+data[i].name+'"/>">'+data[i].name+'</a></h2>'+
	        '<div class="product-wid-rating">'+
	            '<p><b>E:'+data[i].societyScore+'</b></p>'+
	        '</div>'+
	    '</div>';
	    $('#society-append').append(text);
	}
}