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
public class userGoogle {
    public boolean is_active;
    public String given_name;
    private String idgg;
    private String email;
    public Timestamp create_At;
    public Timestamp update_At;
    
    public userGoogle() {

    }


    public userGoogle(String id, String given_name, String email, boolean is_active, Timestamp create_At, Timestamp update_At) {
        this.email = email;
        this.is_active = is_active;
        this.given_name = given_name;
        this.idgg = id;
        this.email = email;
        this.create_At = create_At;
        this.update_At = update_At;
    }

    public boolean isIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
    }

    public String getGiven_name() {
        return given_name;
    }

    public void setGiven_name(String given_name) {
        this.given_name = given_name;
    }

    public String getIdgg() {
        return idgg;
    }

    public void setIdgg(String idgg) {
        this.idgg = idgg;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Timestamp getCreate_At() {
        return create_At;
    }

    public void setCreate_At(Timestamp create_At) {
        this.create_At = create_At;
    }

    public Timestamp getUpdate_At() {
        return update_At;
    }

    public void setUpdate_At(Timestamp update_At) {
        this.update_At = update_At;
    }

    @Override
    public String toString() {
        return "userGoogle{" + "is_active=" + is_active + ", given_name=" + given_name + ", idgg=" + idgg + ", email=" + email + ", name="  + ", create_At=" + create_At + ", update_At=" + update_At + '}';
    }

   

}
