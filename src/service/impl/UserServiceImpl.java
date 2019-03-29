package service.impl;

import java.util.Map;

import dao.UserDAO;
import dao.impl.UserDAOImpl;
import service.UserService;

public class UserServiceImpl implements UserService {
	UserDAO udao = new UserDAOImpl();

	@Override
	public int insertUser(Map<String, String> user) {
		return udao.insertUser(user);
	}

	@Override
	public Map<String, String> selectuser(String id) {
		return udao.selectuser(id);
	}

}
