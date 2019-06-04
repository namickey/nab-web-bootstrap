package jp.co.dog;

import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;

public class UserAction extends DbAccessSupport {

    public HttpResponse index(HttpRequest request, ExecutionContext context) {
        return new HttpResponse("/WEB-INF/user.jsp");
    }

    public HttpResponse search(HttpRequest request, ExecutionContext context) {
        ValidationContext<UserForm> validationContext =
                ValidationUtil.validateAndConvertRequest("form", UserForm.class, request, "validate");
        validationContext.abortIfInvalid();
        UserForm form = validationContext.createObject();
        if (form.getPageNumber() == null) {
            form.setPageNumber(1);
        }
        SqlResultSet searchResult = search("search", form);
        context.setRequestScopedVar("form", form);
        context.setRequestScopedVar("searchResult", searchResult);
        return new HttpResponse("/WEB-INF/user.jsp");
    }

    public HttpResponse delete(HttpRequest request, ExecutionContext context) {
        return new HttpResponse("/WEB-INF/user.jsp");
    }
}
