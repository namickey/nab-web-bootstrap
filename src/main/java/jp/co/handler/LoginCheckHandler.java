package jp.co.handler;

import nablarch.common.web.session.SessionKeyNotFoundException;
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
        if (!("/action/dog/login".equals(request.getRequestPath()) || "/action/dog/login/login".equals(request.getRequestPath()))) {
            try {
                SessionUtil.get(executionContext, "name");
            } catch(SessionKeyNotFoundException e) {
                System.out.println("SessionKeyNotFoundException");
                return new HttpResponse("redirect:///action/dog/login");
            }
        }
        return executionContext.handleNext(request);
    }
}
