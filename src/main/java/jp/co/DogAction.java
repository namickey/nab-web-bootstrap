package jp.co;

import nablarch.common.web.interceptor.InjectForm;
import nablarch.core.beans.BeanUtil;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.message.ApplicationException;
import nablarch.core.validation.ee.ValidatorUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
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
        //送りたいページング情報
        System.out.println(form.getPageNumber());
        System.out.println(form.getMax());

        //client呼び出しサンプル
        WebTarget target = ClientBuilder.newClient().target("http://localhost:5000").path("/");
        for(Map.Entry<String, Object> e : BeanUtil.createMapAndCopy(form).entrySet()) {
            target = target.queryParam(e.getKey(), e.getValue());
        }
        String result = target.request().accept(MediaType.APPLICATION_JSON_TYPE).get(String.class);
        System.out.println("result:" + result);
        //GET /?hasPrevPage=true&pageCount=0&resultCount=0&pageNumber=3&prevPageNumber=2&hasNextPage=false&max=20&startPosition=41&firstPageNumber=1&searchConditionProps=%5BLjava.lang.String%3B%40e5aef6c&endPosition=0&sortId=&name=foo&nextPageNumber=4&lastPageNumber=0&maxResultCount=200


        //ダミー
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