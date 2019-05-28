package jp.co.dog;

import nablarch.common.web.session.SessionUtil;
import nablarch.core.db.statement.ParameterizedSqlPStatement;
import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.message.ApplicationException;
import nablarch.core.message.Message;
import nablarch.core.message.MessageLevel;
import nablarch.core.message.MessageUtil;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;

public class LoginAction extends DbAccessSupport {

    public HttpResponse index(HttpRequest request, ExecutionContext context) {
        return new HttpResponse("/login.jsp");
    }

    @OnError(type = ApplicationException.class, path="/login.jsp")
    public HttpResponse login(HttpRequest request, ExecutionContext context) {
        System.out.println("login");

        ValidationContext<LoginForm> validationContext =
                ValidationUtil.validateAndConvertRequest(LoginForm.class, request, "validate");
        validationContext.abortIfInvalid();
        LoginForm form = validationContext.createObject();

        ParameterizedSqlPStatement statement = getParameterizedSqlStatement("select_user_name");
        SqlResultSet result = statement.retrieve(form);
        if (result.isEmpty()){
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR, "E001"));
        }
        String name = result.get(0).getString("user_name");



        SessionUtil.invalidate(context);
        SessionUtil.put(context, "name", name, "httpSession");

        return new HttpResponse("redirect:///action/dog/top");
    }

    public HttpResponse logout(HttpRequest request, ExecutionContext context) {
        System.out.println("logout");
        SessionUtil.invalidate(context);
        return new HttpResponse("redirect:///action/dog/login");
    }
}
