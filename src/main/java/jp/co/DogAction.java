package jp.co;

import nablarch.common.dao.DeferredEntityList;
import nablarch.common.dao.UniversalDao;
import nablarch.common.databind.ObjectMapper;
import nablarch.common.databind.ObjectMapperFactory;
import nablarch.common.web.download.FileResponse;
import nablarch.common.web.interceptor.InjectForm;
import nablarch.common.web.session.SessionUtil;
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
import java.io.IOException;
import java.io.UncheckedIOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import java.util.stream.IntStream;

public class DogAction extends DbAccessSupport {

    public HttpResponse index(HttpRequest request, ExecutionContext context) {
        DogForm form = new DogForm();
        form.setDogName("ワン");
        context.setRequestScopedVar("form", form);
        return new HttpResponse("/top.jsp");
    }

    @InjectForm(form = DogForm.class, prefix = "form")
    @OnError(type = ApplicationException.class, path = "/top.jsp")
    public HttpResponse find(HttpRequest request, ExecutionContext context) {

        DogForm form = context.getRequestScopedVar("form");

        System.out.println(form.getDogName());

        context.setRequestScopedVar("form", form);
        SessionUtil.put(context, "name", form.getDogName(), "hidden");
        SessionUtil.put(context, "form", form, "hidden");

        return new HttpResponse("/dogFind.jsp");
    }

    public HttpResponse some(HttpRequest request, ExecutionContext context) {
        return new HttpResponse("/dogFind.jsp");
    }

    public HttpResponse entry(HttpRequest request, ExecutionContext context) {
        return new HttpResponse("/dogEntry.jsp");
    }

    @InjectForm(form = DogEntryForm.class, prefix = "form", validate = "validate")
    @OnError(type=ApplicationException.class, path = "/dogEntry.jsp")
    public HttpResponse entryDog(HttpRequest request, ExecutionContext context) {
        DogEntryForm form = context.getRequestScopedVar("form");
        System.out.println(form.getEmail());

        DogForm form2 = new DogForm();
        form2.setDogName((String)SessionUtil.get(context, "name"));
        context.setRequestScopedVar("form", form2);
        return new HttpResponse("forward:///action/dog/search");
    }

    @OnError(type = ApplicationException.class, path = "/dog.jsp")
    public HttpResponse search(HttpRequest request, ExecutionContext context) {

        DogForm form = SessionUtil.get(context, "form");
        List<DogDto> searchResult = callApi(form);

        int dummyTotalCountFromApiResult = 100;
        form.setResultCount(dummyTotalCountFromApiResult);

        context.setRequestScopedVar("searchResult", searchResult);
        return new HttpResponse("/dogSearch.jsp");
    }

    private List<DogDto> callApi(DogForm form){
        //送りたいページング情報
        System.out.println(form.getPageNumber());
        System.out.println(form.getMax());

        //client呼び出しサンプル
//        WebTarget target = ClientBuilder.newClient().target("http://localhost:5000").path("/");
//        for(Map.Entry<String, Object> e : BeanUtil.createMapAndCopy(form).entrySet()) {
//            target = target.queryParam(e.getKey(), e.getValue());
//        }
//        String result = target.request().accept(MediaType.APPLICATION_JSON_TYPE).get(String.class);
//        System.out.println("result:" + result);
        //GET /?hasPrevPage=true&pageCount=0&resultCount=0&pageNumber=3&prevPageNumber=2&hasNextPage=false&max=20&startPosition=41&firstPageNumber=1&searchConditionProps=%5BLjava.lang.String%3B%40e5aef6c&endPosition=0&sortId=&name=foo&nextPageNumber=4&lastPageNumber=0&maxResultCount=200


        //ダミー
        List<DogDto> searchResult = new ArrayList<>();
        IntStream.range(0, 20).forEach(i -> searchResult.add(createDog()));

        return searchResult;
    }

    private DogDto createDog(){
        DogDto dto = new DogDto();
        dto.setId("1");
        dto.setName("one");
        dto.setColor("white");
        return dto;
    }

    /**
     * CSVダウンロード
     */
    @InjectForm(form = DogForm.class, prefix = "form")
    @OnError(type = ApplicationException.class, path = "/WEB-INF/dog.jsp")
    public HttpResponse download(HttpRequest request, ExecutionContext context) {


        final Path path;
        try {
            path = Files.createTempFile(null, null);
            try (DeferredEntityList<Dog> searchList = (DeferredEntityList<Dog>) UniversalDao
                    .defer().findAll(Dog.class);
                 ObjectMapper<DogDto> mapper = ObjectMapperFactory.create(DogDto.class,
                         Files.newOutputStream(path))) {

                for (Dog dog : searchList) {
                    DogDto dto = BeanUtil.createAndCopy(DogDto.class, dog);
                    mapper.write(dto);
                }
            }
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }

        FileResponse response = new FileResponse(path.toFile(), true);
        response.setContentType("text/csv; charset=Shift_JIS");
        response.setContentDisposition("dog.csv");
        return response;
    }
}
