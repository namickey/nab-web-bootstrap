<%--------------------------------------------------------------
検索結果のリスト表示を行うタグ。
--------------------------------------------------------------%>
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--------------------------------------------------------------
属性
--------------------------------------------------------------%>
<%-- 全体ラッパ --%>
<%@ attribute name="listSearchResultWrapperCss" required="false" rtexprvalue="true" %>
<%@ attribute name="listSearchInfoName" required="false" rtexprvalue="true" %>
<%-- 検索結果件数 --%>
<%@ attribute name="useResultCount" required="false" rtexprvalue="true" %>
<%@ attribute name="resultCountCss" required="false" rtexprvalue="true" %>
<%@ attribute name="resultCountFragment" required="false" fragment="true" %>
<%-- ページング --%>
<%@ attribute name="usePaging" required="false" rtexprvalue="true" %>
<%@ attribute name="pagingPosition" required="false" rtexprvalue="true" %>
<%@ attribute name="pagingCss" required="false" rtexprvalue="true" %>
<%@ attribute name="searchUri" required="false" rtexprvalue="true" %>
<%-- ページング(現在のページ番号) --%>
<%@ attribute name="useCurrentPageNumber" required="false" rtexprvalue="true" %>
<%@ attribute name="currentPageNumberCss" required="false" rtexprvalue="true" %>
<%@ attribute name="currentPageNumberFragment" required="false" fragment="true" %>
<%-- ページング(最初) --%>
<%@ attribute name="useFirstSubmit" required="false" rtexprvalue="true" %>
<%@ attribute name="firstSubmitTag" required="false" rtexprvalue="true" %>
<%@ attribute name="firstSubmitType" required="false" rtexprvalue="true" %>
<%@ attribute name="firstSubmitCss" required="false" rtexprvalue="true" %>
<%@ attribute name="firstSubmitLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="firstSubmitName" required="false" rtexprvalue="true" %>
<%-- ページング(前へ) --%>
<%@ attribute name="usePrevSubmit" required="false" rtexprvalue="true" %>
<%@ attribute name="prevSubmitTag" required="false" rtexprvalue="true" %>
<%@ attribute name="prevSubmitType" required="false" rtexprvalue="true" %>
<%@ attribute name="prevSubmitCss" required="false" rtexprvalue="true" %>
<%@ attribute name="prevSubmitLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="prevSubmitName" required="false" rtexprvalue="true" %>
<%-- ページング(ページ番号(1 2 3 ...n)) --%>
<%@ attribute name="usePageNumberSubmit" required="false" rtexprvalue="true" %>
<%@ attribute name="pageNumberSubmitWrapperCss" required="false" rtexprvalue="true" %>
<%@ attribute name="pageNumberSubmitTag" required="false" rtexprvalue="true" %>
<%@ attribute name="pageNumberSubmitType" required="false" rtexprvalue="true" %>
<%@ attribute name="pageNumberSubmitCss" required="false" rtexprvalue="true" %>
<%@ attribute name="pageNumberSubmitName" required="false" rtexprvalue="true" %>
<%-- ページング(次へ) --%>
<%@ attribute name="useNextSubmit" required="false" rtexprvalue="true" %>
<%@ attribute name="nextSubmitTag" required="false" rtexprvalue="true" %>
<%@ attribute name="nextSubmitType" required="false" rtexprvalue="true" %>
<%@ attribute name="nextSubmitCss" required="false" rtexprvalue="true" %>
<%@ attribute name="nextSubmitLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="nextSubmitName" required="false" rtexprvalue="true" %>
<%-- ページング(最後) --%>
<%@ attribute name="useLastSubmit" required="false" rtexprvalue="true" %>
<%@ attribute name="lastSubmitTag" required="false" rtexprvalue="true" %>
<%@ attribute name="lastSubmitType" required="false" rtexprvalue="true" %>
<%@ attribute name="lastSubmitCss" required="false" rtexprvalue="true" %>
<%@ attribute name="lastSubmitLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="lastSubmitName" required="false" rtexprvalue="true" %>
<%-- 検索結果 --%>
<%@ attribute name="resultSetName" required="true" rtexprvalue="true" %>
<%@ attribute name="resultSetCss" required="false" rtexprvalue="true" %>
<%@ attribute name="headerRowFragment" required="true" fragment="true" %>
<%@ attribute name="bodyRowFragment" required="true" fragment="true" %>
<%@ attribute name="varRowName" required="false" rtexprvalue="true" %>
<%@ attribute name="varStatusName" required="false" rtexprvalue="true" %>
<%@ attribute name="varCountName" required="false" rtexprvalue="true" %>
<%@ attribute name="varRowCountName" required="false" rtexprvalue="true" %>
<%@ attribute name="varOddEvenName" required="false" rtexprvalue="true" %>
<%@ attribute name="oddValue" required="false" rtexprvalue="true" %>
<%@ attribute name="evenValue" required="false" rtexprvalue="true" %>

