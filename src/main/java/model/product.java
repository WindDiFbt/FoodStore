/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author Asus
 */
public class product {

    private int product_id, category_id;
    private String name;
    private int discount;
    private String image, ingredient, user_manual, more_info;
    private Timestamp created_at, updated_at;
    private int deleted, price, weight;

    public product(int product_id, int category_id, String name, int discount, String image, String ingredient,
            String user_manual, String more_info, Timestamp created_at, Timestamp updated_at, int deleted, int price, int weight) {
        this.product_id = product_id;
        this.category_id = category_id;
        this.name = name;
        this.discount = discount;
        this.image = image;
        this.ingredient = ingredient;
        this.user_manual = user_manual;
        this.more_info = more_info;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.deleted = deleted;
        this.price = price;
        this.weight = weight;
    }

    public product(int category_id, String name, int discount, String image, String ingredient, String user_manual,
            String more_info, Timestamp created_at, Timestamp updated_at, int deleted, int price, int weight) {
        this.category_id = category_id;
        this.name = name;
        this.discount = discount;
        this.image = image;
        this.ingredient = ingredient;
        this.user_manual = user_manual;
        this.more_info = more_info;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.deleted = deleted;
        this.price = price;
        this.weight = weight;
    }

    public product(int product_id, int category_id, String name, int discount, String image, String ingredient, String user_manual, String more_info, Timestamp updated_at, int price, int weight) {
        this.product_id = product_id;
        this.category_id = category_id;
        this.name = name;
        this.discount = discount;
        this.image = image;
        this.ingredient = ingredient;
        this.user_manual = user_manual;
        this.more_info = more_info;
        this.updated_at = updated_at;
        this.price = price;
        this.weight = weight;
    }

    public product() {
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getIngredient() {
        return ingredient;
    }

    public void setIngredient(String ingredient) {
        this.ingredient = ingredient;
    }

    public String getUser_manual() {
        return user_manual;
    }

    public void setUser_manual(String user_manual) {
        this.user_manual = user_manual;
    }

    public String getMore_info() {
        return more_info;
    }

    public void setMore_info(String more_info) {
        this.more_info = more_info;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;

    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    @Override
    public String toString() {
        return "product{" + "product_id=" + product_id + ", category_id=" + category_id + ", name=" + name + ", discount=" + discount + ", image=" + image + ", ingredient=" + ingredient + ", user_manual=" + user_manual + ", more_info=" + more_info + ", created_at=" + created_at + ", updated_at=" + updated_at + ", deleted=" + deleted + ", price=" + price + ", weight=" + weight + '}';
    }

}
