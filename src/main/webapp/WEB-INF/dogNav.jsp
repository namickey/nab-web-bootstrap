<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="p-3" style="height:150px">
    <n:form>
        <n:hiddenStore name="nablarch_hiddenStore" />
        <h3>
            Dog名 : <n:write name="name"/>ちゃん
        </h3>
        <n:button type="submit" uri="/action/dog/search" cssClass="btn btn-success">Dogコメント参照</n:button>
        <n:button type="submit" uri="/action/dog/entry" cssClass="btn btn-success">Dogコメント登録</n:button>
        <n:button type="submit" uri="/action/dog/some" cssClass="btn btn-success">Dog体調管理</n:button>
        <n:button type="submit" uri="/action/dog/some" cssClass="btn btn-success">Dogエサ</n:button>
        <n:button type="submit" uri="/action/dog/some" cssClass="btn btn-success">Dog管理</n:button>
    </n:form>
</div>