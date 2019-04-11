package jp.co;

import nablarch.core.beans.BeanUtil;
import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;

import java.util.ArrayList;
import java.util.List;

public class DogAction extends DbAccessSupport {

    public HttpResponse index(HttpRequest request, ExecutionContext context) {


        return new HttpResponse("/dog.jsp");
    }

    public HttpResponse search(HttpRequest request, ExecutionContext context) {

        DogForm form = BeanUtil.createAndCopy(DogForm.class, request.getParamMap());
        form.setResultCount(3);
        context.setRequestScopedVar("form", form);

        List<DogDto> searchResult = new ArrayList<>();
        searchResult.add(createDog());
        searchResult.add(createDog());
        searchResult.add(createDog());
        context.setRequestScopedVar("searchResult", searchResult);
        return new HttpResponse("/dog.jsp");
    }

    private DogDto createDog(){
        DogDto dto = new DogDto();
        dto.setName("one");
        dto.setPrice("1");
        dto.setMemo("waon.");
        return dto;
    }
}
