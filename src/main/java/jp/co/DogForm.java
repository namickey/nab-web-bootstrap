package jp.co;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Getter;
import nablarch.core.db.support.ListSearchInfo;
import nablarch.core.validation.ee.Digits;
import nablarch.core.validation.ee.Required;

@Data
public class DogForm extends ListSearchInfo {

    @Required
    private String name;


    @Digits(integer = 2)
    @Getter(AccessLevel.NONE)
    private Integer pageNumber;

    @Override
    public void setPageNumber(Integer pageNumber) {
        super.setPageNumber(pageNumber);
    }

    @Override
    public String[] getSearchConditionProps() {
        return new String[]{"name"};
    }
}
