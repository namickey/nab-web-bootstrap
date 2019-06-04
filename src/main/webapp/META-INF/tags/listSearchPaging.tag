<%--------------------------------------------------------------
検索結果のリスト表示のページングを出力するタグ。
--------------------------------------------------------------%>
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--------------------------------------------------------------
属性
--------------------------------------------------------------%>
<%@ attribute name="listSearchInfoName" required="true" rtexprvalue="true" %>
<%@ attribute name="pagingCss" required="false" rtexprvalue="true" %>
<%@ attribute name="searchUri" required="true" rtexprvalue="true" %>
<%@ attribute name="submitNameSuffix" required="false" rtexprvalue="true" %>
<%-- 現在のページ番号 --%>
<%@ attribute name="useCurrentPageNumber" required="false" rtexprvalue="true" %>
<%@ attribute name="currentPageNumberCss" required="false" rtexprvalue="true" %>
<%@ attribute name="currentPageNumberFragment" required="false" fragment="true" %>
<%-- 最初 --%>
<%@ attribute name="useFirstSubmit" required="false" rtexprvalue="true" %>
<%@ attribute name="firstSubmitTag" required="false" rtexprvalue="true" %>
<%@ attribute name="firstSubmitType" required="false" rtexprvalue="true" %>
<%@ attribute name="firstSubmitCss" required="false" rtexprvalue="true" %>
<%@ attribute name="firstSubmitLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="firstSubmitName" required="false" rtexprvalue="true" %>
<%-- 前へ --%>
<%@ attribute name="usePrevSubmit" required="false" rtexprvalue="true" %>
<%@ attribute name="prevSubmitTag" required="false" rtexprvalue="true" %>
<%@ attribute name="prevSubmitType" required="false" rtexprvalue="true" %>
<%@ attribute name="prevSubmitCss" required="false" rtexprvalue="true" %>
<%@ attribute name="prevSubmitLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="prevSubmitName" required="false" rtexprvalue="true" %>
<%-- ページ番号(1 2 3 ...n) --%>
<%@ attribute name="usePageNumberSubmit" required="false" rtexprvalue="true" %>
<%@ attribute name="pageNumberSubmitWrapperCss" required="false" rtexprvalue="true" %>
<%@ attribute name="pageNumberSubmitTag" required="false" rtexprvalue="true" %>
<%@ attribute name="pageNumberSubmitType" required="false" rtexprvalue="true" %>
<%@ attribute name="pageNumberSubmitCss" required="false" rtexprvalue="true" %>
<%@ attribute name="pageNumberSubmitName" required="false" rtexprvalue="true" %>
<%-- 次へ --%>
<%@ attribute name="useNextSubmit" required="false" rtexprvalue="true" %>
<%@ attribute name="nextSubmitTag" required="false" rtexprvalue="true" %>
<%@ attribute name="nextSubmitType" required="false" rtexprvalue="true" %>
<%@ attribute name="nextSubmitCss" required="false" rtexprvalue="true" %>
<%@ attribute name="nextSubmitLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="nextSubmitName" required="false" rtexprvalue="true" %>
<%-- 最後 --%>
<%@ attribute name="useLastSubmit" required="false" rtexprvalue="true" %>
<%@ attribute name="lastSubmitTag" required="false" rtexprvalue="true" %>
<%@ attribute name="lastSubmitType" required="false" rtexprvalue="true" %>
<%@ attribute name="lastSubmitCss" required="false" rtexprvalue="true" %>
<%@ attribute name="lastSubmitLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="lastSubmitName" required="false" rtexprvalue="true" %>

