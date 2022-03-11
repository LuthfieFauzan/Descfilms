<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="header.jsp"></jsp:include>
        <title>About Us | Descfilm</title>
    </head>
    <body onload="prefent()" id="page-top" style="background-image: url('img/test.jpg');" ng-app="validationApp" ng-controller="mainController">
        <jsp:include page="navbar.jsp"></jsp:include>
        <br/><br/><br/>
        <div class="slideshow-container" id="home">
            <img class="mySlides" src="img/a.jpg" style="width:100%">
            <img class="mySlides" src="img/b.jpg" style="width:100%">
            <img class="mySlides" src="img/c.jpg" style="width:100%">
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
            <div style="text-align:center">
                <span class="dot" onclick="currentSlide(1)"></span> 
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
            </div>
        </div>
        <br/><br/><br/>
        <div class="container">
            <h1 class="text-center" style="color: white;"><b>About Descfilm</b></h1>
            <br/><br/>
            <h5 style="text-align: justify; color: white;">Descfilm is an established website to let you know on movie release informations.</h5>
            <h5 style="text-align: justify; color: white;">More movies will be added, so keep in touch with us!</h5>
            <br/>
            <h6 style="text-align: right; color: white;"><i>Happy watching!</i></h6>
            <br/><br/><br/>
            <div class="site-section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 mb-5">
                            <h2 style="color: white;">Our Base</h2><hr/>
                            <iframe width="100%" height="400px" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?key=YOUR_API_KEY&q=CEP+CCIT+FTUI" donotallowfullscreen></iframe>
                        </div>
                        <div class="col-lg-6">
                            <form name="userForm" id="forms" ng-submit="submitForm(userForm.$valid)" novalidate>
                                <h2 style="color: white;">Leave a Message for Us</h2><hr/>
                                <div class="row">
	                                <div class="col-md-6 form-group" ng-class="{ 'has-error' : userForm.name.$invalid && !userForm.name.$pristine }">
	                                    <label for="name" style="color: white"><b>Name</b></label>
	                                    <input type="text" id="name" name="name" class="form-control" ng-minlength="2" ng-model="user.name" ng-pattern="/[a-zA-ZÀ-ž/.& -]+/" placeholder="*required" required>
	                                    <p ng-show="userForm.name.$invalid && !userForm.name.$pristine" class="help-block" style="color: orange">Your name is required.</p> 
	                                </div>
	                                <div class="col-md-6 form-group" ng-class="{ 'has-error' : userForm.email.$invalid && !userForm.email.$pristine }">
	                                	<label for="email" style="color: white"><b>Email</b></label>
										<input type="email" id="email" name="email" class="form-control" ng-minlength="2" ng-model="user.email" placeholder="*required" required>
	                                    <p ng-show="userForm.email.$invalid && !userForm.email.$pristine" class="help-block" style="color: orange">Your email is required.</p>
	                                </div>
                                </div>
                                <div class="form-group row" ng-class="{ 'has-error' : userForm.message.$invalid && !userForm.message.$pristine }">
                                    <div class="col-md-12">
                                        <label for="message" style="color: white"><b>Your message</b></label>
                                        <textarea type="text" id="message" name="message" class="form-control" ng-minlength="5" ng-model="user.message" ng-pattern="/[a-zA-ZÀ-ž/.& -]+/" placeholder="*required" cols="15" rows="5" required></textarea>
                                        <p ng-show="userForm.message.$invalid && !userForm.message.$pristine" class="help-block" style="color: orange">Your message is required.</p>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6 mr-auto">
                                    	<button id="submitBtn" class="btn btn-block btn-dark rounded-1" style="background-color: orange; color: white;" type="submit" value="Submit my Message" name="submitBtn">Submit my Message</button>  
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <footer class="py-5 text-center text-small" style="background-color: firebrick">
			<div class="container">
				<p style="color: white;">Copyright &copy; Descfilm 2020</p>
				<ul class="list-inline">
					<li class="list-inline-item">
						<a href="#" style="color: white">Privacy Policy</a>
					</li>
					<li class="list-inline-item">
						<a href="#" style="color: white">Terms of Use</a>
		            </li>
		            <li class="list-inline-item">
						<a href="admin.jsp" style="color: firebrick">Login Admin</a>
					</li>
				</ul>
			</div>
		</footer>
        <a id="scroll" style="display: none;"><span></span></a>
        <jsp:include page="scripts.jsp"></jsp:include>
        <script src="js/slideshow.js"></script>
        <script src="js/angular.js"></script>
        <script src="js/angular-validatesuggestion.js"></script>
        <script src="js/prefent.js"></script>
        <script>
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
        </script>
    </body>
</html>