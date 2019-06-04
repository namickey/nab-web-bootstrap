<%--------------------------------------------------------------
検索結果のリスト表示のサブミット要素を出力するタグ。
--------------------------------------------------------------%>
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--------------------------------------------------------------
属性
--------------------------------------------------------------%>
<%@ attribute name="tag" required="true" rtexprvalue="true" %>
<%@ attribute name="type" required="false" rtexprvalue="true" %>
<%@ attribute name="css" required="false" rtexprvalue="true" %>
<%@ attribute name="label" required="true" rtexprvalue="true" %>
<%@ attribute name="enable" required="true" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="uri" required="true" rtexprvalue="true" %>
<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="pageNumber" required="true" rtexprvalue="true" %>
<%@ attribute name="sortId" required="false" rtexprvalue="true" %>
<%@ attribute name="listSearchInfoName" required="true" rtexprvalue="true" %>

<%--------------------------------------------------------------
本体処理
--------------------------------------------------------------%>
<div class="<n:write name="css" withHtmlFormat="false" />">
    <c:if test="${enable}">
        <c:if test="${'submitLink' == tag}">
            <n:submitLink uri="${uri}" name="${name}" cssClass="${css}">
                <n:write name="label" />
                <n:listSearchParams pageNumber="${pageNumber}" listSearchInfoName="${listSearchInfoName}" sortId="${sortId}" />
            </n:submitLink>
        </c:if>
        <c:if test="${'submit' == tag}">
            <n:submit uri="${uri}" name="${name}" value="${label}" type="${type}" cssClass="${css}">
                <n:listSearchParams pageNumber="${pageNumber}" listSearchInfoName="${listSearchInfoName}" sortId="${sortId}" />
            </n:submit>
        </c:if>
        <c:if test="${'button' == tag}">
            <n:button uri="${uri}" name="${name}" value="${label}" type="${type}" cssClass="${css}">
                <n:write name="label" />
                <n:listSearchParams pageNumber="${pageNumber}" listSearchInfoName="${listSearchInfoName}" sortId="${sortId}" />
            </n:button>
        </c:if>
    </c:if>
    <c:if test="${not enable}">
        <c:if test="${'submitLink' == tag}">
            <n:write name="label" />
        </c:if>
        <c:if test="${'submit' == tag}">
            <n:submit uri="${uri}" name="${name}" value="${label}" type="${type}" disabled="true" cssClass="${css}" />
        </c:if>
        <c:if test="${'button' == tag}">
            <n:button uri="${uri}" name="${name}" value="${label}" type="${type}" disabled="true" cssClass="${css}">
                <n:write name="label" />
            </n:button>
        </c:if>
    </c:if>
</div>