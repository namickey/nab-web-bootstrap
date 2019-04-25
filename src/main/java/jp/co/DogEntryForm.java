package jp.co;

import java.io.Serializable;
import java.util.Map;

public class DogEntryForm implements Serializable {

    private String email;
    private String password;
    private String inputAddress;
    private String inputAddress2;
    private String gridCheck;

    public DogEntryForm(Map<String, Object> params){
        email = (String)params.get("email");
        password = (String)params.get("password");
        inputAddress = (String)params.get("inputAddress");
        inputAddress2 = (String)params.get("inputAddress2");
        gridCheck = (String)params.get("gridCheck");
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getInputAddress() {
        return inputAddress;
    }

    public void setInputAddress(String inputAddress) {
        this.inputAddress = inputAddress;
    }

    public String getInputAddress2() {
        return inputAddress2;
    }

    public void setInputAddress2(String inputAddress2) {
        this.inputAddress2 = inputAddress2;
    }

    public String getGridCheck() {
        return gridCheck;
    }

    public void setGridCheck(String gridCheck) {
        this.gridCheck = gridCheck;
    }
}
