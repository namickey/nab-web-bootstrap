package jp.co;

import lombok.Data;
import nablarch.core.db.support.ListSearchInfo;

@Data
public class DogForm extends ListSearchInfo {

    private String name;

    @Override
    public String[] getSearchConditionProps() {
        return new String[]{"name"};
    }
}
