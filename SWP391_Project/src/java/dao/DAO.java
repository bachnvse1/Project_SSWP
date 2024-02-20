/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Context.DBContext;
import Entity.Category;
import Entity.Feedback;
import Entity.Product;
import Entity.Report;
import Entity.User;
import Entity.Wallet;
import Entity.intermediateOrders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.*;
import java.sql.Timestamp;
import java.text.Normalizer;

/**
 *
 * @author ADMIN
 */
public class DAO extends DBContext {

    public Connection con = null; //connect to sql
    public PreparedStatement ps = null; //ném câu lệnh query sang sql
    public ResultSet rs = null; //nhận kết quả trả về

    public static String removeDiacritics(String str) {
        str = Normalizer.normalize(str, Normalizer.Form.NFD);
        str = str.replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
        return str;
    }

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

    public Report getReport(int oid) {
        String query = "select * from swp_demo.Report where orderID = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setInt(1, oid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Report(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getBoolean(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getTimestamp(7),
                        rs.getInt(8),
                        rs.getTimestamp(9),
                        rs.getBoolean(10));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public Report getReportByType(int type, int oid) {
        String query = "select * from swp_demo.Report where type_report = ? and orderID = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setInt(1, type);
            ps.setInt(2, oid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Report(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getBoolean(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getTimestamp(7),
                        rs.getInt(8),
                        rs.getTimestamp(9),
                        rs.getBoolean(10));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<Report> getListReport(int uid) {
        List<Report> list = new ArrayList<>();
        String query = "select * from swp_demo.Report where create_by = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setInt(1, uid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Report(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getBoolean(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getTimestamp(7),
                        rs.getInt(8),
                        rs.getTimestamp(9),
                        rs.getBoolean(10)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Report> getAllReport() {
        List<Report> list = new ArrayList<>();
        String query = "select * from swp_demo.Report";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Report(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getBoolean(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getTimestamp(7),
                        rs.getInt(8),
                        rs.getTimestamp(9),
                        rs.getBoolean(10)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public void editReportStatus(int id, boolean status) {
        String sql = "Update report set status=? where id =? ";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();

        } catch (Exception e) {

        }

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

    public void updateOrder(int buyer_id, String status, int updated_by, int pid) {
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
            ps.setInt(4, pid);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public Product getProductByID(int id) {

        String sql = "SELECT * FROM swp_demo.product where id = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
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
                        rs.getBoolean(17));
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void insertReport(int type, int orderID, boolean status, String description, int userID, boolean is_delete) {
        String query = "INSERT INTO Report (type_report, orderID, status, description, create_by, updated_by, is_delete)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setInt(1, type);
            ps.setInt(2, orderID);
            ps.setBoolean(3, status);
            ps.setString(4, description);
            ps.setInt(5, userID);
            ps.setInt(6, userID);
            ps.setBoolean(7, is_delete);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void deleteProduct(int id, boolean is_delete) {
        String query = "Update Product set is_delete = ? where id =? ";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setBoolean(1, is_delete);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void insertWallet(double balance, int uid) {
        String query = "INSERT INTO Wallet (balance, create_by, updated_by)\n"
                + "VALUES (?, ?, ?)";
        try {
             con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setDouble(1, balance);
            ps.setInt(2, uid);
            ps.setInt(3, uid);
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
    }

    public List<intermediateOrders> getOrderBuy(int bid) {
        List<intermediateOrders> list = new ArrayList<>();
        String sql = "SELECT * FROM swp_demo.intermediate_orders\n"
                + "where buyer_id =? ;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, bid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new intermediateOrders(rs.getInt(1),
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
                        rs.getBoolean(13)));
            }
        } catch (Exception e) {

        }
        return list;

    }

    public intermediateOrders getOrderByUser(int uid) {
        String sql = "SELECT * FROM swp_demo.intermediate_orders\n"
                + "where create_by = ? ;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, uid);
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

    public void updateAmount(double balance, int uid) {
        String sql = "UPDATE Wallet SET balance = ? WHERE create_by =?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setDouble(1, balance);
            ps.setInt(2, uid);
            ps.executeUpdate();
            // Execute the update query         
        } catch (SQLException e) {
            System.out.println(e);
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

    public List<Product> getProductByBuyerID(int bid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM swp_demo.product where buyer_id = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, bid);
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
        return null;
    }

    public List<Product> getProductByName(String name, int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM swp_demo.product WHERE LOWER(REPLACE(name, ' ', '')) LIKE ? AND create_by = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + removeDiacritics(name.toLowerCase()) + "%");
            ps.setInt(2, uid);
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

    public List<Product> getProductByFee(int fee, int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM swp_demo.product WHERE transaction_Fees = ? AND create_by =?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, fee);
            ps.setInt(2, uid);
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

    public List<Product> getProductByPrice(double price, int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM swp_demo.product WHERE price <= ? AND create_by =?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setDouble(1, price);
            ps.setInt(2, uid);
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

    public List<Product> getProductByHigherPrice(double price, int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM swp_demo.product WHERE price > ? AND create_by =?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setDouble(1, price);
            ps.setInt(2, uid);
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

    public Product getProductById(int id) {
        String sql = "SELECT * FROM swp_demo.product\n"
                + "where id =? ;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
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
                        rs.getBoolean(17));
            }

        } catch (Exception e) {

        }
        return null;

    }

    public List<intermediateOrders> getListOrderByCode(String code, int uid) {
        List<intermediateOrders> list = new ArrayList<>();
        String sql = "SELECT * FROM swp_demo.intermediate_orders\n"
                + "where code LIKE ? AND create_by =?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + code + "%");
            ps.setInt(2, uid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new intermediateOrders(
                        rs.getInt(1),
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
                        rs.getBoolean(13)
                ));
            }
        } catch (Exception e) {

        }
        return list;

    }

    public List<intermediateOrders> getOrderByStatus(String status, int uid) {
        List<intermediateOrders> list = new ArrayList<>();
        String sql = "SELECT * FROM swp_demo.intermediate_orders\n"
                + "where status LIKE ? AND create_by =?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + status + "%");
            ps.setInt(2, uid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new intermediateOrders(
                        rs.getInt(1),
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
                        rs.getBoolean(13)
                ));
            }
        } catch (Exception e) {

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
                        rs.getBoolean(13)
                );
            }
        } catch (Exception e) {

        }
        return null;

    }

    public intermediateOrders getOrderByID(int id) {
        String sql = "SELECT * FROM swp_demo.intermediate_orders\n"
                + "where id =? ;";
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

    public intermediateOrders getOrderByCode(String code) {
        String sql = "SELECT * FROM swp_demo.intermediate_orders\n"
                + "where code =? ;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, code);
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

    public void UpdateProductByProductID(int pid, Product product) {
        String sql = "UPDATE swp_demo.Product\n"
                + "SET \n"
                + "    name = ?,\n"
                + "    price = ?,\n"
                + "    categoryID = ?,\n"
                + "    description = ?,\n"
                + "    image1 = ?,\n"
                + "    image2 = ?,\n"
                + "    image3 =?,\n"
                + "    image4 = ?,\n"
                + "    transaction_Fees = ?,\n"
                + "    contact_Method = ?,\n"
                + "    hidden_content = ?,\n"
                + "    updated_by = ?,\n"
                + "    updated_at = CURRENT_TIMESTAMP,\n"
                + "WHERE \n"
                + "    id = ?;";
        try {
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
            ps.setString(11, product.getHidden_content());
            ps.setInt(12, product.getUpdate_by());
            ps.setInt(13, pid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }

    }

    public void UpdateOrdersByID(int id, intermediateOrders Order) {
        String sql = "UPDATE swp_demo.intermediate_Orders\n"
                + "SET\n"
                + "    total_received_amount = ?, \n"
                + "    total_paid_amount = ?, \n"
                + "    intermediary_fee = ?, \n"
                + "    updated_by = ?,\n"
                + "    updated_at = CURRENT_TIMESTAMP \n"
                + "WHERE\n"
                + "    code = ?;";
        try {
            ps = con.prepareStatement(sql);
            ps.setDouble(1, Order.getTotal_received_amount());
            ps.setDouble(2, Order.getTotal_paid_amount());
            ps.setDouble(3, Order.getIntermediary_fee());
            ps.setInt(4, Order.getUpdate_by());
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
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

    }

    public Product getProductDetailsById(int id) {
        Product p = null;
        String sql = "SELECT * FROM swp_demo.product\n"
                + "where id=?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                p = (new Product(rs.getInt(1),
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
        } catch (Exception e) {
            System.out.println(e);
        }
        return p;
    }

    public ArrayList<Feedback> getFeedbackList() {
        ArrayList<Feedback> list = new ArrayList<>();
        try {
            String sql = "SELECT f.*, u.username FROM swp_demo.feedback f JOIN swp_demo.users u ON f.user_id = u.id";
            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (true) {
                if (rs.next()) {
                    list.add(new Feedback(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getTimestamp(4), rs.getInt(5), rs.getInt(6), rs.getString(7)));
                } else {
                    break;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void createFeedback(int user_id, String title, String content) {
        try {
            String sql = "INSERT INTO swp_demo.feedback (user_id, title, content, create_at) VALUES (?, ?, ?, NOW());";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setString(2, title);
            st.setString(3, content);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateFeedback(int id, int user_id, String title, String content) {
        try {
            String sql = "UPDATE swp_demo.feedback\n"
                    + "SET user_id = ?\n"
                    + "    ,title = ?\n"
                    + "    ,content = ?\n"
                    + "    ,create_at = NOW() \n"
                    + "WHERE id = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setString(2, title);
            st.setString(3, content);
            st.setInt(4, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteFeedback(int id) {
        try {
            String sql = "DELETE FROM  swp_demo.feedback\n"
                    + "      WHERE id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
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
        String sql = "SELECT * FROM swp_demo.product where is_delete = false";
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

    public List<Product> getAllProductbyName(String name) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM swp_demo.product where name like ? and is_delete = false";
        try {
            con = new DBContext().connection;

            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
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

    public List<Product> getProductbyCategoryID(String id) {
        List<Product> list = new ArrayList<>();
        String sql = "Select * from product as p inner join category as c\n"
                + "on p.categoryID=c.id where p.categoryID=? and p.is_delete = 0";
        try {
            con = new DBContext().connection;

            ps = con.prepareStatement(sql);
            ps.setString(1, id);
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

    public Wallet getWallet(int uid) {
        String query = "Select * from Wallet where create_by = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, uid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Wallet(rs.getInt(1),
                        rs.getDouble(2),
                        rs.getInt(3),
                        rs.getTimestamp(4),
                        rs.getInt(5),
                        rs.getTimestamp(6));
            }
        } catch (Exception e) {

        }
        return null;

    }

    public void insertCategory(String name) {
        String query = "INSERT INTO `swp_demo`.`category` (`name`) VALUES (?)";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void DeleteCategory(String id) {
        String query = "DELETE FROM `swp_demo`.`category` WHERE id = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        dao.insertWallet(5000000, 4);
    }
}
