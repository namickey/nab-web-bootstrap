package jp.co.dog;

import nablarch.core.validation.ValidateFor;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;
import nablarch.core.validation.validator.Required;

import java.io.Serializable;
import java.util.Map;

public class LoginForm implements Serializable {

    private String id;
    private String pass;

    public LoginForm(Map<String, Object> params){
        id = (String) params.get("id");
        pass = (String) params.get("pass");
    }

    public String getId() {
        return id;
    }

    @Required
    public void setId(String id) {
        this.id = id;
    }

    public String getPass() {
        return pass;
    }

    @Required
    public void setPass(String pass) {
        this.pass = pass;
    }

    @ValidateFor("validate")
    public static void validate(ValidationContext<LoginForm> context) {
        ValidationUtil.validate(context, new String[] {"id", "pass"});
    }
}
