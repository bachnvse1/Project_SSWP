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
<<<<<<< HEAD
    public String id;
    public String email;
    public boolean is_active;
    public String given_name;
=======

    private String idgg;
    private String email;
    private String name;
    public boolean is_Active;
>>>>>>> origin/branch-khoa
    public Timestamp create_At;
    public Timestamp update_At;
    
    public userGoogle() {

    }

<<<<<<< HEAD
    public userGoogle(String id, String email, boolean is_active, String given_name, Timestamp create_At, Timestamp update_At) {
        this.id = id;
        this.email = email;
        this.is_active = is_active;
        this.given_name = given_name;
=======
    public userGoogle(String id, String email, String name, boolean is_Active, Timestamp create_At, Timestamp update_At) {
        this.idgg = id;
        this.email = email;
        this.name = name;
        this.is_Active = is_Active;
>>>>>>> origin/branch-khoa
        this.create_At = create_At;
        this.update_At = update_At;
    }

    public String getId() {
        return idgg;
    }

    public void setId(String idgg) {
        this.idgg = idgg;
    }


    public String getEmail() {
        return email;
    }


    public void setEmail(String email) {
        this.email = email;
    }

<<<<<<< HEAD
    public boolean isIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
    }

=======
    public String getName() {
        return name;
    }
>>>>>>> origin/branch-khoa


    public boolean isIs_Active() {
        return is_Active;
    }

    public void setIs_Active(boolean is_Active) {
        this.is_Active = is_Active;
    }

<<<<<<< HEAD
  
=======
>>>>>>> origin/branch-khoa
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
<<<<<<< HEAD
        return "userGoogle{" + "id=" + id  + ", email=" + email + ", is_active=" + is_active +  "given_name=" + given_name +  ", create_At="  + create_At + ", update_At=" + update_At + '}';
=======
        return "userGoogle{" + "id=" + idgg + ", email=" + email + ", name=" + name + ", is_Active=" + is_Active + ", create_At=" + create_At + ", update_At=" + update_At + '}';
>>>>>>> origin/branch-khoa
    }

}
