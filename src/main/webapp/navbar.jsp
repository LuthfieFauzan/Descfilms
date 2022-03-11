<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: darkred" id="mainNav">
	<div class="container">
		<a class="navbar-brand js-scroll-trigger" href="index.jsp" style="color: white;">Descfilm</a>
        	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation" style="background-color: firebrick; color: white;">
            	<span class="navbar-toggler-icon my-toggler"></span>
			</button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
                	<li class="nav-item dropdown">
                    	<a href="#" class="nav-link dropdown-toggle" id="genre" data-toggle="dropdown">Choose Genre...<b class="caret"></b></a>
                        <ul class="dropdown-menu multi-column columns-3" style="background: darkred">
							<li>
								<div>
									<ul style="list-style-type: none; padding: 0px;">
		                            	<li class="nav-item">
		                                	<a class="nav-link js-scroll-trigger" onclick="comedy()" href="index.jsp#comedy">Comedy</a>
		                                </li>
		                                <li class="nav-item">
		                                	<a class="nav-link js-scroll-trigger" onclick="adventure()" href="index.jsp#adventure">Adventure</a>
										</li>
				                        <li class="nav-item">
				                        	<a class="nav-link js-scroll-trigger" onclick="action()" href="index.jsp#action">Action</a>
				                        </li>
		                            </ul>
								</div>
							</li>
						</ul>
	    			</li>
		    	<li class="nav-item">
		        	<a class="nav-link" href="about.jsp">About Us</a>
		        </li>
		        <li class="nav-item dropdown">
		        	<%
		        	try{
		        		if(session.getAttribute("user")==null||session.getAttribute("user")==""){
		        			%>
		        			<a class="nav-link" href="login.jsp">Login</a>
		        			<%
		        		}else{
		        			%>
		        			<a href="#" class="nav-link " id="genre" data-toggle="dropdown"><%out.print(session.getAttribute("user"));%></a>
                        <ul class="dropdown-menu multi-column columns-3" style="background: darkred">
							<li>
								<div>
									<ul style="list-style-type: none; padding: 0px;">
		                            	<li class="nav-item">
		                                	<a class="nav-link" href="">My profile</a>
		                                </li>	                               
				                        <li class="nav-item">
				                        	<a class="nav-link" href="logout.jsp">Logout</a>
				                        </li>
		                            </ul>
								</div>
							</li>
						</ul>
		        			
		        			<%
		        		}
		        	}catch(Exception e){		        		
		        	}
		        	%>
		        </li>
			</ul>
		</div>
	</div>
</nav>