var firebaseConfig = {
	apiKey: "apiKey",
	authDomain: "authDomain",
	databaseURL: "databaseURL",
	projectId: "projectId",
	storageBucket: "storageBucket",
	messagingSenderId: "messagingSenderId",
	appId: "appId",
	measurementId: "measurementId"
};
firebase.initializeApp(firebaseConfig);
firebase.analytics();
          	
const database = firebase.database();
const movieRef = database.ref('/movie');
var test =localStorage.getItem("id");

movieRef.once('value', function(parentSnapshot) {
	parentSnapshot.forEach(function(childSnapshot) {
		var childKey = childSnapshot.key;
		var childData = childSnapshot.val();
	    if(childKey==test) {
			var title = document.getElementById("title");
		    title.innerHTML = childData.title + " | Descfilm"
		    var table = document.getElementById("tabel");
		    table.insertAdjacentHTML("beforeend",
			    '<tr>'+
			    	'<td rowspan="2"><img src="https://firebasestorage.googleapis.com/v0/b/realtime-db-web-f1fff.appspot.com/o/img%2F' + childData.image + '?alt=media" width="125px"></td>'+
			    	'<td class="text-uppercase"><h2>'+childData.title +'</h2></td>'+
				'</tr>'+
			    '<tr>'+
					'<td>'+childData.synopsisshort+'</td>'+
				'</tr>'+
			    '<tr>'+
			    	'<td><h5>Genre</h5></td>'+
			        '<td>'+childData.genre+'</td>'+
				'</tr>'+
			    '<tr>'+
					'<td><h5>Language</h5></td>'+
			        '<td>'+childData.language+'</td>'+
				'</tr>'+
				'<tr>'+
					'<td><h5>Runtime</h5></td>'+
			        '<td>'+childData.runtime+" minutes"+'</td>'+
				'</tr>'+
				'<tr>'+
					'<td><h5>Producer</h5></td>'+
					'<td>'+childData.producer+'</td>'+
			    '</tr>'+
				'<tr>'+
					'<td><h5>Director</h5></td>'+
			        '<td>'+childData.director+'</td>'+
				'</tr>'+
				'<tr>'+
					'<td><h5>Distributor</h5></td>'+
					'<td>'+childData.distributor+'</td>'+
				'</tr>'+
				'<tr>'+
					'<td><h5>Year</h5></td>'+
			        '<td>'+childData.year+'</td>'+
	            '</tr>'+
				'<tr>'+
					'<td><h5>Rating</h5></td>'+
			        '<td>'+childData.rating+'</td>'+
				'</tr>'+
				'<tr>'+
					'<td><h5>Casts</h5></td>'+
					'<td>'+childData.casts+'</td>'+
				'</tr>'
			);
			var yutub = document.getElementById("yutub");
		    yutub.insertAdjacentHTML("beforeend",
				'<iframe src="'+childData.videourl+'" frameborder="0" allowfullscreen></iframe>'
		    );
			var line1 = document.getElementById("line1");
			line1.insertAdjacentHTML("beforeend",childData.synopsisline1);
		    var line2 = document.getElementById("line2");
		    line2.insertAdjacentHTML("beforeend",childData.synopsisline2);
		}
	});
});