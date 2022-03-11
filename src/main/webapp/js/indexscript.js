var a,b,c,d,e,f,g;

movieRef.once('value', function(parentSnapshot) {
	parentSnapshot.forEach(function(childSnapshot) {
		var childKey = childSnapshot.key;
	    var childData = childSnapshot.val();
	    a = childData.title;
	    b = childData.genre;
	    c = childData.language;
	    d = childData.runtime;
	    e = childData.distributor;
	    f = childData.year;
	    g = childData.rating;
	    var genres;
	    switch (b) {
			case "Comedy" : genres = "comedi";
	        break;
	        case "Adventure" : genres = "aventure";
	        break;
	        case "Action" : genres = "acion";
	        break;
	        default:
				var tets = document.getElementById("tests");
				tets.insertAdjacentHTML("beforeend",
					'<li class="nav-item">'+
						'<a class="nav-link js-scroll-trigger" href="index.jsp#'+b+'">'+b+'</a>'+
	                '</li>'		
				);
				var tests =document.getElementById("page-top");
				tests.insertAdjacentHTML("beforeend",
					'<section  id="'+b+'">'+
						'<div class="container">'+
		            		'<div class="row">'+
		                		'<div class="col-md-8">'+
									'<h2 class="section-heading" style="color: white">'+b+'</h2>'+
		                		'</div>'+
		            		'</div>'+
		            		'<div class="row" id="'+b+'s"></div>'+
						'</div>'+
					'</section>'
				);
				genres=b+"s";
	        break;
		};
		
		var sesion = document.getElementById(genres);
		sesion.insertAdjacentHTML("beforeend",
			'<div class="col-md-4 mb-4 box-item" >'+
				'<a class="box-link" data-toggle="modal" href="#portfolio1Modal'+childKey+'">'+
	            	'<div class="box-hover">'+
	                	'<div class="portfolio-hover-content">'+
	                    	'<i class="fa fa-plus fa-3x"></i>'+
	                    '</div>'+
	                '</div>'+
	                '<img class="img-fluid" src="https://firebasestorage.googleapis.com/v0/b/realtime-db-web-f1fff.appspot.com/o/img%2F' + childData.image + '?alt=media" width="640px" height="426px">'+
	            '</a>'+
	            '<div class="portfolio-caption">'+
	            	'<h4 style="text-align: center; color: white">'+a+'</h4>'+
	                '<p style="text-align: center; color: white">'+ f +'</p>'+
	            '</div>'+
	        '</div>'
		);

		var hoper = document.getElementById("page-top");
		hoper.insertAdjacentHTML("beforeend",
	    	'<div class="modal fade" id="portfolio1Modal'+childKey+'" tabindex="-1" role="dialog" aria-hidden="true">'+
	        	'<div class="modal-dialog modal-dialog-centered" role="document">'+
	            	'<div class="modal-content">'+
	                	'<div class="modal-header">'+
	                    	'<h3 class="modal-title text-uppercase">'+a+'</h3>'+
	                        '<button type="button" class="close" data-dismiss="modal" aria-label="Close">'+
	                        	'<span aria-hidden="true">&times;</span>'+
	                        '</button>'+
						'</div>'+
						'<div class="modal-body">'+
	                    	'<div class="video-container">'+
	                        	'<iframe width="853" height="480" src="'+childData.videourl+'" frameborder="0" donotallowfullscreen></iframe>'+
	                        '</div>'+
	                        '<p style="text-align: justify;">'+childData.synopsisshort+'</p>'+
	                        '<div class="text-center">'+
	                        	'<a href="detail.jsp">'+
	                            	'<button class="btn btn-dark" style="background-color: maroon;" type="button" onclick="sends('+childKey+')">'+
	                                	'Learn more'+
	                                '</button>'+
	                            '</a>'+
	                        '</div>'+
						'</div>'+
					'</div>'+
		        '</div>'+
			'</div>'
		);
	});
	
	var hoper = document.getElementById("page-top");
	hoper.insertAdjacentHTML("beforeend",
		'<footer class="py-5 text-center text-small" style="background-color: firebrick" onmouseover="other()">'+
		    '<div class="container">'+
		        '<p style="color: white;">Copyright &copy; Descfilm 2020</p>'+
		        '<ul class="list-inline">'+
		            '<li class="list-inline-item">'+
		                '<a href="#" style="color: white">Privacy Policy</a>'+
		            '</li>'+
		            '<li class="list-inline-item">'+
		                '<a href="#" style="color: white">Terms of Use</a>'+
		            '</li>'+
		        '</ul>'+
		    '</div>'+
		'</footer>'
	)	
});


function sends(a) {
	localStorage.setItem("id",a);
}

function searchs() {
	var a = document.getElementById("search").value;
	var result = new RegExp(a,"i");
	if(a=="") {
		document.getElementById("sears").style.display = "none";
	    document.getElementById("comedy").style.display = "unset";
	    document.getElementById("adventure").style.display = "unset";
	    document.getElementById("action").style.display = "unset";
	} else {
		document.getElementById("comedy").style.display = "none";
        document.getElementById("adventure").style.display = "none";
        document.getElementById("action").style.display = "none"
        document.getElementById("sears").style.display = "unset";
	}
	var sesion = document.getElementById("searsi");
    sesion.innerHTML = "";
    movieRef.once('value', function(parentSnapshot) {
		parentSnapshot.forEach(function(childSnapshot) {
    		var childKey = childSnapshot.key;
			var childData = childSnapshot.val();
    	    a = childData.title;
    	    b = childData.genre;
    	    c = childData.language;
    	    d = childData.runtime;
    	    e = childData.distributor;
    	    f = childData.year;
    	    g = childData.rating;
    	    if((childData.title).match(result)||(childData.year).match(result)||(childData.genre).match(result)||(childData.language).match(result)) {
				sesion.insertAdjacentHTML("beforeend",
					'<div class="col-md-4 mb-4 box-item" >'+
						'<a class="box-link" data-toggle="modal" href="#portfolio1Modal'+childKey+'">'+
    	                	'<div class="box-hover">'+
    	                    	'<div class="portfolio-hover-content">'+
    	                        	'<i class="fa fa-plus fa-3x"></i>'+
								'</div>'+
							'</div>'+
							'<img class="img-fluid" src="https://firebasestorage.googleapis.com/v0/b/realtime-db-web-f1fff.appspot.com/o/img%2F' + childData.image + '?alt=media" width="640px" height="426px">'+
						'</a>'+
    	                '<div class="portfolio-caption">'+
    	                	'<h4 style="text-align: center; color: white">'+a+'</h4>'+
    	                    '<p style="text-align: center; color: white">'+ f +'</p>'+
    	                '</div>'+
					'</div>'
				);
			};
		});
	});
}

function other(){
    document.getElementById("genre").innerHTML = "Choose Genre...";
}
function comedy(){
    document.getElementById("genre").innerHTML = "Comedy";
}
function adventure(){
    document.getElementById("genre").innerHTML = "Adventure";
}
function action(){
    document.getElementById("genre").innerHTML = "Action";
}