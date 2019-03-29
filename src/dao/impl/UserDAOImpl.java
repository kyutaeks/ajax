package dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import dao.UserDAO;
import db.DBCon;

public class UserDAOImpl implements UserDAO {
	private String insertUser = "insert into user_info(ui_num,ui_name,ui_id,ui_pwd,ui_email)"
			+ " values(seq_ui_num.nextval,?,?,?,?)";
	private String selectUser = "select * from user_info where ui_id=? && ui_pwd=?";

	@Override
	public int insertUser(Map<String, String> user) {
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(insertUser);
			ps.setString(1, user.get("uiName"));
			ps.setString(2, user.get("uiId"));
			ps.setString(3, user.get("uiPwd"));
			ps.setString(4, user.get("uiEmail"));
			return ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCon.close();
		}
		return 0;
	}

	@Override
	public Map<String, String> selectuser(String id) {
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(selectUser);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Map<String, String> user = new HashMap<>();
				user.put("ui_num", rs.getString("ui_num"));
				user.put("ui_name", rs.getString("ui_name"));
				user.put("ui_id", rs.getString("ui_id"));
				user.put("ui_pwd", rs.getString("ui_pwd"));
				user.put("ui_email", rs.getString("ui_email"));
				return user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
