windows.fileDetails = function() {
        // GET THE FILE INPUT.
         var fi = document.getElementById('file');
        // VALIDATE OR CHECK IF ANY FILE IS SELECTED.

         if (fi != null) {
                // THE TOTAL FILE COUNT.
                document.getElementById('fp').innerHTML =
                    'Total Files: <b>' + fi.files.length + '</b></br >';
                // RUN A LOOP TO CHECK EACH SELECTED FILE.
                for (var i = 0; i <= fi.files.length - 1; i++) {
                    var fname = fi.files.item(i).name;      // THE NAME OF THE FILE.
                    var fsize = fi.files.item(i).size;      // THE SIZE OF THE FILE.
                    // SHOW THE EXTRACTED DETAILS OF THE FILE.
                    document.getElementById('fp').innerHTML =
                        document.getElementById('fp').innerHTML + '<br /> ' +
                            fname + ' (<b>' + fsize + '</b> bytes)';
                }
            }
            else { 
                alert('Please select a file.') 
            }
    }

// 	$("#post_database_id").prop("disabled", true); // second dropdown is disable while first dropdown is empty
// 	$("#post_module_type").change(function(){
// 		var database = $(this).val();
// 		if(database == ''){
// 			$("#post_module_type").prop("disabled", true);
// 		}else{
// 			$("#post_module_type").prop("disabled", false);
// 		}
// 		$.ajax({
// 			url: "/module_types",
// 			method: "GET",  
// 			dataType: "text/html",
// 			data: {database: database},
// 			error: function (xhr, status, error) {
// 				console.error('AJAX Error: ' + status + error);
// 			},
// 			success: function (response) {
// 				console.log(response);
				
// 				var module_types = response["module_types"];

// 				$("#post_database_id").empty();

// 				$("#post_database_id").append('<option>Select Module Type</option>');

// 				for(var i = 0; i < module_types.length; i++){

// 					$("#post_database_id").append('<option value="' + module_types[i]["id"] + '">' +module_types[i]["name"] + '</option>');
				
// 				}
// 			}
// 		});
// 	});
