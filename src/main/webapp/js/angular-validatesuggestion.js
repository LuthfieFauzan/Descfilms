var validationApp = angular.module('validationApp', []);
validationApp.controller('mainController', function ($scope) {
    $scope.submitForm = function (isValid) {
        if (isValid) {
        	const database = firebase.database();
	        const messageRef = database.ref('/message');

	        const name = document.getElementById('name');
			const email = document.getElementById('email');
	        const message = document.getElementById('message');

	       	const submitBtn = document.getElementById('submitBtn');

	        submitBtn.addEventListener('click', e => {
	        	e.preventDefault();
				const messageid = messageRef.push().key;
	        	messageRef.child(messageid).set({
		        	name: name.value, email: email.value, message: message.value
				});
		        alert('Thanks for your message on this web site!');
		        reload_page();
	        });

	        function reload_page() {
      			window.location.reload();
      		}
        } else {
			alert('Please input all required fields correctly before continue!');
		}
    };
});