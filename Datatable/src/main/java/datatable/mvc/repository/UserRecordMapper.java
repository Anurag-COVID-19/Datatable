package datatable.mvc.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import datatable.mvc.entity.User;

@Service
public class UserRecordMapper {

	private final Map<String, User> cacheRecord = new HashMap<String, User>();
	
	public void put(String name, User user)
	{
		cacheRecord.put(name, user);
	}
	
	public User getValue(String name)
	{
		if(name != null)
		{
			return cacheRecord.get(name);
		}
		return null;
	}
	
	public List<User> getAll()
	{
		List<User> usersList= new ArrayList<User>();
		usersList.addAll(cacheRecord.values());
		return usersList;
	}
	
	public User remove(String name)
	{
		if(name != null)
		{
			return cacheRecord.remove(name);
		}
		return null;
	}
	
	public void udpate(String key, User newUpdatedUser)
	{
		User oldUser = cacheRecord.get(key);
		if(oldUser != null)
		{
			cacheRecord.replace(key, oldUser, newUpdatedUser);
		}
	}
}
