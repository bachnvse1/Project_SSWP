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

    private String id;
    private String email;
    private String name;
    public boolean is_Active;
    public Timestamp create_At;
    public Timestamp update_At;
    
    public userGoogle() {

    }

    public userGoogle(String id, String email, String name, boolean is_Active, Timestamp create_At, Timestamp update_At) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.is_Active = is_Active;
        this.create_At = create_At;
        this.update_At = update_At;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isIs_Active() {
        return is_Active;
    }

    public void setIs_Active(boolean is_Active) {
        this.is_Active = is_Active;
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
        return "userGoogle{" + "id=" + id + ", email=" + email + ", name=" + name + ", is_Active=" + is_Active + ", create_At=" + create_At + ", update_At=" + update_At + '}';
    }

}
