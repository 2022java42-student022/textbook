package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import bean.CartBean;
import bean.OrderCheckBean;
import bean.TextBean;

public class OrderDAO {

	private String url = "jdbc:postgresql:sample";
	private String user = "student";
	private String pass = "himitu";

	public OrderDAO() throws DAOException {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new DAOException("JDBCドライバの登録に失敗しました。");

		}
	}

	public int orderMem(OrderCheckBean check, CartBean cart,int user_id) throws DAOException {
		String sql = "UPDATE member SET address = ?, mail = ?, tel = ?, pay = ? WHERE name = ?";
		try(
			Connection con = DriverManager.getConnection(url, user, pass);
			PreparedStatement st = con.prepareStatement(sql);) {
			st.setString(1, check.getAddress());
			st.setString(2, check.getMail());
			st.setString(3, check.getTel());
			st.setString(4, check.getPay());
			st.setString(5, check.getName());
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの操作に失敗しました。");
		}
		
		int orderID = 0;
		sql = "SELECT nextval('ordered_order_id_seq')";
		try (
			Connection con = DriverManager.getConnection(url, user, pass);
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();)  {
			if (rs.next()) {
				orderID = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの操作に失敗しました。");
		}
		
		
		sql = "INSERT INTO ordered VALUES(?,current_date,?,?)";
		
		try (
			Connection con = DriverManager.getConnection(url, user, pass);
			PreparedStatement st = con.prepareStatement(sql);) {
			st.setInt(1, orderID);
			st.setInt(2, user_id);
			st.setInt(3, cart.getTotal());
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの操作に失敗しました。");
		}
		
		sql = "INSERT INTO ordered_detail VALUES(?, ? , ?)";
		
		try (
			Connection con = DriverManager.getConnection(url, user, pass);
			PreparedStatement st = con.prepareStatement(sql);) {
			List<TextBean> texts = cart.getTexts();
			for (TextBean text : texts) {
				st.setInt(1, text.getText_id());
				st.setInt(2, orderID);
				st.setInt(3, user_id);
				st.executeUpdate();
			}
			return orderID;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの操作に失敗しました。");
		}
		
	}

}
