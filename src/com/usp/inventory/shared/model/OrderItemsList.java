package com.usp.inventory.shared.model;

import java.util.List;

public class OrderItemsList {

    private String cursor;
    
    private List<OrderItem> orders;

    public String getCursor() {
        return cursor;
    }

    public void setCursor(String cursor) {
        this.cursor = cursor;
    }

    public List<OrderItem> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderItem> orders) {
        this.orders = orders;
    }
}
