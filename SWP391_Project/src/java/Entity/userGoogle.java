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
    public String id;
    public String name;
    public String email;
    public boolean is_active;
    public String given_name;
    public Timestamp create_At;
    public Timestamp update_At;
    
    public userGoogle() {
        
    }

    public userGoogle(String id, String name, String email, boolean is_active, String given_name, Timestamp create_At, Timestamp update_At) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.is_active = is_active;
        this.given_name = given_name;
        this.create_At = create_At;
        this.update_At = update_At;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
        return "userGoogle{" + "id=" + id + ", name=" + name + ", email=" + email + ", is_active=" + is_active + ", given_name=" + given_name + ", create_At=" + create_At + ", update_At=" + update_At + '}';
    }
}
