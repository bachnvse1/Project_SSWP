/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Context.DBContext;
import Entity.Category;
import Entity.Product;
import Entity.ProductOrderPair;
import Entity.User;
import Entity.intermediateOrders;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.*;
import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class DAO extends DBContext {

    public Connection con = null; //connect to sql
    public PreparedStatement ps = null; //ném câu lệnh query sang sql
    public ResultSet rs = null; //nhận kết quả trả về

    // Bach 
    public void signup(String user, String pass, String email) {
        String query = "INSERT users (username, password, email, display_Name, is_admin, is_verify, is_active) VALUES (?, ?, ?, ?, 0, 0, 1)";
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

    public void setVerifyTrue(String email) {
        String query = "Update swp_demo.users set is_verify = 1 WHERE email = ?; ";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void signupGoogle(String id, String name, String email) {
        String query = "INSERT userGoogle (id, name, email, is_active) VALUES (?, ?, ?, 1)";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, email);
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
                        rs.getBoolean(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10)));
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
                        rs.getBoolean(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public User getUserById(int id) {

        String query = "select * from swp_demo.users where id = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getBoolean(7),
                        rs.getBoolean(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10));
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
                        rs.getBoolean(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10));
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

    public void updateOrder(int buyer_id, String status, int updated_by, int id) {
        String query = "UPDATE intermediate_Orders\n"
                + "SET \n"
                + "    buyer_id = ?,\n"
                + "    status = ?,\n"
                + "    updated_by = ?,\n"
                + "    updated_at = CURRENT_TIMESTAMP\n"
                + "WHERE\n"
                + "    productID = ?;";
         try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setInt(1, buyer_id);
            ps.setString(2, status);
            ps.setInt(3, updated_by);
            ps.setInt(4, id);
            ps.executeUpdate();

        } catch (Exception e) {

        }
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
                        rs.getBoolean(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10));
            }
        } catch (Exception e) {

        }
        return null;
    }

    //BINH
    public boolean isEmailExists(String email) {
        boolean emailExists = false;

        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(sql);
            ps.setString(1, email);

            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                emailExists = count > 0;
            }

        } catch (Exception e) {

        }

        return emailExists;
    }

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
                        rs.getBoolean(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10));
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public User updatePassword(String pass, int id) {
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

    //HUY
    public void insertProduct(Product product) {
        String sql = "INSERT INTO swp_demo.Product (name,"
                + " price, "
                + "categoryID, "
                + "description, "
                + "image1, "
                + "image2, "
                + "image3, "
                + "image4, "
                + "transaction_Fees,"
                + "contact_Method, "
                + "create_by, "
                + "hidden_content, "
                + "updated_by, "
                + "is_delete) "
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,0)";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setInt(3, product.getCategoryID());
            ps.setString(4, product.getDescription());
            ps.setString(5, product.getImage1());
            ps.setString(6, product.getImage2());
            ps.setString(7, product.getImage3());
            ps.setString(8, product.getImage4());
            ps.setBoolean(9, product.isTransaction_fee());
            ps.setString(10, product.getContact_Method());
            ps.setInt(11, product.getCreate_by());
            ps.setString(12, product.getHidden_content());
            ps.setInt(13, product.getCreate_by());
            ps.executeUpdate();

        } catch (Exception e) {

        }

    }

    public void insertOrder(intermediateOrders order) {
        String sql = "INSERT INTO swp_demo.intermediate_Orders (code, "
                + "productID, "
                + "total_received_amount, "
                + "total_paid_amount, "
                + "intermediary_fee, "
                + "status,"
                + " create_by, "
                + "updated_by, "
                + "is_delete) \n"
                + "VALUES \n"
                + "(?, ?, ?, ?, ?, ?, ?, ?, 0)";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(sql);
            ps.setString(1, order.getCode());
            ps.setInt(2, order.getProductId());
            ps.setDouble(3, order.getTotal_received_amount());
            ps.setDouble(4, order.getTotal_paid_amount());
            ps.setDouble(5, order.getIntermediary_fee());
            ps.setString(6, order.getStatus());
            ps.setInt(7, order.getCreate_by());
            ps.setInt(8, order.getUpdate_by());
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public int getIdProduct() {
        String query = "SELECT MAX(id) AS max_id FROM swp_demo.Product";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("max_id"); // Lấy giá trị id từ cột max_id trong ResultSet
                return id;
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public List<Product> getProductByUserID(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM swp_demo.product where create_by = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getBoolean(10),
                        rs.getString(11),
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getTimestamp(14),
                        rs.getInt(15),
                        rs.getTimestamp(16),
                        rs.getBoolean(17)));
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return list;
    }

    public intermediateOrders getOrderByProductID(int id) {
        String sql = "SELECT * FROM swp_demo.intermediate_orders\n"
                + "where productID =? ;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new intermediateOrders(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getDouble(5),
                        rs.getDouble(6),
                        rs.getDouble(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getTimestamp(10),
                        rs.getInt(11),
                         rs.getTimestamp(12),
                        rs.getBoolean(13));
            }
        } catch (Exception e) {

        }
        return null;

    }

    //BINH
    //HUE
    public void updateProfile(String email, String displayName, int id) {
        String sql = "UPDATE users SET display_name=?, email=? WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, displayName);
            // st.setString(2, password);
            st.setString(2, email);
            st.setInt(3, id);
            st.executeUpdate();
            // Execute the update query         
        } catch (SQLException e) {
            System.out.println(e);
        }
        //CHIEN
    }

    public void editUserByAdmin(int id, boolean is_Active) {
        String sql = "Update users set is_Active=? where id =? ";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, is_Active);
            ps.setInt(2, id);
            ps.executeUpdate();

        } catch (Exception e) {

        }

    }

    public void editUserGgByAdmin(String id, boolean is_Active) {
        String sql = "Update userGoogle set is_active=? where id =? ";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, is_Active);
            ps.setString(2, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }

    }

    public void changePassword(String password, String username) {
        String sql = "UPDATE users SET password=? WHERE username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, username);

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

    public boolean isEmailAlreadyExists(String email, int id) {

        String sql = "Select * from users where email = ? AND id != ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setInt(2, id);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    //BINH
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM swp_demo.product";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getBoolean(10),
                        rs.getString(11),
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getTimestamp(14),
                        rs.getInt(15),
                        rs.getTimestamp(16),
                        rs.getBoolean(17)));
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM swp_demo.category";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2),
                        rs.getTimestamp(3),
                        rs.getTimestamp(4),
                        rs.getBoolean(5)));

            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Product> getAllProductbyCategory(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM swp_demo.product\n"
                + "where categoryID=?;";
        try {
            con = new DBContext().connection;

            ps = con.prepareStatement(sql);
            ps.setInt(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getBoolean(10),
                        rs.getString(11),
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getTimestamp(14),
                        rs.getInt(15),
                        rs.getTimestamp(16),
                        rs.getBoolean(17)));
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return list;
    }

    public Category getCategoryById(int cid) {
        String sql = "SELECT * FROM swp_demo.category\n"
                + "where id=?;";
        try {
            con = new DBContext().connection;

            ps = con.prepareStatement(sql);
            ps.setInt(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1),
                        rs.getString(2),
                        rs.getTimestamp(3),
                        rs.getTimestamp(4),
                        rs.getBoolean(5));
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Product> getProductbyCategoryID(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "Select * from product as p inner join category as c\n"
                + "on p.categoryID=c.id where p.categoryID=?";
        try {
            con = new DBContext().connection;

            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {

                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getBoolean(10),
                        rs.getString(11),
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getTimestamp(14),
                        rs.getInt(15),
                        rs.getTimestamp(16),
                        rs.getBoolean(17)));
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return list;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
       

    }

}
