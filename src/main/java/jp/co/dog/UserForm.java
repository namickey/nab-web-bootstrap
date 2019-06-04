package jp.co.dog;

import nablarch.core.db.support.ListSearchInfo;
import nablarch.core.validation.PropertyName;
import nablarch.core.validation.ValidateFor;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;
import nablarch.core.validation.convertor.Digits;
import nablarch.core.validation.validator.NumberRange;

import java.util.Map;

public class UserForm extends ListSearchInfo {

    private String id;
    private String userName;

    public UserForm(Map<String, Object> params) {
        id = (String)params.get("id");
        userName = (String)params.get("userName");
        setPageNumber((Integer) params.get("pageNumber"));
    }

    @PropertyName("ページ番号")
    @NumberRange(max = 20, min = 1)
    @Digits(integer = 2)
    @Override
    public void setPageNumber(Integer pageNumber) {
        super.setPageNumber(pageNumber);
    }

    private static final String[] SEARCH_COND_PROPS = new String[]{"pageNumber"};

    @ValidateFor("validate")
    public static void validate(ValidationContext<UserForm> context) {
        ValidationUtil.validate(context, new String[] {"id", "userName", "pageNumber"});
    }

    @Override
    public String[] getSearchConditionProps() {
        return SEARCH_COND_PROPS;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
