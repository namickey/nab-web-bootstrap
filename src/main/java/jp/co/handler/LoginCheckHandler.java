package jp.co.handler;

import nablarch.common.web.session.SessionUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.Handler;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;

public class LoginCheckHandler implements Handler<HttpRequest, Object> {

    @Override
    public Object handle(HttpRequest request, ExecutionContext executionContext) {
        System.out.println("LoginCheckHandler");
        System.out.println(request.getRequestPath());
        if (SessionUtil.orNull(executionContext, "userContext") == null && !"/action/dog/login/login".equals(request.getRequestPath())) {
            return new HttpResponse("/WEB-INF/login.jsp");
        }
        return executionContext.handleNext(request);
    }
}