<%--------------------------------------------------------------
デフォルト
--------------------------------------------------------------%>
<%-- 全体ラッパ --%>
<c:if test="${empty listSearchResultWrapperCss}"><n:set var="listSearchResultWrapperCss" name="nablarch_tag_config.listSearchResultWrapperCss" scope="page" /></c:if>
<c:if test="${empty pagingPosition}"><n:set var="pagingPosition" name="nablarch_tag_config.pagingPosition" scope="page" /></c:if>
<%-- 検索結果件数 --%>
<c:if test="${empty useResultCount}"><n:set var="useResultCount" name="nablarch_tag_config.useResultCount" scope="page" /></c:if>
<c:if test="${empty resultCountCss}"><n:set var="resultCountCss" name="nablarch_tag_config.resultCountCss" scope="page" /></c:if>
<%-- ページング --%>
<c:if test="${empty usePaging}"><n:set var="usePaging" name="nablarch_tag_config.usePaging" scope="page" /></c:if>

<%--------------------------------------------------------------
本体処理
--------------------------------------------------------------%>
<%-- 全体ラッパ --%>
<n:set var="resultSet" name="${resultSetName}" scope="page" bySingleValue="false" />
<c:if test="${resultSet != null}">
<c:if test="${not empty listSearchInfoName}">
    <n:set var="listSearchInfo" name="${listSearchInfoName}" scope="page" bySingleValue="false" />
