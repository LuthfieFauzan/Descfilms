var validationApp = angular.module('validationApp', []);
validationApp.controller('mainController', function ($scope) {
    $scope.submitForm = function (isValid) {
        if (isValid) {
        	const database = firebase.database();
	        const movieRef = database.ref('/movie');
	        
        	const movieid = document.getElementById('movieid');
	        const title = document.getElementById('title');
	        const genre = document.getElementById('genre');
	        const language = document.getElementById('language');
	        const runtime = document.getElementById('runtime');
	        const producer = document.getElementById('producer');
	        const director = document.getElementById('director');
	        const distributor = document.getElementById('distributor');
	        const year = document.getElementById('year');
	        const rating = document.getElementById('rating');
	        const casts = document.getElementById('casts');
	        const synopsisshort = document.getElementById('synopsisshort');
	        const synopsisline1 = document.getElementById('synopsisline1');
	        const synopsisline2 = document.getElementById('synopsisline2');
	        const videourl = document.getElementById('videourl');
	        
	        const addBtn = document.getElementById('addBtn');
			
	        addBtn.addEventListener('click', e => {
	        	e.preventDefault();
				const file = document.querySelector('input[type="file"]').files[0];
		        var storage = firebase.storage();
				var pathReference = storage.ref('img/');
		        var metadata = {
					contentType: 'image/jpeg',
				};
				var uploadTask = pathReference.child(file.name).put(file, metadata);
		        uploadTask.then(snapshot => snapshot.ref.getDownloadURL()).then((url) => {
					console.log(url);
					document.querySelector('input[type="file"]').src = url;
				}).catch(console.error);
		        var image = file.name;
				var confirmAdd = confirm('Proceed to add a new movie?');
		        if (confirmAdd == true) {
					if (movieid.value!="" && title.value!="" && genre.value!="" 
						&& language.value!="" && runtime.value!="" && producer.value!="" 
		        		&& director.value!="" && distributor.value!="" && year.value!="" 
		        		&& rating.value!="" && casts.value!="" && synopsisshort.value!="" 
		        		&& synopsisline1.value!="" && videourl.value!="") {
							movieRef.child(movieid.value).set({
							title: title.value,
				            genre: genre.value,
				            language: language.value,
				            runtime: runtime.value,
				            producer: producer.value,
				            director: director.value,
				            distributor: distributor.value,
				            year: year.value,
				            rating: rating.value,
				            casts: casts.value,
				            synopsisshort: synopsisshort.value,
				            synopsisline1: synopsisline1.value,
				            synopsisline2: synopsisline2.value,
				            videourl: videourl.value,
							image: image
						});
				        alert('A new movie has been added successfully!');
				        reload_page();
					} else {
						alert('Please input all required fields correctly before continue!');
					}
				} else {}
	        });
			function reload_page() {
	      		window.location.reload();
	      	}
        }
    };
});