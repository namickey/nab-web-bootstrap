package jp.co;

import nablarch.common.web.interceptor.InjectForm;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.message.ApplicationException;
import nablarch.core.validation.ee.ValidatorUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;

public class DogAction extends DbAccessSupport {

    public HttpResponse index(HttpRequest request, ExecutionContext context) {
        DogForm form = new DogForm();
        form.setName("foo");
        context.setRequestScopedVar("form", form);
        return new HttpResponse("/dog.jsp");
    }

    @InjectForm(form = DogForm.class, prefix = "form")
    @OnError(type = ApplicationException.class, path = "/dog.jsp")
    public HttpResponse search(HttpRequest request, ExecutionContext context) {

        DogForm form = context.getRequestScopedVar("form");
        ValidatorUtil.validate(form);

        List<DogDto> searchResult = callApi(form);

        int dummyTotalCountFromApiResult = 100;
        form.setResultCount(dummyTotalCountFromApiResult);

        context.setRequestScopedVar("form", form);
        context.setRequestScopedVar("searchResult", searchResult);
        return new HttpResponse("/dog.jsp");
    }

    private List<DogDto> callApi(DogForm form){
        System.out.println(form.getPageNumber());
        System.out.println(form.getMax());

        List<DogDto> searchResult = new ArrayList<>();
        IntStream.range(0, 20).forEach(i -> searchResult.add(createDog()));

        return searchResult;
    }

    private DogDto createDog(){
        DogDto dto = new DogDto();
        dto.setName("one");
        dto.setPrice("1");
        dto.setMemo("waon.");
        return dto;
    }
}
