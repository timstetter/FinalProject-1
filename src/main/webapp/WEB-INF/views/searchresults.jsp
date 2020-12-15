<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crypt/Results</title>
<style type="text/css">
td {
	padding-right: 20px;
	padding-left: 10px;
}
.tagstyle {
	
	background: #d3d3d3 ;
	padding: 2px;
	text-align: center;
	border-radius: 5px;
	color: black;
	font-weight: bold;
	line-height: 20px;
}

.buttonstyle {
	display: block;
	background: #2a9fd6;
	padding: 15px;
	text-align: center;
	border-radius: 10px;
	color: white;
	font-weight: bold;
	line-height: 50px;
}
.footer{ 
       position: fixed;     
       text-align: left;    
       bottom: 0px; 
       width: 100%;
} 
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/cyborg/bootstrap.min.css"
	integrity="sha384-nEnU7Ae+3lD52AK+RGNzgieBWMnEfgTbRHIwEvp1XXPdqdO6uLTd/NwXbzboqjc2"
	crossorigin="anonymous">
</head>
<body>
	<!-- Logo -->

	<a href="/"><img src="https://drive.google.com/uc?id=1fPjNndqQhYAMUy6HG5YUGc0MUmmhZncH" style=" padding-left: 35%"/></a>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="/" style="font-size: 16px;">Home</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item" style="font-size: 16px;"><a class="nav-link" href="/login">Login		
				</a></li>
				<li class="nav-item" style="font-size: 16px;"><a class="nav-link" href="/wishlist">Wishlist</a>
				</li>

				<li class="nav-item" style="font-size: 16px;"><a class="nav-link"
					href="/recommendations">Recommendations</a></li>
				<li class="nav-item" style="font-size: 16px;"><a class="nav-link" href="/about">The
						Crypt Keepers</a></li>
      		<li class="nav-item" style="font-size: 16px;"><a class="nav-link" href="/popular2019">Most
						popular of 2019</a></li>
			</ul>
				<span class="navbar-brand">${ user.username }</span>
    		<c:if test = "${user.username != null}">
    		<a class="btn navbar-btn btn-default navbar-right pull-right" role="button" href="/logout">Logout</a> 
			</c:if>

			<!-- Search function -->

			<form class="form-inline my-2 my-lg-0" method="post"
				action="/searchresults">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					name="search">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
	
	<div class="container">
	<font size="5">
		<div class="container">
			<div class="row">
				<div class="col-lg-4" style="color: #2a9fd6;"></div>
				<div class="col-lg-4" style="color: #2a9fd6;"></div>
				<div class="col-lg-1" style="color: #2a9fd6;">Rating:</div>
				<div class="col-lg-3" style="color: #2a9fd6;">Genres:</div>
			</div>
		</div>
	<c:forEach var="game" items="${ games }">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 padded"><a href="/details/${ game.getId()}"><img src="${ game.getBackground_image() }"	alt="${game.getName()}" style="width: 100%; height: auto; border: 5px solid #59A7FF"></a></div>
				<div class="col-lg-4 padded"><a class="buttonstyle" href="/details/${ game.getId()}" data-toggle="tooltip" data-placement="right" title="View Game Details">${ game.getName() }</a></div>
				<div class="col-lg-1" style="color: #2a9fd6;">${game.getRating()}/5</div>
				<div class="col-lg-3"><c:forEach var="genre" items="${game.getGenres() }"><font size="5"><a class="tagstyle" href="/searchresults/${genre.getId() }" data-toggle="tooltip" data-placement="right" title="Search for ${genre.getName() } games">${genre.getName() }</a></font> </c:forEach></div>
			</div>
		</div>
	</c:forEach>
	</font>	
		<div class="footer">Thanks to <a href= "https://rawg.io" data-toggle="tooltip" data-placement="top" title="Leave Crypt and go to RAWG website" target="_blank">RAWG.io</a> for the data</div>
</body>
</html>