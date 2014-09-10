<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Главная страница</title>
		<jsp:include page="common/headCoreElements.jsp" />
	    
	    <script type="text/javascript" src="<c:url value="/static/js/ammap/ammap.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/ammap/maps/js/russiaHigh.js"/>"></script>
		<script type="text/javascript" src="http://www.amcharts.com/lib/3/themes/none.js"></script>
		<script type="text/javascript">
		 // add all your code to this method, as this will ensure that page is loaded
	    AmCharts.ready(function() {
	        // create AmMap object
	        var map = new AmCharts.AmMap();
	        // set path to images
	        map.pathToImages = "<c:url value="/static/js/ammap/images/"/>";

	        /* create data provider object
	         map property is usually the same as the name of the map file.

	         getAreasFromMap indicates that amMap should read all the areas available
	         in the map data and treat them as they are included in your data provider.
	         in case you don't set it to true, all the areas except listed in data
	         provider will be treated as unlisted.
	        */
	        var dataProvider = {
	            map: "russiaHigh",
	            getAreasFromMap:true,
	            images:[{latitude:59.8944400, longitude:30.2641700, type:"circle", color:"#6c00ff", scale:1.0,  labelShiftY:1, title:"Санкт-Петербург",
		             description:"Большой портовый город. Много Компаний-операторов."},
		             {latitude:43.1056200, longitude:131.8735300, type:"circle", color:"#6c00ff", scale:1.0,  labelShiftY:1, title:"Владивосток",
		                 description:"Большой портовый город. Много Компаний-операторов."},
	                 {latitude:49.6333300, longitude:142.1666700, type:"circle", color:"#6c00ff", scale:1.0,  labelShiftY:1, title:"Бошняково",
		                 description:"Чтоб не спрашивали где это."},
		       ],                 
	        }; 

	        
	        // pass data provider to the map object
	        map.dataProvider = dataProvider;

	        /* create areas settings
	         * autoZoom set to true means that the map will zoom-in when clicked on the area
	         * selectedColor indicates color of the clicked area.
	         */
	        map.areasSettings = {
	            autoZoom: false,
	            alpha: 1.0,
	            rollOverColor: "#77B300",
	            color: "#85EB54",
	            mouseEnabled:false,
	            balloonText: "",
	        };

	        // let's say we want a small map to be displayed, so let's create it
	        /* map.smallMap = new AmCharts.SmallMap(); */

	        // write the map to container div
	        map.write("mapdiv");
	    });
		</script>
	</head>
	<body>
		
		<!-- Wrap all page content here -->  
		<div id="wrap">		
		<jsp:include page="common/menu.jsp" />

		  <!-- Begin page content -->
		  <form action=""></form>			 
		  <div class="container">
		      <h1  class="page-header">Главная</h1>
		    <%-- <div class="alert alert-success show">
		    		<p><h4>Приветствуем вас, <span id="username">${userModel.firstName}&nbsp;</span>!</h4></p>
		    		<p>Перед началом работы пожалуйста ознакомьтесь с Правилами пользования Системой.</p>
					<p>&nbsp;</p>
		    		

			</div> --%>
			<div id="mapdiv" style="width: 960px; height: 640px;"></div>
		  </div>	
	</div> <!-- Closing div tag for wrap -->
	
		   <jsp:include page="common/footer.jsp" />	
	</body>
</html>