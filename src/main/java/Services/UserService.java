package Services;

import Model.User;
import Utils.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserService {

    private final Connection con = DBConnect.getConnection();

    //create a new user
    public boolean createUser(User user) {

        String query = "INSERT INTO users (name, email, password, mobile, role, country) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getMobile());
            pstmt.setInt(5, user.getRole());
            pstmt.setString(6, user.getCountry());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

    //select a user by email and password
    public boolean loginUser(User user) {
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, user.getEmail());
            pstmt.setString(2, user.getPassword());

            ResultSet rs = pstmt.executeQuery();

            return rs.next(); // returns true if a matching user is found
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    //update a existing user by userId
    public boolean updateUser(User user) {
        String query = "UPDATE users SET name = ?, email = ?, password = ?, mobile = ?, country = ? WHERE userId = ?";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getMobile());
            pstmt.setString(5, user.getCountry());
            pstmt.setInt(6, user.getUserId());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    //Retrieve a user by userId
    public User getUserById(int userId) {
        String query = "SELECT * FROM users WHERE userId = ?";
        User user = null;

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setMobile(rs.getString("mobile"));
                user.setRole(rs.getInt("role"));
                user.setCountry(rs.getString("country"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    //delete a user by userId
    public boolean deleteUser(User user) {
        String query = "DELETE FROM users WHERE userId = ?";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, user.getUserId());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    //validate email 
    public boolean validateEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ?";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            return rs.next(); // returns true if a matching user is found
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //get user by email
    public User getUserByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ?";
        User user = null;

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setMobile(rs.getString("mobile"));
                user.setRole(rs.getInt("role"));
                user.setCountry(rs.getString("country"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    //get all users from user table and store them in a an ArrayList (use for admin dashboard)
    public ArrayList<User> getAllUsers() {
        ArrayList<User> users = new ArrayList<>();
        String query = "SELECT * FROM users";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setMobile(rs.getString("mobile"));
                user.setRole(rs.getInt("role"));
                user.setCountry(rs.getString("country"));

                users.add(user);
            }
            return users;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

}
