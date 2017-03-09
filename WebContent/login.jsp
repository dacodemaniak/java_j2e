<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Réservations - Identification</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	</head>
	<body>
		<div id="page" class="container">
			<header>
				<h1>Réservations - Identification</h1>
			</header>
			
			<form name="formLogin" id="formLogin" method="post" action="login">
				<fieldset>
					<div class="form-group">
						<label for="login">Identifiant : </label>
						<input type="text" name="login" id="login" class="form-control" placeholder="Votre identifiant">
					</div>
					<div class="form-group">
						<label for="pass">Mot de passe :</label>
						<input type="password" name="pass" id="pass" class="form-control">
					</div>
				</fieldset>
				<div class="form-group">
					<button type="submit" name="sign-in" id="sign-in" class="btn btn-success">Login</button>
				</div>
			</form>
		</div>
	</body>
</html>