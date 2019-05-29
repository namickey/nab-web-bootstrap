package jp.co.dog;

import java.io.Serializable;

public class UserContext implements Serializable {

    private String name;

    private String loginTime;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(String loginTime) {
        this.loginTime = loginTime;
    }
}
