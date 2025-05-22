package Model;

public class TourPackage {
    private int tourPackageId;
    private int guideId;
    private String packageName;
    private String description;
    private String duration;
    private Double price;
    private int status;
    private String guideName;
    private String guideEmail;
    private String guideMobile;
    private String guideCountry;

    public int getTourPackageId() {
        return tourPackageId;
    }

    public void setTourPackageId(int tourPackageId) {
        this.tourPackageId = tourPackageId;
    }

    public int getGuideId() {
        return guideId;
    }

    public void setGuideId(int guideId) {
        this.guideId = guideId;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getGuideName() {
        return guideName;
    }

    public void setGuideName(String guideName) {
        this.guideName = guideName;
    }

    public String getGuideEmail() {
        return guideEmail;
    }

    public void setGuideEmail(String guideEmail) {
        this.guideEmail = guideEmail;
    }

    public String getGuideMobile() {
        return guideMobile;
    }

    public void setGuideMobile(String guideMobile) {
        this.guideMobile = guideMobile;
    }

    public String getGuideCountry() {
        return guideCountry;
    }

    public void setGuideCountry(String guideCountry) {
        this.guideCountry = guideCountry;
    }
}
