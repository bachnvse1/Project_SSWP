/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Context.DBContext;
import Entity.Transaction;
import Entity.Wallet;
import Entity.vnpay_Transaction;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class VNPAYDAO {

    public Connection con = null; //connect to sql
    public PreparedStatement ps = null; //ném câu lệnh query sang sql
    public ResultSet rs = null; //nhận kết quả trả về

    public void setStatus(String status, Wallet wallet) {
        String sql = "insert into dtb_demo.vnpay_Transaction(status, Wallet_id) values (?,?)";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, wallet.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void setTransactionVnpay(vnpay_Transaction transaction) {
        String sql = "insert into vnpay_Transaction(status,Wallet_id,Payment_code,Time,Description,BankCode) values (?,?,?,?,?,?)";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(sql);
            ps.setString(1, transaction.getStatus());
            ps.setInt(2, transaction.getWallet_id());
            ps.setString(3, transaction.getPayment_Code());
            ps.setString(4, transaction.getTime());
            ps.setString(5, transaction.getDescription());
            ps.setString(6, transaction.getBankCode());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<vnpay_Transaction> getListTransaction(Wallet wallet) {
        String sql = "select * from vnpay_Transaction where Wallet_id = ?";
        List<vnpay_Transaction> a = new ArrayList<>();
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(sql);
            ps.setInt(1, wallet.getId());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a.add(new vnpay_Transaction(rs.getString("Status"), rs.getInt("Wallet_id"), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }
    
    public List<vnpay_Transaction> loadTransaction(Wallet wallet, vnpay_Transaction a){
        List<vnpay_Transaction> list = new ArrayList<>();
        String sql = "select * from vnpay_Transaction where wallet_id = ? and status = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(sql);
            ps.setInt(1, wallet.getId());
            ps.setString(2, a.getStatus());
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new vnpay_Transaction(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateStatus(Wallet wallet, String payment_code, String status) {
        String sql = "update dtb_demo.vnpay_Transaction set status = ? where Wallet_id = ? and Payment_code = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, wallet.getId());
            ps.setString(3, payment_code);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        
    }
}
