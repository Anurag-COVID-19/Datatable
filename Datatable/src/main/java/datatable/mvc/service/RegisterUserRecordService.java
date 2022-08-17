package datatable.mvc.service;

import java.util.List;

import datatable.mvc.entity.User;

public interface RegisterUserRecordService {

	public void userRecordCreateOrUpdate(User user);
	public List<User> getAllUsers();
	public User searchUser(String key);
	public User deleteCurrentRow(String object);
	public void updateCurrentRow(String currentRowToBeUpdated, User user);
}
