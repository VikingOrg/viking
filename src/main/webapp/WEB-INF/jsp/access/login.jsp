<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Login Page. Any unauthorized access will be prostecuted to the fullest extend of the law.">
    <meta name="author" content="Danil Ozherelyev">
    
	<link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">
	
	<title>Регистрация в системе.</title>
	
    <!-- Bootstrap core CSS -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->    
</head>

	<body>
	
    <div class="container">

      <form class="form-signin" action="j_spring_security_check" method="post">
        <h2 class="form-signin-heading">Зарегистрируйтесь пожалуйста</h2>
        
        <input id="j_username" name="j_username" type="text" class="form-control" placeholder="Логин" required autofocus>
        <input id="j_password" name="j_password" type="password" class="form-control" placeholder="Пароль" required>
        
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Запомнить логин.
        </label>
        
        <button class="btn btn-lg btn-primary btn-block" type="submit">Войти</button>
      </form>
		
	  <p class="message">${message}</p>
	  
    </div> <!-- /container -->	
		
		
		
    <!-- Bootstrap core JavaScript
    ================================================== -->	
		
	</body>
</html>