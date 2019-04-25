package jp.co;

import nablarch.core.db.support.ListSearchInfo;
import nablarch.core.validation.PropertyName;
import nablarch.core.validation.ValidateFor;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;
import nablarch.core.validation.convertor.Digits;
import nablarch.core.validation.validator.NumberRange;

import java.util.Map;

public class DogForm extends ListSearchInfo {

    private String dogName;
    private String key;

    public DogForm(){

    }

    public DogForm(Map<String, Object> params) {
        dogName = (String)params.get("dogName");
        key = (String)params.get("key");
        setPageNumber((Integer) params.get("pageNumber"));
    }

    @PropertyName("ページ番号")
    @NumberRange(max = 10, min = 1)
    @Digits(integer = 2)
    @Override
    public void setPageNumber(Integer pageNumber) {
        super.setPageNumber(pageNumber);
    }

    private static final String[] SEARCH_COND_PROPS = new String[]{"pageNumber"};

    @ValidateFor("validate")
    public static void validate(ValidationContext<DogForm> context) {
        ValidationUtil.validate(context, new String[] {"dogName", "key", "pageNumber"});
    }

    @Override
    public String[] getSearchConditionProps() {
        return SEARCH_COND_PROPS;
    }

    public String getDogName() {
        return dogName;
    }

    public void setDogName(String dogName) {
        this.dogName = dogName;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}
