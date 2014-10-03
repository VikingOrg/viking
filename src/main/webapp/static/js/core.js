/*!
 * CoreViking v0.1 (http://Jalastic.viking.com)
 * Copyright 2014-current Danil Ozherelyev
 * Licensed to ITT21
 */

function showProgressModal(selector) {
	//$('body').append("common/progressModal.jsp");
    $(selector).modal('show');
    $('.modal-backdrop').addClass('background-backdrop');
}

function closeProgressModal(selector) {
    $(selector).modal('hide');
}

function loadStaticHtmlElements(){
    $.ajax({
    	type: "GET",
	    url: baseHeaderUrl("menu"),
        complete : function( response ) {
        	if(response.responseText.indexOf('Регистрация') >= 0) {
        		window.location.href = baseUrl()+"viking";
        	} else {
        		$("#mainMenu").html(response.responseText);
        		$('#mainContext').attr('class','container');
                $.ajax({
                	type: "GET",
        		    url: baseHeaderUrl("footer"),
                    complete : function( response ) {
                        $("#footer").html(response.responseText);
                    },	        	        
        	        error: function(){
        	        	alert("failure to load footer");
        	        }
                });
            }
        },	        	        
        error: function(){
        	alert("failure to load header");
        }
    });	
}

function baseHeaderUrl(element) {
	   var href = window.location.href.split('/');
	   if(href[2].indexOf("localhost") > -1){
		   return baseUrl = href[0]+'//'+href[2]+'/'+"viking/" + element; 
       } else {
    	   return baseUrl = href[0]+'//'+href[2]+'/'+ element;
       }
	   //return baseUrl = href[0]+'//'+href[2]+'/'+href[3]+'/'+href[4]+'/';
} 

jQuery(function(){
 //place holder
});

jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();


