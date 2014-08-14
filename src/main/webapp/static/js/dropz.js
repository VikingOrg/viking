/*!
 * Dropz Viking v0.1 (http://Jalastic.viking.com)
 * Copyright 2014-current Danil Ozherelyev
 * Custom settings for Boostrap & dropzone plug-in.
 * Licensed to ITT21
 */
 	 

     var submittignForm = false; 
	 Dropzone.autoDiscover = false;
     // Get the template HTML and remove it from the doument
     var previewNode = document.querySelector("#template");
     previewNode.id = "";
     var previewTemplate = previewNode.parentNode.innerHTML;
     previewNode.parentNode.removeChild(previewNode);

     var myDropzone = new Dropzone("div#dropZone", {
	    url: "${pageContext.request.contextPath}/fileController/upload", // Set the url
	    parallelUploads: 100,
	    maxFiles: 100,       
	    thumbnailWidth: 80,
	    thumbnailHeight: 80,
	    previewTemplate: previewTemplate,
	    autoQueue: false, // Make sure the files aren't queued until manually added
	    previewsContainer: "#previews", // Define the container to display the previews
	    clickable: ".fileinput-button" // Define the element that should be used as click trigger to select files.
     });

     myDropzone.on("addedfile", function(file) {
       // Hookup the start button
       file.previewElement.querySelector(".start").onclick = function() { myDropzone.enqueueFile(file); };
       $('#success_upload').attr("class","alert alert-success hide");
     });

     // Update the total progress bar
     myDropzone.on("totaluploadprogress", function(progress) {
       document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
     });
 	
     myDropzone.on("sending", function(file, xhr, formData) {
 	    formData.append("name", "MyValue"); // Append all the additional input data of your form here!
       // Show the total progress bar when upload starts
       document.querySelector("#total-progress").style.opacity = "1";
       // And disable the start button
       file.previewElement.querySelector(".start").setAttribute("disabled", "disabled");
     });

     // Hide the total progress bar when nothing's uploading anymore
     myDropzone.on("queuecomplete", function(progress) {
       document.querySelector("#total-progress").style.opacity = "0";
       /*Customm message*/
       $('#success_upload').attr("class","alert alert-success show");
     });

     myDropzone.on("success", function(response, serverResponse) {
         $.each(serverResponse, function (i, object) {
        	 var uploadOK = object.uploadOK;
        	 var fileName = object.fileName;  
         });
     });


     
     // Setup the buttons for all transfers
     // The "add files" button doesn't need to be setup because the config
     // `clickable` has already been specified.
     document.querySelector("#actions .start").onclick = function() {
       myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
     };
     document.querySelector("#actions .cancel").onclick = function() {
       myDropzone.removeAllFiles(true);
     };