/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Asus
 */
public class product_detail {

    private int product_id, pro_options_id, weight, price;

    public product_detail(int product_id, int pro_options_id, int weight, int price) {
        this.product_id = product_id;
        this.pro_options_id = pro_options_id;
        this.weight = weight;
        this.price = price;
    }

    public int getPro_options_id() {
        return pro_options_id;
    }

    public void setPro_options_id(int pro_options_id) {
        this.pro_options_id = pro_options_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "product_detail{" + "product_id=" + product_id + ", pro_options_id=" + pro_options_id + ", weight=" + weight + ", price=" + price + '}';
    }
}
