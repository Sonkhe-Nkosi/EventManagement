package com.umpdevelopers.registration;

//import java.util.Date;

public class EventsBean {
    private int id;
    private String name;
    private java.sql.Date date;
    private String location;
    private String description;
    private byte[] image;

    // Constructor
    public EventsBean(int id, String name, java.sql.Date date, String location, String description, byte[] image) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.location = location;
        this.description = description;
        this.image = image;
    }

    // Getters and Setters
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

    public java.sql.Date getDate() {
        return date;
    }

    public void setDate(java.sql.Date date) {
        this.date = date;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description != null ? description : "No description available";
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }
}
