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
import java.util.*;
import java.sql.SQLException;
/**
 *
 * @author ADMIN
 */
public class DAO {

    public Connection con = null; //connect to sql
    public PreparedStatement ps = null; //ném câu lệnh query sang sql
    public ResultSet rs = null; //nhận kết quả trả về

    
    // Bach + Sign up
    public void signup(String user, String pass, String email) {
        String query = "INSERT users (username, password, email, display_Name, isAdmin, is_active) VALUES (?, ?, ?, ?, 0, 0)";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.setString(4, user);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }
    
    public void setActiveTrue(String email) {
        String query = "Update swp_demo.users set is_active = 1 WHERE email = ?; ";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, email);
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
    
    public User getEmail(String email) {
        String query = "select * from swp_demo.users where email = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, email);
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
    
    public String getUsername(String username) {
        String query = "select * from swp_demo.users where username = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(2);
            }
        } catch (Exception e) {

        }
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
    
    public User isEmail(String email) {
        String sql = "select * from users where email = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
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

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public User updatePassword(String pass, int  id ) {
        String sql = "Update users set password=? where id =? ";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setInt(2, id);
       ps.executeUpdate();
                    
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
      
    }
    
    
    

    //HUE
    
    
    
    
    //CHIEN

    public static void main(String[] args) {
       DAO dao = new DAO();
        //dao.signup("bach", "1234", "bach@gmil.com");
        List<User> list = dao.getAllUser();
        for (User user : list) {
            System.out.println(user.toString());
        }
        System.out.println(dao.getEmail("Bachnvhe172297@fpt.edu.vn"));
    }
}