<%--------------------------------------------------------------
デフォルト
--------------------------------------------------------------%>
<c:if test="${empty pagingCss}"><n:set var="pagingCss" name="nablarch_tag_config.pagingCss" scope="page" /></c:if>
<%-- 現在のページ番号 --%>
<c:if test="${empty useCurrentPageNumber}"><n:set var="useCurrentPageNumber" name="nablarch_tag_config.useCurrentPageNumber" scope="page" /></c:if>
<c:if test="${empty currentPageNumberCss}"><n:set var="currentPageNumberCss" name="nablarch_tag_config.currentPageNumberCss" scope="page" /></c:if>
<%-- 最初 --%>
<c:if test="${empty useFirstSubmit}"><n:set var="useFirstSubmit" name="nablarch_tag_config.useFirstSubmit" scope="page" /></c:if>
<c:if test="${empty firstSubmitTag}"><n:set var="firstSubmitTag" name="nablarch_tag_config.firstSubmitTag" scope="page" /></c:if>
<c:if test="${empty firstSubmitType}"><n:set var="firstSubmitType" name="nablarch_tag_config.firstSubmitType" scope="page" /></c:if>
<c:if test="${empty firstSubmitCss}"><n:set var="firstSubmitCss" name="nablarch_tag_config.firstSubmitCss" scope="page" /></c:if>
<c:if test="${empty firstSubmitLabel}"><n:set var="firstSubmitLabel" name="nablarch_tag_config.firstSubmitLabel" scope="page" /></c:if>
<c:if test="${empty firstSubmitName}"><n:set var="firstSubmitName" name="nablarch_tag_config.firstSubmitName" scope="page" /></c:if>
<%-- 前へ --%>
<c:if test="${empty usePrevSubmit}"><n:set var="usePrevSubmit" name="nablarch_tag_config.usePrevSubmit" scope="page" /></c:if>
<c:if test="${empty prevSubmitTag}"><n:set var="prevSubmitTag" name="nablarch_tag_config.prevSubmitTag" scope="page" /></c:if>
<c:if test="${empty prevSubmitType}"><n:set var="prevSubmitType" name="nablarch_tag_config.prevSubmitType" scope="page" /></c:if>
<c:if test="${empty prevSubmitCss}"><n:set var="prevSubmitCss" name="nablarch_tag_config.prevSubmitCss" scope="page" /></c:if>
<c:if test="${empty prevSubmitLabel}"><n:set var="prevSubmitLabel" name="nablarch_tag_config.prevSubmitLabel" scope="page" /></c:if>
<c:if test="${empty prevSubmitName}"><n:set var="prevSubmitName" name="nablarch_tag_config.prevSubmitName" scope="page" /></c:if>
<%-- ページ番号(1 2 3 ...n) --%>
<c:if test="${empty usePageNumberSubmit}"><n:set var="usePageNumberSubmit" name="nablarch_tag_config.usePageNumberSubmit" scope="page" /></c:if>
<c:if test="${empty pageNumberSubmitWrapperCss}"><n:set var="pageNumberSubmitWrapperCss" name="nablarch_tag_config.pageNumberSubmitWrapperCss" scope="page" /></c:if>
<c:if test="${empty pageNumberSubmitTag}"><n:set var="pageNumberSubmitTag" name="nablarch_tag_config.pageNumberSubmitTag" scope="page" /></c:if>
<c:if test="${empty pageNumberSubmitType}"><n:set var="pageNumberSubmitType" name="nablarch_tag_config.pageNumberSubmitType" scope="page" /></c:if>
<c:if test="${empty pageNumberSubmitCss}"><n:set var="pageNumberSubmitCss" name="nablarch_tag_config.pageNumberSubmitCss" scope="page" /></c:if>
<c:if test="${empty pageNumberSubmitName}"><n:set var="pageNumberSubmitName" name="nablarch_tag_config.pageNumberSubmitName" scope="page" /></c:if>
<%-- 次へ --%>
<c:if test="${empty useNextSubmit}"><n:set var="useNextSubmit" name="nablarch_tag_config.useNextSubmit" scope="page" /></c:if>
<c:if test="${empty nextSubmitTag}"><n:set var="nextSubmitTag" name="nablarch_tag_config.nextSubmitTag" scope="page" /></c:if>
<c:if test="${empty nextSubmitType}"><n:set var="nextSubmitType" name="nablarch_tag_config.nextSubmitType" scope="page" /></c:if>
<c:if test="${empty nextSubmitCss}"><n:set var="nextSubmitCss" name="nablarch_tag_config.nextSubmitCss" scope="page" /></c:if>
<c:if test="${empty nextSubmitLabel}"><n:set var="nextSubmitLabel" name="nablarch_tag_config.nextSubmitLabel" scope="page" /></c:if>
<c:if test="${empty nextSubmitName}"><n:set var="nextSubmitName" name="nablarch_tag_config.nextSubmitName" scope="page" /></c:if>
<%-- 最後 --%>
<c:if test="${empty useLastSubmit}"><n:set var="useLastSubmit" name="nablarch_tag_config.useLastSubmit" scope="page" /></c:if>
<c:if test="${empty lastSubmitTag}"><n:set var="lastSubmitTag" name="nablarch_tag_config.lastSubmitTag" scope="page" /></c:if>
<c:if test="${empty lastSubmitType}"><n:set var="lastSubmitType" name="nablarch_tag_config.lastSubmitType" scope="page" /></c:if>
<c:if test="${empty lastSubmitCss}"><n:set var="lastSubmitCss" name="nablarch_tag_config.lastSubmitCss" scope="page" /></c:if>
<c:if test="${empty lastSubmitLabel}"><n:set var="lastSubmitLabel" name="nablarch_tag_config.lastSubmitLabel" scope="page" /></c:if>
<c:if test="${empty lastSubmitName}"><n:set var="lastSubmitName" name="nablarch_tag_config.lastSubmitName" scope="page" /></c:if>

