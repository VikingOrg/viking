<%@ page contentType="text/html; charset=UTF-8" %>
							        	<div class="">
											<!--  Вывод сообщений и предупреждений  -->
											<div id="success_upload" class="alert alert-success hide" style="margin: 10px;">
												<span>Изображения успешно загружены.</span>	
												<button type="button" class="close" data-dismiss="alert">&times;</button>
											</div>
											<div class="alert alert-danger hide" style="margin: 10px;">
												<button type="button" class="close" data-dismiss="alert">&times;</button>
											</div>

							        		
											<div class="panel panel-default" style="margin: 10px;">
												<div id="actions" class="row panel-heading" style="margin: 0"><div class="col-sm-8"><b><c:out value="${machineEditCommand.machine.name} "/></b></div>
												
												
												      <div id="dropZone" class="col-sm-1">
												        <!-- The fileinput-button span is used to style the file input field as button -->
												        <span class="btn btn-primary fileinput-button">
												            <span class="glyphicon glyphicon-camera"></span>
												           <span>Добавить</span>
												        </span>
												        <!--<button type="submit" class="btn btn-primary start">
												            <i class="glyphicon glyphicon-upload"></i>
												             <span>Загрузка</span> 
												        </button>-->
												        <!-- <button type="reset" class="btn cancelbtn">
												            <i class="glyphicon glyphicon-ban-circle"></i>
												            <span>Отмена</span>
												        </button> -->
												      </div>
												
												      <div class="col-sm-1">
												        <!-- The global file processing state -->
												        <span class="fileupload-process">
												          <div id="total-progress" class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
												            <div class="progress-bar progress-bar-success" style="width:0%;" data-dz-uploadprogress></div>
												          </div>
												        </span>
												      </div>
												
												</div>
												
												<div class="panel-body">
												    <div class="table table-striped" class="files" id="previews">
												      <div id="template" class="file-row">
												        <!-- This is used as the file preview template -->
												        <div>
												            <span class="preview"><img data-dz-thumbnail /></span>
												        </div>
												        <div>
												            <p class="name" data-dz-name></p>
												            <strong class="error text-danger" data-dz-errormessage></strong>
												        </div>
												        <div>
												            <p class="size" data-dz-size></p>
												            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
												              <div class="progress-bar progress-bar-success" style="width:0%;" data-dz-uploadprogress></div>
												            </div>
												        </div>
												        <div>
												          <button class="btn btn-primary start">
												              <i class="glyphicon glyphicon-arrow-up"></i>
												              <span>Загрузить</span>
												          </button>
												          <!-- <button data-dz-remove class="btn cancelbtn">
												              <i class="glyphicon glyphicon-ban-circle"></i>
												              <span>Отмена</span>
												          </button> -->
												          <button data-dz-remove class="btn btn-danger delete">
												            <i class="glyphicon glyphicon-trash"></i>
												            <span>Удалить</span>
												          </button>
												        </div>
												      </div>
												    </div>
				
												</div>
											</div>
							            </div>
  <script>

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
  </script>		