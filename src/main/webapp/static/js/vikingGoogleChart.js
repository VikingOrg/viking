/*!
 * GoogleVikingChart v0.1 
 * Copyright 2014-current Danil Ozherelyev
 * Licensed to ITT21
 */

  /*google lib should be loaded along the page..*/	
  google.load('visualization', '1.0', {'packages':['corechart']});
	  
  /*Get chart to draw.*/
  function drawGoogleChart(chartData, width, height, htmlElement, isBarChart, totalCount) {
	var colors = ['#3366cc','#dc3912', '#ff9900','#109618', '#990099','#0099c6', '#dd4477','#66aa00'];  
	/*Sorting out our counts.*/  
	chartData = chartData.sort(function(obj1, obj2) {
		return obj2.count - obj1.count;
	});

    var dataArray = [];
    dataArray.push(['Element', 'Density', { role: 'style' }]);

    /*Getting max number of iterations*/
    var maxIteration = 7;
    if (chartData.length < 8) {
    	maxIteration = chartData.length; 
    }
    var usedCount = 0;
    for (var i = 0; i < maxIteration; i++) {
    	dataArray.push([chartData[i].name, parseInt(chartData[i].count), colors[i]]);
        usedCount = usedCount + chartData[i].count;	        
    }
    /*Others*/
    var others = totalCount - usedCount;
    dataArray.push(['Остальные', others, '#66aa00']);

    if(isBarChart) {
       var data = google.visualization.arrayToDataTable(dataArray);		    	 
        var options = {
		  'title':'Общее кол-во:'+totalCount,
		  'chartArea':{left:300,top:0,width:'100%',height:'90%'},
		  'width':'500',
		  'height':'400',
		};
    	var chart = new google.visualization.BarChart(htmlElement);
    	chart.draw(data, options);			    
    } else {
    	
		var data = google.visualization.arrayToDataTable(dataArray);
		 // Set chart options
		var options = {
		  'title':'Общее кол-во:'+totalCount,
		  'is3D':true,
		  'colors':['#3366cc','#dc3912', '#ff9900','#109618', '#990099','#0099c6', '#dd4477','#66aa00'],
		  'chartArea':{left:0,top:0,width:'70%',height:'100%'},
		  'width':'500',
		  'height':'400',
		  'pieSliceTextStyle':{color: 'black'},
		  'backgroundColor':'none',
		};
		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(htmlElement);
		chart.draw(data, options);
    	
	}	        
  }