<%--------------------------------------------------------------
本体処理
--------------------------------------------------------------%>
<n:set var="listSearchInfo" name="${listSearchInfoName}" scope="page" bySingleValue="false" />
<c:if test="${listSearchInfo.resultCount != 0}">

    <div class="<n:write name="pagingCss" withHtmlFormat="false" />">
        <%-- 現在のページ番号 --%>
        <c:if test="${useCurrentPageNumber}">
            <div class="<n:write name="currentPageNumberCss" withHtmlFormat="false" />">
                <jsp:invoke fragment="currentPageNumberFragment" var="currentPageTag" />
                <c:if test="${empty currentPageTag}">
                    [<n:write name="${listSearchInfoName}.pageNumber" />/<n:write name="${listSearchInfoName}.pageCount" />ページ]
                </c:if>
                <c:if test="${not empty currentPageTag}">
                    <jsp:invoke fragment="currentPageNumberFragment" />
                </c:if>
            </div>
        </c:if>
        <%-- 最初 --%>
        <c:if test="${useFirstSubmit}">
            <n:listSearchSubmit tag="${firstSubmitTag}"
                                type="${firstSubmitType}"
                                css="${firstSubmitCss}"
                                label="${firstSubmitLabel}"
                                enable="${listSearchInfo.hasPrevPage}"
                                uri="${searchUri}"
                                name="${firstSubmitName}${submitNameSuffix}"
                                pageNumber="${listSearchInfo.firstPageNumber}"
                                listSearchInfoName="${listSearchInfoName}" />
        </c:if>
        <%-- 前へ --%>
        <c:if test="${usePrevSubmit}">
            <n:listSearchSubmit tag="${prevSubmitTag}"
                                type="${prevSubmitType}"
                                css="${prevSubmitCss}"
                                label="${prevSubmitLabel}"
                                enable="${listSearchInfo.hasPrevPage}"
                                uri="${searchUri}"
                                name="${prevSubmitName}${submitNameSuffix}"
                                pageNumber="${listSearchInfo.prevPageNumber}"
                                listSearchInfoName="${listSearchInfoName}" />
        </c:if>
        <%--  ページ番号(1 2 3 ...n) --%>
        <c:if test="${usePageNumberSubmit && listSearchInfo.pageCount != 1}">
            <div class="<n:write name="pageNumberSubmitWrapperCss" withHtmlFormat="false" />">
                <c:forEach begin="1" end="${listSearchInfo.pageCount}" varStatus="status">
                    <n:set var="pageNumber" value="${status.index}" scope="page" />
                    <n:listSearchSubmit tag="${pageNumberSubmitTag}"
                                        type="${pageNumberSubmitType}"
                                        css="${pageNumberSubmitCss}"
                                        label="${pageNumber}"
                                        enable="${listSearchInfo.pageNumber != pageNumber}"
                                        uri="${searchUri}"
                                        name="${pageNumberSubmitName}${pageNumber}${submitNameSuffix}"
                                        pageNumber="${pageNumber}"
                                        listSearchInfoName="${listSearchInfoName}" />
                </c:forEach>
            </div>
        </c:if>
        <%-- 次へ --%>
        <c:if test="${useNextSubmit}">
            <n:listSearchSubmit tag="${nextSubmitTag}"
                                type="${nextSubmitType}"
                                css="${nextSubmitCss}"
                                label="${nextSubmitLabel}"
                                enable="${listSearchInfo.hasNextPage}"
                                uri="${searchUri}"
                                name="${nextSubmitName}${submitNameSuffix}"
                                pageNumber="${listSearchInfo.nextPageNumber}"
                                listSearchInfoName="${listSearchInfoName}" />
        </c:if>
        <%-- 最後 --%>
        <c:if test="${useLastSubmit}">
            <n:listSearchSubmit tag="${lastSubmitTag}"
                                type="${lastSubmitType}"
                                css="${lastSubmitCss}"
                                label="${lastSubmitLabel}"
                                enable="${listSearchInfo.hasNextPage}"
                                uri="${searchUri}"
                                name="${lastSubmitName}${submitNameSuffix}"
                                pageNumber="${listSearchInfo.lastPageNumber}"
                                listSearchInfoName="${listSearchInfoName}" />
        </c:if>
    </div>
</c:if>