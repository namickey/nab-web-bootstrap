package jp.co.dog;

import nablarch.common.web.session.SessionUtil;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;

public class LoginAction extends DbAccessSupport {

    public HttpResponse index(HttpRequest request, ExecutionContext context) {
        return new HttpResponse("/login.jsp");
    }

    public HttpResponse login(HttpRequest request, ExecutionContext context) {
        System.out.println("login");
        SessionUtil.invalidate(context);
        SessionUtil.put(context, "name", "わん　次郎", "httpSession");
        return new HttpResponse("redirect:///action/dog/top");
    }

    public HttpResponse logout(HttpRequest request, ExecutionContext context) {
        System.out.println("logout");
        SessionUtil.invalidate(context);
        return new HttpResponse("redirect:///action/dog/login");
    }
}
