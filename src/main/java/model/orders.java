/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author Asus
 */
public class orders {

    private int order_id, user_id;
    private String fullname, email, phone_number, address, note;
    private Timestamp order_date;
    private List<order_Details> list;
    private int status, total_money;

    public orders(int order_id, int user_id, String fullname, String email, String phone_number, String address, String note, Timestamp order_date, List<order_Details> list, int status, int total_money) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.fullname = fullname;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.note = note;
        this.order_date = order_date;
        this.list = list;
        this.status = status;
        this.total_money = total_money;
    }

    public orders(int user_id, String fullname, String email, String phone_number, String address, String note, Timestamp order_date, int status, int total_money) {
        this.user_id = user_id;
        this.fullname = fullname;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.note = note;
        this.order_date = order_date;
        this.status = status;
        this.total_money = total_money;
    }

    public orders(int order_id, int user_id, String fullname, String email, String phone_number, String address, String note, Timestamp order_date, int status, int total_money) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.fullname = fullname;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.note = note;
        this.order_date = order_date;
        this.status = status;
        this.total_money = total_money;
    }

    public orders() {
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Timestamp getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Timestamp order_date) {
        this.order_date = order_date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getTotal_money() {
        return total_money;
    }

    public void setTotal_money(int total_money) {
        this.total_money = total_money;
    }

    public List<order_Details> getList() {
        return list;
    }

    public void setList(List<order_Details> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "orders{" + "order_id=" + order_id + ", user_id=" + user_id + ", fullname=" + fullname + ", email=" + email + ", phone_number=" + phone_number + ", address=" + address + ", note=" + note + ", order_date=" + order_date + ", list=" + list + ", status=" + status + ", total_money=" + total_money + '}';
    }
}
