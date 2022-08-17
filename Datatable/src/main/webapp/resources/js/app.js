$(function() {

    $("#name_error_message").hide();
    $("#age_error_message").hide();
    $("#phoneNumber_error_message").hide();
    $("#email_error_message").hide();
    $("#dob_error_message").hide();
    $("#password_error_message").hide();
    $("#confirmPassword_error_message").hide();
    $("#gender_error_message").hide();
    $("#dataRecord").hide();

    var error_name = false;
    var error_age = false;
    var error_phone_number = false;
    var error_email_address = false;
    var error_date_of_birth = false;
    var error_password = false;
    var error_confirm_password = false;
    var error_gender = false;

    $('#name').focusout(function() {
        validate_name();
    });

    $("#age").focusout(function() {
        validate_age();
    });

    $("#phone").focusout(function() {
        validate_phone_number();
    });

    $("#email").focusout(function() {
        validate_email_address();
    });


    $("#datePicker").focusout(function() {
        validate_date_of_birth();
    });

    $("#password").focusout(function() {
        validate_password();
    });

    $("#confirmPassword").focusout(function() {
        validate_confirm_password();
    });

    $("#gender").focusout(function(){
        validate_gender();
    });

    function validate_name() {
    	var flag = false;
        var pattern = /^[a-zA-Z]*$/;
        var username = $("#name").val();
        if (pattern.test(username) && username !== '') {
            $("#name_error_message").hide();
            $("#name").css("border-bottom", "2px solid #34F458");
            flag = true;
        } else {
            $("#name_error_message").html("Should contain only Characters");
            $("#name_error_message").show();
            $("#name").css("border-bottom", "2px solid #F90A0A");
            error_name = true;
        }
        return flag;
    }

    function validate_age() {
    	var flag = false;
        var ageInput = $("#age").val();
        if (ageInput !== '' && !isNaN(ageInput)) {
            $("#age_error_message").hide();
            $("#age").css("border-bottom", "2px solid #34F458");
            flag = true;
        } else {
            $("#age_error_message").html("Should contain only numeric digits");
            $("#age_error_message").show();
            $("#age").css("border-bottom", "2px solid #F90A0A");
            error_age = true;
        }
		return flag;
    }

    function validate_phone_number() {
        var flag = false;
        var pattern = /^\d{10}$/;
        var phone_number = $("#phone").val();
        if (phone_number !== '' && pattern.test(phone_number)) {
            $("#phoneNumber_error_message").hide();
            $("#phone").css("border-bottom", "2px solid #34F458");
            flag = true;
        } else {
            $("#phoneNumber_error_message").html("Invalid mobile number");
            $("#phoneNumber_error_message").show();
            $("#phone").css("border-bottom", "2px solid #F90A0A");
            error_phone_number = true;
        }
        return flag;
    }

    function validate_email_address() {
    	var flag = false;
        var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        var email = $("#email").val();
        if (email !== '' && pattern.test(email)) {
            $("#email_error_message").hide();
            $("#email").css("border-bottom", "2px solid #34F458");
            flag = true;
        } else {
            $("#email_error_message").html("Invalid email address");
            $("#email_error_message").show();
            $("#email").css("border-bottom", "2px solid #F90A0A");
            error_email_address = true;
        }
        return flag;
    }

    function validate_date_of_birth() {
    	var flag = false;
        $("#datePicker").datepicker({
            changeYear:true,
            changeMonth:true,
            showOtherMonths:true,
            maxDate: new Date()
        });
        var dateValue = $("#datePicker").datepicker().val();
        var pattern = new RegExp("^((0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)?[0-9]{2})*$");
        if(dateValue !== '' && pattern.test(dateValue))
        {
            $("#dob_error_message").hide();
            $("#datePicker").css("border-bottom", "2px solid #34F458");
            flag = true;
        }
        else
        {
            $("#dob_error_message").html("Should contain a valid DOB");
            $("#dob_error_message").show();
            $("#datePicker").css("border-bottom", "2px solid #F90A0A");
            error_date_of_birth = true;
        }
        return flag;
    }

    function validate_password() {
    	var flag = false;
        var pattern = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
        var passwordInput = $("#password").val();
        if (passwordInput !== '' && pattern.test(passwordInput)) {
            $("#password_error_message").hide();
            $("#password").css("border-bottom", "2px solid #34F458");
            flag = true;
        } else {
            $("#password_error_message").html("The password must contains at least one lowercase, uppercase letter, one number, one special character and it must be 8 character or longer");
            $("#password_error_message").show();
            $("#password").css("border-bottom", "2px solid #F90A0A");
            error_password = true;
        }
        return flag;
    }

    function validate_confirm_password() {
    	var flag = false;
        var passwordInput = $("#password").val();
        var confirmPasswordInput = $("#confirmPassword").val();
        if (confirmPasswordInput !== '' && passwordInput === confirmPasswordInput) {
            $("#confirmPassword_error_message").hide();
            $("#confirmPassword").css("border-bottom", "2px solid #34F458");
            flag = true;
        } else {
            $("#confirmPassword_error_message").html("Confirmed password does not match");
            $("#confirmPassword_error_message").show();
            $("#confirmPassword").css("border-bottom", "2px solid #F90A0A");
            error_confirm_password = true;
        }
        return flag;
    }

    function validate_gender()
    {
    	var flag = false;
        if($('input[type=radio][name=gender]:checked').length == 0)
        {
            $("#gender_error_message").html("Gender must be selected");
            $("#gender_error_message").show();
            $("#gender").css("border-bottom", "2px solid #F90A0A");
            error_gender = true;
        }
        else
        {
            $("#gender_error_message").hide();
            $("#gender").css("border-bottom", "2px solid #34F458");
            flag = true;
        }
        return flag;
    }
    
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
    	
	
    $("#signup").submit(function() {
        
        var val_name = validate_name();
        var val_age = validate_age();
        var val_numb = validate_phone_number();
        var val_email = validate_email_address();
        var val_dob = validate_date_of_birth();
        var val_pass = validate_password();
        var var_confPass = validate_confirm_password();
        var var_gender = validate_gender();

        if (val_name === true && val_age === true && val_numb === true &&
        	val_email === true && val_dob === true && val_pass === true && 
        	var_confPass === true && var_gender === true){
        	
        	console.log("record submitted...");
            reset_data();
            return true;
        } else {
            
            alert("Input must be entered properly !!!...")
            //reset_data();
            return false;  
        }        
    });
});

