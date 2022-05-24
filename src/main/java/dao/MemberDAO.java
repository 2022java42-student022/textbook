package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.MemberBean2;

public class MemberDAO {
	private String url = "jdbc:postgresql:sample";
	private String user = "student";
	private String passwd = "himitu";

	public MemberDAO() throws DAOException {
		try {
			// JDBCドライバの登録
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new DAOException("JDBCドライバの登録に失敗しました。");
		}
	}

	public MemberBean2 SearchMember(int user_id) throws DAOException {

		String name = null;
		String email = null;
		String pass = null;

		// SQL文の作成
		String sql = "SELECT * FROM member WHERE user_id =?";

		try (// データベースへの接続
				Connection con = DriverManager.getConnection(url, user, passwd);
				// PreparidStatementオブジェクトの取得
				PreparedStatement st = con.prepareStatement(sql);
				// SQLの実行
				ResultSet rs = st.executeQuery();) {
			if (rs.next()) {

				name = rs.getString("name");
				email = rs.getString("email");
				pass = rs.getString("pass");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
		MemberBean2 bean = new MemberBean2(name, email, pass, user_id);
		return bean;
	}

	public MemberBean2 SearchMember2(int user_id) throws DAOException {

		String name = null;
		String email = null;
		String pass = null;
		int userid = 0;
		// SQL文の作成
		String sql = "SELECT * FROM member WHERE user_id =?";

		try (// データベースへの接続
				Connection con = DriverManager.getConnection(url, user, passwd);
				// PreparidStatementオブジェクトの取得
				PreparedStatement st = con.prepareStatement(sql);) {

			st.setInt(1, user_id);
			try (// SQLの実行)
					ResultSet rs = st.executeQuery();) {
				// 結果の取得
				MemberBean2 bean = null;
				while (rs.next()) {
					name = rs.getString("name");
					email = rs.getString("email");
					pass = rs.getString("pass");
					userid = rs.getInt("user_id");
					bean = new MemberBean2(name, email, pass, userid);
				}
				// 会員情報の有無を返す
				return bean;
			}

			catch (SQLException e) {
				e.printStackTrace();
				throw new DAOException("レコードの取得に失敗しました。");
			}

			// いっちせんとあかん
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}

	}

	public void addMember(MemberBean2 bean2) throws DAOException {
		String sql = "INSERT INTO member(name, email, pass) VALUES(?, ?, ?)";

		try (Connection con = DriverManager.getConnection(url, user, passwd);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setString(1, bean2.getName());
			st.setString(2, bean2.getEmail());
			st.setString(3, bean2.getPass());

			st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		}

	}

	public int searchByEmail(String email) throws DAOException {
		int user_id = 0;
		String sql = "SELECT * FROM member WHERE email=?";
		try (Connection con = DriverManager.getConnection(url, user, passwd);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setString(1, email);
			try (ResultSet rs = st.executeQuery();) {
				while (rs.next()) {
					user_id = rs.getInt(user_id);
				}
				return user_id;
			} catch (SQLException e) {
				e.printStackTrace();
				throw new DAOException("レコードの取得に失敗しました。");
			}

			// いっちせんとあかん
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}

	}
}
