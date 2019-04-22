package jp.co;

import lombok.Data;
import nablarch.core.validation.ee.Required;

import javax.validation.constraints.AssertTrue;
import java.io.Serializable;

@Data
public class DogEntryForm implements Serializable {

    @Required
    private String email;

    private String password;

    private String inputAddress;

    private String inputAddress2;

    private String gridCheck;

    //@AssertTrue(message = "{nablarch.core.validation.ee.Digits.message}")
    @AssertTrue(message = "emailとパスワードは同じ値を入力してください。") //メッセージIDでも動く。
    private boolean isValidEmailPassword() {
        if (email == null) {
            return true;
        }
        return email.equals(password);
    }
}
