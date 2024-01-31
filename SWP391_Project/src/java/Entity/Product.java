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
public class Product {
    public int id;
    public String name;
    public double price;
    public int CategoryID;
    public String Description;
    public String image;
    public int create_by;
    public int update_by;
    public Timestamp create_At;
    public Timestamp update_At;
    public boolean is_delete;

    public Product() {
    }

    public Product(int id, String name, double price, int CategoryID, String Description, String image, int create_by,  Timestamp create_At, int update_by, Timestamp update_At, boolean is_delete) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.CategoryID = CategoryID;
        this.Description = Description;
        this.image = image;
        this.create_by = create_by;
        this.update_by = update_by;
        this.create_At = create_At;
        this.update_At = update_At;
        this.is_delete = is_delete;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCreate_by() {
        return create_by;
    }

    public void setCreate_by(int create_by) {
        this.create_by = create_by;
    }

    public int getUpdate_by() {
        return update_by;
    }

    public void setUpdate_by(int update_by) {
        this.update_by = update_by;
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

    public boolean isIs_delete() {
        return is_delete;
    }

    public void setIs_delete(boolean is_delete) {
        this.is_delete = is_delete;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + ", CategoryID=" + CategoryID + ", Description=" + Description + ", image=" + image + ", create_by=" + create_by + ", update_by=" + update_by + ", create_At=" + create_At + ", update_At=" + update_At + ", is_delete=" + is_delete + '}';
    }
    
    
    
}


