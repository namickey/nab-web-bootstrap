package jp.co.dog;

import nablarch.common.web.session.SessionUtil;
import nablarch.core.date.SystemTimeUtil;
import nablarch.core.db.statement.ParameterizedSqlPStatement;
import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.message.ApplicationException;
import nablarch.core.message.MessageLevel;
import nablarch.core.message.MessageUtil;
import nablarch.core.util.DateUtil;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;

import java.util.HashMap;
import java.util.Map;

public class LoginAction extends DbAccessSupport {

    public HttpResponse index(HttpRequest request, ExecutionContext context) {
        return new HttpResponse("/WEB-INF/login.jsp");
    }

    @OnError(type = ApplicationException.class, path="/WEB-INF/login.jsp")
    public HttpResponse login(HttpRequest request, ExecutionContext context) {
        System.out.println("login");

        ValidationContext<LoginForm> validationContext =
                ValidationUtil.validateAndConvertRequest(LoginForm.class, request, "validate");
        validationContext.abortIfInvalid();
        LoginForm form = validationContext.createObject();

        ParameterizedSqlPStatement statement = getParameterizedSqlStatement("select_user_name");
        Map<String, Object> map = new HashMap<>();
        map.put("id", form.getId());
        map.put("systemDate", SystemTimeUtil.getDate());
        SqlResultSet result = statement.retrieve(map);
        if (result.isEmpty()) {
            System.out.println("no user data.");
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR, "E001"));
        }
        if (!form.getPass().equals(result.get(0).getString("pass"))) {
            System.out.println("not match pass.");
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR, "E001"));
        }
        if ("1".equals(result.get(0).getString("user_lock"))) {
            System.out.println("user locked.");
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR, "E002"));
        }

        String name = result.get(0).getString("user_name");
        SessionUtil.invalidate(context);
        UserContext userContext = new UserContext();
        userContext.setName(name);
        userContext.setLoginTime(DateUtil.formatDate(SystemTimeUtil.getDate(), "yyyy/MM/dd HH:mm:ss"));
        SessionUtil.put(context, "userContext", userContext, "httpSession");

        return new HttpResponse("redirect:///action/dog/top");
    }

    public HttpResponse logout(HttpRequest request, ExecutionContext context) {
        System.out.println("logout");
        SessionUtil.invalidate(context);
        return new HttpResponse("redirect:///action/dog/login");
    }
}
