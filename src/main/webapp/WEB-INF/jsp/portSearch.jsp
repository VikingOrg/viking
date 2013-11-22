<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Титул</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="resources/css/core.css"/>
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
		   <jsp:include page="common/menu.jsp" />
		   <!-- Begin page content -->
		    <div class="container">
		      <div class="masthead">
		        <div class="container">
		          <h4 class="text-muted page-header">СПИСОК ПОРТОВ</h4>
		        </div>
		      </div>
		    </div>
		    <div class="container">
		      <div class="row">
		        <div class="col-md-4">
		          <h3>Фильтр&nbsp;<i class="fa fa-th-list">&nbsp;&nbsp;</i></h3>
		          <select class="form-control">
		            <option>Россия</option>
		            <option>Украина</option>
		            <option>Латвия</option>
		          </select>
		          <select class="form-control">
		            <option>Северо-Западный</option>
		            <option>Южный</option>
		            <option>Дальневосточный</option>
		          </select>
		          <h3>Поиск &nbsp;&nbsp;<i class="fa fa-search"></i></h3>
		          <input type="text" class="form-control">
		        </div>
		        <div class="col-md-8">
		          <div class="container-fluid">
		            <ul class="nav nav-tabs">
		              <li class="active">
		                <a href="#">&nbsp;<i class="fa fa-plus"></i></a>
		              </li>
		              <li>
		                <a href="#">&nbsp;<i class="fa fa-minus"></i></a>
		              </li>
		              <li>
		                <a href="#">&nbsp;<i class="fa fa-pencil"></i></a>
		              </li>
		              <li>
		                <a href="#">&nbsp;<i class="fa fa-check"></i></a>
		              </li>
		              <li>
		                <a href="#">&nbsp;<i class="fa fa-times"></i></a>
		              </li>
		            </ul>
		          </div>
		          <div class="container-fluid">
		            <table class="table" width="100%" cellpadding="0" cellspacing="0">
		              <thead>
		                <tr>
		                  <th>ID&nbsp;<i class="fa fa-sort-down"></i>
		                  </th>
		                  <th>Наименование&nbsp;
		                    <i class="fa fa-sort-down"></i>
		                  </th>
		                  <th>Полное наименование&nbsp;
		                    <i class="fa fa-sort-down"></i>
		                  </th>
		                  <th>Страна&nbsp;
		                    <i class="fa fa-sort-down"></i>
		                  </th>
		                  <th>Примечания</th>
		                </tr>
		              </thead>
		              <tbody>
		                <tr>
		                  <td>1</td>
		                  <td>Порт 1</td>
		                  <td>Морской Порт 1</td>
		                  <td>Россия</td>
		                  <td>Балтика</td>
		                </tr>
		                <tr>
		                  <td>2</td>
		                  <td>Порт 2</td>
		                  <td>Морской Порт 2</td>
		                  <td>Россия</td>
		                  <td>Северное море</td>
		                </tr>
		              </tbody>
		            </table>
		          </div>
		          <ul class="pager">
		            <li>
		              <a href="#">Назад</a>
		            </li>
		            <li>
		              <a href="#">Далее</a>
		            </li>
		          </ul>
		        </div>
		      </div>
		    </div>
		</div> <!-- Wrapper end -->

		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>