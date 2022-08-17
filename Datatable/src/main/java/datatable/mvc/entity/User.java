package datatable.mvc.entity;

public class User {

	private String name;
	private String age;
	private String phone;
	private String email;
	private String datePicker;
	private String password;
	private String confirmPassword;
	private String gender;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDatePicker() {
		return datePicker;
	}
	public void setDatePicker(String datePicker) {
		this.datePicker = datePicker;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public User(String name, String age, String phone, String email, String datePicker, String password,
			String confirmPassword, String gender) {
		super();
		this.name = name;
		this.age = age;
		this.phone = phone;
		this.email = email;
		this.datePicker = datePicker;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "User [name=" + name + ", age=" + age + ", phone=" + phone + ", email=" + email + ", datePicker="
				+ datePicker + ", password=" + password + ", confirmPassword=" + confirmPassword + ", gender=" + gender
				+ "]";
	}
	
	
}
