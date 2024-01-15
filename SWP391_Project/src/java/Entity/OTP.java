/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class OTP {
    private int id;
    private int userID;
    private String otp_Code;
    private Timestamp create_At;

    public OTP() {
    }

    public OTP(int id, int userID, String otp_Code, Timestamp create_At) {
        this.id = id;
        this.userID = userID;
        this.otp_Code = otp_Code;
        this.create_At = create_At;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getOtp_Code() {
        return otp_Code;
    }

    public void setOtp_Code(String otp_Code) {
        this.otp_Code = otp_Code;
    }

    public Timestamp getCreate_At() {
        return create_At;
    }

    public void setCreate_At(Timestamp create_At) {
        this.create_At = create_At;
    }

    @Override
    public String toString() {
        return "OTP{" + "id=" + id + ", userID=" + userID + ", otp_Code=" + otp_Code + ", create_At=" + create_At + '}';
    }
    
    
    
}
