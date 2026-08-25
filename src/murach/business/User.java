package murach.business;

import java.io.Serializable;

public class User implements Serializable {
    private String firstName;
    private String lastName;
    private String email;
    private String dob;
    private String hearFrom;
    private String wantsUpdates;
    private String contactMethod;

    // Constructor không tham số (Bắt buộc đối với JavaBean)
    public User() {
        this.firstName = "";
        this.lastName = "";
        this.email = "";
        this.dob = "";
        this.hearFrom = "";
        this.wantsUpdates = "";
        this.contactMethod = "";
    }

    // Constructor đầy đủ tham số
    public User(String firstName, String lastName, String email, String dob,
                String hearFrom, String wantsUpdates, String contactMethod) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.dob = dob;
        this.hearFrom = hearFrom;
        this.wantsUpdates = wantsUpdates;
        this.contactMethod = contactMethod;
    }

    // Getter và Setter cho First Name
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    // Getter và Setter cho Last Name
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    // Getter và Setter cho Email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter và Setter cho Date of Birth (Sửa lỗi Property [dob] not found)
    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    // Getter và Setter cho Hear From
    public String getHearFrom() {
        return hearFrom;
    }

    public void setHearFrom(String hearFrom) {
        this.hearFrom = hearFrom;
    }

    // Getter và Setter cho Wants Updates
    public String getWantsUpdates() {
        return wantsUpdates;
    }

    public void setWantsUpdates(String wantsUpdates) {
        this.wantsUpdates = wantsUpdates;
    }

    // Getter và Setter cho Contact Method
    public String getContactMethod() {
        return contactMethod;
    }

    public void setContactMethod(String contactMethod) {
        this.contactMethod = contactMethod;
    }
}