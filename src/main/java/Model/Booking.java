package Model;

import java.util.Date;

public class Booking {

    private int bookingId;
    private int tourPackageId;
    private int userId;
    private String bookingDate;
    private int noOfAdults;
    private Date startDate;
    private String otherSuggestions;
    private String status;
    private String tourPackageName;
    private String tourPackageDescription;
    private String tourPackageDuration;
    private Double tourPackagePrice;
    private String tourPackageStatus;
    private String customerName;
    private String customerEmail;
    private String customerMobile;
    private String customerCountry;

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getTourPackageId() {
        return tourPackageId;
    }

    public void setTourPackageId(int tourPackageId) {
        this.tourPackageId = tourPackageId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public int getNoOfAdults() {
        return noOfAdults;
    }

    public void setNoOfAdults(int noOfAdults) {
        this.noOfAdults = noOfAdults;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public String getOtherSuggestions() {
        return otherSuggestions;
    }

    public void setOtherSuggestions(String otherSuggestions) {
        this.otherSuggestions = otherSuggestions;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTourPackageName() {
        return tourPackageName;
    }

    public void setTourPackageName(String tourPackageName) {
        this.tourPackageName = tourPackageName;
    }

    public String getTourPackageDescription() {
        return tourPackageDescription;
    }

    public void setTourPackageDescription(String tourPackageDescription) {
        this.tourPackageDescription = tourPackageDescription;
    }

    public String getTourPackageDuration() {
        return tourPackageDuration;
    }

    public void setTourPackageDuration(String tourPackageDuration) {
        this.tourPackageDuration = tourPackageDuration;
    }

    public Double getTourPackagePrice() {
        return tourPackagePrice;
    }

    public void setTourPackagePrice(Double tourPackagePrice) {
        this.tourPackagePrice = tourPackagePrice;
    }

    public String getTourPackageStatus() {
        return tourPackageStatus;
    }

    public void setTourPackageStatus(String tourPackageStatus) {
        this.tourPackageStatus = tourPackageStatus;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerMobile() {
        return customerMobile;
    }

    public void setCustomerMobile(String customerMobile) {
        this.customerMobile = customerMobile;
    }

    public String getCustomerCountry() {
        return customerCountry;
    }

    public void setCustomerCountry(String customerCountry) {
        this.customerCountry = customerCountry;
    }
}
