package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
	private String url = "jdbc:postgresql:sample";
	private String id = "student";
	private String password = "himitu";
	
	public LoginDAO() throws DAOException{
		try {
			Class.forName("org.postgresql.Driver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			throw new DAOException("JDBCドライバの登録に失敗しました。");
		}
	}

	public boolean findMgAccount(String email, String pass) throws DAOException {
		String sql = "SELECT * FROM manager WHERE email = ? AND pass = ?;";
		try (Connection con = DriverManager.getConnection(url, id, password)) {

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return false;
	}
	public boolean findMemAccount(String email, String pass) throws DAOException {
		String sql = "SELECT * FROM member WHERE email = ? AND pass = ?;";
		try (Connection con = DriverManager.getConnection(url, id, password)) {

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return false;
	}
}
