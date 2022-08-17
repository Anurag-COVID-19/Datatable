package datatable.mvc.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import datatable.mvc.entity.User;
import datatable.mvc.repository.UserRecordMapper;
import datatable.mvc.service.RegisterUserRecordService;

@Service
public class RegisterUserRecordServiceImpl implements RegisterUserRecordService {

	@Autowired
	private UserRecordMapper userRecordCache;
		
	@Override
	public void userRecordCreateOrUpdate(User user) {
		// TODO Auto-generated method stub
		userRecordCache.put(user.getName(), user);
	}

	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return userRecordCache.getAll();
	}

	@Override
	public User deleteCurrentRow(String key) {
		// TODO Auto-generated method stub
		return userRecordCache.remove(key);
	}

	@Override
	public void updateCurrentRow(String currentRowToBeUpdated, User user) {
		// TODO Auto-generated method stub
		userRecordCache.udpate(currentRowToBeUpdated, user);
	}

	@Override
	public User searchUser(String key) {
		// TODO Auto-generated method stub
		return userRecordCache.getValue(key);
	}

}
