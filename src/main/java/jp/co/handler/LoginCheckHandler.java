package jp.co.handler;

import jp.co.dog.UserContext;
import nablarch.common.web.session.SessionUtil;
import nablarch.core.ThreadContext;
import nablarch.fw.ExecutionContext;
import nablarch.fw.Handler;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class LoginCheckHandler implements Handler<HttpRequest, Object> {

    private Set<String> ignoreRequestIds;

    public LoginCheckHandler(){
        ignoreRequestIds =  new HashSet();
    }

    @Override
    public Object handle(HttpRequest request, ExecutionContext executionContext) {
        System.out.println("LoginCheckHandler");
        System.out.println(request.getRequestPath());
        System.out.println(ignoreRequestIds);

        if (SessionUtil.orNull(executionContext, "userContext") == null &&
                !ignoreRequestIds.contains(request.getRequestPath())) {

            return new HttpResponse("/WEB-INF/login.jsp");
        }
        if (!ignoreRequestIds.contains(request.getRequestPath())) {
            ThreadContext.setUserId(((UserContext)SessionUtil.get(executionContext, "userContext")).getUserId());
        } else {
            ThreadContext.setUserId("dummy");
        }

        return executionContext.handleNext(request);
    }

    public void setIgnoreRequestIds(List<String> ignoreRequestIds) {
        this.ignoreRequestIds.addAll(ignoreRequestIds);
    }

    public Set<String> getIgnoreRequestIds() {
        return ignoreRequestIds;
    }
}
