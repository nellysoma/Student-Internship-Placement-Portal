/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author harmony
 */
public class Company {
    
    private String company_id;
    private String company_name;
    private String rc_number;
    private String address;
    private String industry;
    private String email;
    private String phone;
    private String password;
    private String verification_status;
    private String role;
    private String rowNumber;

    public String getCompanyId() {
        return company_id;
    }

    public String setCompanyId(String company_id) {
        this.company_id = company_id;
        return this.company_id;
    }

    public String getCompanyName() {
        return company_name;
    }

    public String setCompanyName(String company_name) {
        this.company_name = company_name;
        return this.company_name;
    }

    public String getRcNumber() {
        return rc_number;
    }

    public String setRcNumber(String rc_number) {
        this.rc_number = rc_number;
        return this.rc_number;
    }

    public String getAddress() {
        return address;
    }

    public String setAddress(String address) {
        this.address = address;
        return this.address;
    }

    public String getIndustry() {
        return industry;
    }

    public String setIndustry(String industry) {
        this.industry = industry;
        return this.industry;
    }

    public String getEmail() {
        return email;
    }

    public String setEmail(String email) {
        this.email = email;
        return this.email;
    }

    public String getPhone() {
        return phone;
    }

    public String setPhone(String phone) {
        this.phone = phone;
        return this.phone;
    }

    public String getPassword() {
        return password;
    }

    public String setPassword(String password) {
        this.password = password;
        return this.password;
    }

    public String getVerificationStatus() {
        return verification_status;
    }

    public String setVerificationStatus(String verification_status) {
        this.verification_status = verification_status;
        return this.verification_status;
    }

    public String getRole() {
        return role;
    }

    public String setRole(String role) {
        this.role = role;
        return this.role;
    }

    public String getRowNumber() {
        return rowNumber;
    }

    public String setRowNumber(String rowNumber) {
        this.rowNumber = rowNumber;
        return this.rowNumber;
    }
    
    
    
}
