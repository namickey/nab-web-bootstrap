package jp.co.dog;

import nablarch.core.db.support.DbAccessSupport;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;

public class TopAction extends DbAccessSupport {

    public HttpResponse index(HttpRequest request, ExecutionContext context) {
        System.out.println("top index");
        return new HttpResponse("/top.jsp");
    }
}
