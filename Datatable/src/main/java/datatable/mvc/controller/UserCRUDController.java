package datatable.mvc.controller;

import java.util.List;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ch.qos.logback.classic.Logger;
import datatable.mvc.entity.User;
import datatable.mvc.serviceImpl.RegisterUserRecordServiceImpl;

@Controller
public class UserCRUDController {

	private static final Logger logger =  (Logger) LoggerFactory.getLogger(UserCRUDController.class);
	@Autowired
	private RegisterUserRecordServiceImpl userRecordService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loginPage() {
		return "register";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<User> message(@RequestParam(required = false, value = "name") String name,
			@RequestParam(required = false, value = "age") String age,
			@RequestParam(required = false, value = "phone") String phoneNumber,
			@RequestParam(required = false, value = "email") String email,
			@RequestParam(required = false, value = "datePicker") String dateOfBirth,
			@RequestParam(required = false, value = "password") String password,
			@RequestParam(required = false, value = "confirmPassword") String confirmPassword,
			@RequestParam(required = false, value = "gender") String gender) {
		
		logger.info("Create API :: Enter");
		User user = new User(name, age, phoneNumber, email, dateOfBirth, password, confirmPassword, gender);
		userRecordService.userRecordCreateOrUpdate(user);
		System.out.println("User record put :: " + user);
		logger.info("Create API :: Exit");
		return new ResponseEntity<User>(user, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/getAllUsers", method = RequestMethod.GET)
	public ResponseEntity<List<User>> getAllUsers() {
		
		logger.info("GET ALL API :: Enter");
		System.out.println("Users:: " + userRecordService.getAllUsers());
		logger.info("GET ALL API :: Exit");
		return new ResponseEntity<List<User>>(userRecordService.getAllUsers(), HttpStatus.OK);
	}

	@RequestMapping(value = "/delete/{row}", method = RequestMethod.GET)
	public ResponseEntity<Void> deleteUser(@PathVariable String row) {
		
		logger.info("DELETE API :: Enter");
		userRecordService.deleteCurrentRow(row);
		System.out.println("Row delete with given Id :: " + row + " " + userRecordService.deleteCurrentRow(row));
		logger.info("DELETE API :: Exit");
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	@RequestMapping(value = "/update/{key}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Void> updateUser(@PathVariable("key") String key,
			@RequestParam(required = false, value = "username") String username,
			@RequestParam(required = false, value = "updatedAge") String updatedAge,
			@RequestParam(required = false, value = "updatedNumber") String updatedNumber,
			@RequestParam(required = false, value = "updatedEmail") String updatedEmail,
			@RequestParam(required = false, value = "updatedDatePicker") String updatedDatePicker,
			@RequestParam(required = false, value = "updatedPassword") String updatedPassword,
			@RequestParam(required = false, value = "updatedConfirmPassword") String updatedConfirmPassword,
			@RequestParam(required = false, value = "updatedGender") String updatedGender) {
		
		logger.info("UPDATE API :: Enter");
		User user = new User(username, updatedAge, updatedNumber, updatedEmail, updatedDatePicker, updatedPassword,
				updatedConfirmPassword, updatedGender);
		userRecordService.updateCurrentRow(key, user);
		System.out.println("User recorded updated with value : [ " + userRecordService.searchUser(key) + " ]");
		logger.info("UPDATE API :: Exit");
		return new ResponseEntity<Void>(HttpStatus.OK);

	}
}
