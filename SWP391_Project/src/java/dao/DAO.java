/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Context.DBContext;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import entity.*;
import context.*;
import java.sql.SQLException;
import java.util.*;

/**
 *
 * @author ADMIN
 */
public class DAO  extends DBContext {

    public Connection con = null; //connect to sql
    public PreparedStatement ps = null; //ném câu lệnh query sang sql
    public ResultSet rs = null; //nhận kết quả trả về

    
    // Bach + Sign up
    public void signup(String user, String pass, String email) {
        String query = "INSERT users (username, password, email, display_Name, isAdmin, is_active) VALUES (?, ?, ?, ?, 0, 1)";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.setString(4, email);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }
    
    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String query = "select * from swp_demo.users";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getBoolean(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9)));
            }
        } catch (Exception e) {

        }
        return list;
    }
    
    public User getUser(String username) {
        
        String query = "select * from swp_demo.users where username = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getBoolean(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9));
            }
        } catch (Exception e) {

        }
        return null;
    }
    
    public String getEmail() {
        return null;
    }
    
    
    //HUY
        public User Login(String username, String pass) {
        
        String query = "select * from swp_demo.users where username = ? and password = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getBoolean(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9));
            }
        } catch (Exception e) {

        }
        return null;
    }
    
    
    
    //BINH
    
    
    
    

    //HUE
    
      public void updateProfile(int userId, String username, String email, String displayName) {
        String sql = "UPDATE users SET username=?, display_name=?, email=? WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            // st.setString(2, password);
            st.setString(2, displayName);
            st.setString(3, email);

            st.setInt(4, userId);

            st.executeUpdate();
            // Execute the update query         
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changePassword(User u) {
        String sql = "UPDATE users SET password=? WHERE username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getPassword());
            st.setString(2, u.getUsername());

            st.executeUpdate();

            // Execute the update query         
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User getUser(String username, String password) {
        String sql = "Select * from users where username = ? and password=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                return u;
            }
            // Execute the update query         
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    
    //CHIEN

    public static void main(String[] args) {
       DAO dao = new DAO();
        //dao.signup("bach", "1234", "bach@gmil.com");
        System.out.println(dao.Login("bach", "123").toString());
        
        List<User> list = dao.getAllUser();
        for (User user : list) {
            System.out.println(user.toString());
        }
    }
}
