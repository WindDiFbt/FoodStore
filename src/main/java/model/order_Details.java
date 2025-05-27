/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Asus
 */
public class order_Details {

    private int order_id, price, amount;
    private product product;
    private String name, image;

    public order_Details() {
    }

    public order_Details(int order_id, int price, int amount, product product) {
        this.order_id = order_id;
        this.price = price;
        this.amount = amount;
        this.product = product;
    }

    public order_Details(int order_id, int price, int amount, String name, String image) {
        this.order_id = order_id;
        this.price = price;
        this.amount = amount;
        this.name = name;
        this.image = image;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public product getProduct() {
        return product;
    }

    public void setProduct(product product) {
        this.product = product;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "order_Details{" + "order_id=" + order_id + ", price=" + price + ", amount=" + amount + ", name=" + name + '}';
    }

}