</c:if>
<div class="<n:write name="listSearchResultWrapperCss" withHtmlFormat="false" />">
    <%-- 検索結果件数 --%>
    <c:if test="${not empty listSearchInfo && useResultCount}">
    <jsp:invoke fragment="resultCountFragment" var="resultCountTag" />
    <div class="<n:write name="resultCountCss" withHtmlFormat="false" />">
        <c:if test="${empty resultCountTag}">
            検索結果 <n:write name="${listSearchInfoName}.resultCount" />件
        </c:if>
        <c:if test="${not empty resultCountTag}">
            <jsp:invoke fragment="resultCountFragment" />
        </c:if>
    </div>
    </c:if>
    <%-- ページング(top) --%>
    <c:if test="${(not empty listSearchInfo && usePaging) && (pagingPosition == 'top' || pagingPosition == 'both')}">
    <n:listSearchPaging listSearchInfoName="${listSearchInfoName}"
                        pagingCss="${pagingCss}"
                        searchUri="${searchUri}"
                        submitNameSuffix="_top"
                        useCurrentPageNumber="${useCurrentPageNumber}"
                        currentPageNumberCss="${currentPageNumberCss}"
                        useFirstSubmit="${useFirstSubmit}"
                        firstSubmitTag="${firstSubmitTag}"
                        firstSubmitType="${firstSubmitType}"
                        firstSubmitCss="${firstSubmitCss}"
                        firstSubmitLabel="${firstSubmitLabel}"
                        firstSubmitName="${firstSubmitName}"
                        usePrevSubmit="${usePrevSubmit}"
                        prevSubmitTag="${prevSubmitTag}"
                        prevSubmitType="${prevSubmitType}"
                        prevSubmitCss="${prevSubmitCss}"
                        prevSubmitLabel="${prevSubmitLabel}"
                        prevSubmitName="${prevSubmitName}"
                        usePageNumberSubmit="${usePageNumberSubmit}"
                        pageNumberSubmitWrapperCss="${pageNumberSubmitWrapperCss}"
                        pageNumberSubmitTag="${pageNumberSubmitTag}"
                        pageNumberSubmitType="${pageNumberSubmitType}"
                        pageNumberSubmitCss="${pageNumberSubmitCss}"
                        pageNumberSubmitName="${pageNumberSubmitName}"
                        useNextSubmit="${useNextSubmit}"
                        nextSubmitTag="${nextSubmitTag}"
                        nextSubmitType="${nextSubmitType}"
                        nextSubmitCss="${nextSubmitCss}"
                        nextSubmitLabel="${nextSubmitLabel}"
                        nextSubmitName="${nextSubmitName}"
                        useLastSubmit="${useLastSubmit}"
                        lastSubmitTag="${lastSubmitTag}"
                        lastSubmitType="${lastSubmitType}"
                        lastSubmitCss="${lastSubmitCss}"
                        lastSubmitLabel="${lastSubmitLabel}"
                        lastSubmitName="${lastSubmitName}">
        <jsp:attribute name="currentPageNumberFragment"><jsp:invoke fragment="currentPageNumberFragment" /></jsp:attribute>
    </n:listSearchPaging>
    </c:if>
    <%-- 検索結果 --%>
    <c:if test="${not empty listSearchInfo}">
        <n:set var="startPosition" value="${listSearchInfo.startPosition}" scope="page" />
    </c:if>
    <c:if test="${empty listSearchInfo}">
        <n:set var="startPosition" value="1" scope="page" />
    </c:if>
    <n:table resultSetName="${resultSetName}"
             resultSetCss="${resultSetCss}"
             varRowName="${varRowName}"
             varStatusName="${varStatusName}"
             varCountName="${varCountName}"
             varRowCountName="${varRowCountName}"
             varOddEvenName="${varOddEvenName}"
             oddValue="${oddValue}"
             evenValue="${evenValue}"
             startPosition="${startPosition}">
        <jsp:attribute name="headerRowFragment"><jsp:invoke fragment="headerRowFragment" /></jsp:attribute>
        <jsp:attribute name="bodyRowFragment"><jsp:invoke fragment="bodyRowFragment" /></jsp:attribute>
    </n:table>
    <%-- ページング(bottom) --%>
    <c:if test="${(not empty listSearchInfo && usePaging) && (pagingPosition == 'bottom' || pagingPosition == 'both')}">
    <n:listSearchPaging listSearchInfoName="${listSearchInfoName}"
                        pagingCss="${pagingCss}"
                        searchUri="${searchUri}"
                        submitNameSuffix="_bottom"
                        useCurrentPageNumber="${useCurrentPageNumber}"
                        currentPageNumberCss="${currentPageNumberCss}"
                        useFirstSubmit="${useFirstSubmit}"
                        firstSubmitTag="${firstSubmitTag}"
                        firstSubmitType="${firstSubmitType}"
                        firstSubmitCss="${firstSubmitCss}"
                        firstSubmitLabel="${firstSubmitLabel}"
                        firstSubmitName="${firstSubmitName}"
                        usePrevSubmit="${usePrevSubmit}"
                        prevSubmitTag="${prevSubmitTag}"
                        prevSubmitType="${prevSubmitType}"
                        prevSubmitCss="${prevSubmitCss}"
                        prevSubmitLabel="${prevSubmitLabel}"
                        prevSubmitName="${prevSubmitName}"
                        usePageNumberSubmit="${usePageNumberSubmit}"
                        pageNumberSubmitWrapperCss="${pageNumberSubmitWrapperCss}"
                        pageNumberSubmitTag="${pageNumberSubmitTag}"
                        pageNumberSubmitType="${pageNumberSubmitType}"
                        pageNumberSubmitCss="${pageNumberSubmitCss}"
                        pageNumberSubmitName="${pageNumberSubmitName}"
                        useNextSubmit="${useNextSubmit}"
                        nextSubmitTag="${nextSubmitTag}"
                        nextSubmitType="${nextSubmitType}"
                        nextSubmitCss="${nextSubmitCss}"
                        nextSubmitLabel="${nextSubmitLabel}"
                        nextSubmitName="${nextSubmitName}"
                        useLastSubmit="${useLastSubmit}"
                        lastSubmitTag="${lastSubmitTag}"
                        lastSubmitType="${lastSubmitType}"
                        lastSubmitCss="${lastSubmitCss}"
                        lastSubmitLabel="${lastSubmitLabel}"
                        lastSubmitName="${lastSubmitName}">
        <jsp:attribute name="currentPageNumberFragment"><jsp:invoke fragment="currentPageNumberFragment"/></jsp:attribute>
    </n:listSearchPaging>
    </c:if>
</div>
</c:if>