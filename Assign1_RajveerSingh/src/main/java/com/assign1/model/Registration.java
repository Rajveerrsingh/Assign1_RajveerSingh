package com.assign1.model;

public class Registration {
    private String userId;
    private String password;
    private String name;
    private String address;
    private String country;
    private String zip;
    private String email;
    private String sex;
    private String[] languages;
    private String about;

    public Registration() {}

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }
    public String getZip() { return zip; }
    public void setZip(String zip) { this.zip = zip; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getSex() { return sex; }
    public void setSex(String sex) { this.sex = sex; }
    public String[] getLanguages() { return languages; }
    public void setLanguages(String[] languages) { this.languages = languages; }
    public String getAbout() { return about; }
    public void setAbout(String about) { this.about = about; }

    public String getLanguagesAsString() {
        return (languages == null) ? "" : String.join(", ", languages);
    }
}