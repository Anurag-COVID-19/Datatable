<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" 
		   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" type="text/css">
<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css" rel="stylesheet" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!-- <date picker jquery> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<title>Registration</title>
<!-- <c:url var="home" value="/" scope="request" /> -->

</head>
<body>
	<div class="container">
        <form id="signup", class="form">
            <h2>User Registration</h2>
            <div class="form-field">
                <input type="text" name="name" id="name" placeholder="Username">
                <span class="error_form" id="name_error_message"></span>
            </div>
            <div class="form-field">
                <input type="text" name="age" id="age" placeholder="Age">
                <span class="error_form" id="age_error_message"></span>
            </div>
            <div class="form-field">
                <input type="text" name="phone" id="phone" placeholder="Phone Number">
                <span class="error_form" id="phoneNumber_error_message"></span>
            </div>
            <div class="form-field">
                <input type="text" name="email" id="email" placeholder="Email Address">
                <span class="error_form" id="email_error_message"></span>
            </div>
            <div class="form-field">
                <input type="text" name="dob" id="datePicker" placeholder="Date of Birth" >
                <span class="error_form" id="dob_error_message"></span>
            </div>
            <div class="form-field">
                <input type="text" name="password" id="password" placeholder="Password">
                <span class="error_form" id="password_error_message"></span>
            </div>
            <div class="form-field">
                <input type="text" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password">
                <span class="error_form" id="confirmPassword_error_message"></span>
            </div>
            <div>
                <input type="radio" id="gender" name="gender" value="male"> Male 
                <input type="radio" id="gender" name="gender" value="female"> Female
                <input type="radio" id="gender" name="gender" value="other"> Other <br>
                <span class="error_form" id="gender_error_message"></span>
            </div>
            <div class="form-field">
                <input type="submit" id="submit" name="submit" value="Register">
            </div>
        </form>                   
    </div>
    <div class="viewDataTable">
        <div class="viewButton">
            <input type="button" name="View" id="view" value="View Records">
        </div>
        <div class="table">
            <table id="dataRecord" class="display" cellspacing="0"></table>
        </div>
    </div>
    <script src="<c:url value="/resources/js/app.js" /> "></script>
    <script type="text/javascript">
    var table = null;
    $("#signup").submit(function(e) {
    	e.preventDefault();
		if($.trim($("#name").val()).length != 0 &&
			$.trim($("#age").val()).length != 0 &&
			$.trim($("#phone").val()).length != 0 &&
			$.trim($("#email").val()).length != 0 &&
			$.trim($("#datePicker").val()).length != 0 &&
			$.trim($("#password").val()).length != 0 &&
			$.trim($("#confirmPassword").val()).length != 0 &&
			$.trim($("#gender:checked").val()).length != 0)
			{
				$.ajax({
					type: "GET",
					url: "${home}/create",
					contentType: "application/json; charset=utf-8",
					data: {
						name : $("#name").val(),
			            age: $("#age").val(),
			            phone: $("#phone").val(),
			            email: $("#email").val(),
			            datePicker: $("#datePicker").val(),
			            password: $("#password").val(),
			            confirmPassword: $("#confirmPassword").val(),
			            gender: $("#gender:checked").val()
					},
					success: function (data){
						if(!data)
						{
								console.log("Successfully Poseted data .......:: "+ data);	
						}
					},
					error: function (e){
						console.log("Failed to Post .......:: "+ data)
					}
				});	
			}
		else{
			alert("Something is left.... please fill it...")	
		}
	});
    $("#view").click(function(e){
		$("#dataRecord").show();
		table = $('#dataRecord').DataTable({
	        'sAjaxSource': '${home}/getAllUsers',
	        'sAjaxDataProp': '',
	        'fixedHeader' : true,
	        'pageLength': 5,
	        "processing": true,
			'serverSide': true,
			'order': [ [ 0, 'asc' ] ],
			'columns': [
		            { data: "name", title: "Name"},
		            { data: "age", title: "Age"},
		            { data: "phone", title: "Phone Number"},
		            { data: "email", title: "Email Address"},
		            { data: "datePicker", title: "DOB"},
		            { data: "gender", title: "Gender"},
		            { data: "Update", title: "Update",
	            	   render: function(data, type, row){
	            		   return '<button type="button" id="updateCurrentRowId" class="updateCurrentRow" data-toggle="modal" data-target="#myModal">Update</button> <div class="modal fade" id="myModal" role="dialog"> <div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <button type="button" class="close" data-dismiss="modal">&times;</button> <h4 class="modal-title">Update User Record</h4> </div> <div class="modal-body"> <form id="updateUserInfo" ><div class="form-field"> <input type="text" name="username" id="username" placeholder="Username"> </div> <div class="form-field"> <input type="text" name="updatedAge" id="updatedAge" placeholder="Age"> </div> <div class="form-field"> <input type="text" name="updatedNumber" id="updatedNumber" placeholder="Phone Number"> </div> <div class="form-field"> <input type="text" name="updatedEmail" id="updatedEmail" placeholder="Email Address "> </div> <div class="form-field"> <input type="text" name="updatedDob" id="updatedDatePicker" placeholder="Date of Birth" > </div> <div class="form-field"> <input type="text" name="updatedPassword" id="updatedPassword" placeholder="Password"> </div> <div class="form-field"> <input type="text" name="updatedConfirmPassword" id="updatedConfirmPassword" placeholder="Confirm Password"> </div> <div> <input type="radio" id="updatedGender" name="updatedGender" value="male"> Male  <input type="radio" id="updatedGender" name="updatedGender" value="female"> Female <input type="radio" id="updatedGender" name="updatedGender" value="other"> Other <br> </div> <div class="form-field"> <input type="submit" id="submit" name="submit" value="Update"> </div> </form>  </div> </div> <div class="modal-footer"> <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> </div> </div> </div>';
			        }},
		            { data: "Delete", title: "Delete",
		                render: function(data, type, row){
		                    return '<button class="deleteCurrentRow">Remove</button>';
		            }},
	        	]
		});
	});

    $('#dataRecord').on( 'click', '.deleteCurrentRow', function () {
        
        var row = table.row($(this).parents('tr')).data();
        var key = row.name;
        console.log('row to be deleted :: ', row);
        console.log('name '+ row.name);
        $(this).closest('tr').remove();
        $.ajax({
        	type: "GET",
        	url: "${home}delete/"+ key,
        	contentType: "application/json; charset=utf-8",
        	data: {
        		data  : row
        	},
        	success : function(data){
        		console.log(data);
        	},
        	error : function(e){
        		console.log(e);
        	}
        })
    });
    
    $('#dataRecord').on('click', '.updateCurrentRow', function(){
    	var row = table.row($(this).parents('tr')).data();
        var key = row.name;
        console.log('row to be update :: ', row);
        $("#updateUserInfo").submit(function(e) {
        	e.preventDefault();
        	if($.trim($("#username").val()).length != 0 &&
        			$.trim($("#updatedAge").val()).length != 0 &&
        			$.trim($("#updatedNumber").val()).length != 0 &&
        			$.trim($("#updatedEmail").val()).length != 0 &&
        			$.trim($("#updatedDatePicker").val()).length != 0 &&
        			$.trim($("#updatedPassword").val()).length != 0 &&
        			$.trim($("#updatedConfirmPassword").val()).length != 0 &&
        			$.trim($("#updatedGender:checked").val()).length != 0){
        		$.ajax({
            		type: 'GET',
                	url: '${home}update/' + key,
                	contentType: "application/json; charset=utf-8",
                	data: {
                		username : $("#username").val(),
                		updatedAge: $("#updatedAge").val(),
        	            updatedNumber: $("#updatedNumber").val(),
        	            updatedEmail: $("#updatedEmail").val(),
        	            updatedDatePicker: $("#updatedDatePicker").val(),
        	            updatedPassword: $("#updatedPassword").val(),
        	            updatedConfirmPassword: $("#updatedConfirmPassword").val(),
        	            updatedGender: $("#updatedGender:checked").val()
                	},
                	success: function(data){
                		if(!data){
                			console.log("Successfully updated the user record ...:: "+data);
                			reset_updated_data();
                			location.reload();
                		}
                	},
                	error: function(e) {
                		console.log("Something isn't right about the user record ...:: "+e);
                		reset_updated_data();
                	}
            	})	
        	}else{
        		console.log("Something isn't right about the user record ...:: ");
        	}
        });
    });
    function reset_data()
	{
		$("#name").val(""),
        $("#age").val(""),
        $("#phone").val(""),
        $("#email").val(""),
        $("#datePicker").val(""),
        $("#password").val(""),
        $("#confirmPassword").val(""),
        $("#gender:checked").val("")
	}
    function reset_updated_data()
	{
		$("#username").val(""),
        $("#updatedAge").val(""),
        $("#updatedNumber").val(""),
        $("#updatedEmail").val(""),
        $("#updatedDatePicker").val(""),
        $("#updatedPassword").val(""),
        $("#updatedConfirmPassword").val(""),
        $("#updatedGender:checked").val("")
	}
    </script>
</body>
</html>