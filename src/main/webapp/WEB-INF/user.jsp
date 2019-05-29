<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="/theme.min.css">
  <title>dog</title>
  <style>
    .nablarch_pageNumberSubmitWrapper{display:inline!important}
  </style>
  <script type="text/javascript">
      function popUpConfirmation(event, element) {
        if (window.confirm("削除します。よろしいですか？")) {
          // カスタムタグが出力するJavaScript関数を明示的に呼び出す。
          return nablarch_submit(event, element);
        } else {
          // キャンセル
          return false;
        }
      }
  </script>
</head>
<body style="padding-top:60px;">

<%@ include file="/WEB-INF/header.jsp"%>

<div class="container-fluid flex-nowrap">
    <div class="row flex-nowrap">
        <%@ include file="/WEB-INF/sidebar.jsp"%>

        <main class="container">

            <n:form>
                <n:errors/>
                id
                <n:text name="id" cssClass="form-control"/>
                userName
                <n:text name="userName" cssClass="form-control"/>
                <n:button type="submit" uri="/action/dog/user/search" cssClass="btn btn-info">検索</n:button>

                <n:listSearchResult listSearchInfoName="form"
                                      searchUri="/action/dog/user/search"
                                      resultSetName="searchResult"
                                      resultSetCss="table"
                                      resultCountCss="d-inline"
                                      pagingCss="text-right"
                                      useCurrentPageNumber="false"
                                      currentPageNumberCss="d-inline"
                                      prevSubmitCss="d-inline"
                                      nextSubmitCss="d-inline"
                                      pageNumberSubmitCss="d-inline"
                                      usePageNumberSubmit="true"
                                      >

                    <jsp:attribute name="headerRowFragment">
                    <thead>
                        <tr class="bg-primary">
                            <th>ログインid</th>
                            <th>name</th>
                            <th>ロック</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    </jsp:attribute>
                    <jsp:attribute name="bodyRowFragment">
                        <tr class="<n:write name='oddEvenCss' />">
                            <td><n:write name="row.userId" /></td>
                            <td><n:write name="row.userName" /></td>
                            <td>
                            <c:if test="${row.userLock == 1}">ロック中<n:button uri="/action/dog/download" cssClass="btn btn-info">解除</n:button></c:if>
                            </td>
                            <td>
                                <n:button uri="/action/dog/userUpdate" cssClass="btn btn-info">変更</n:button>
                                <n:button uri="/action/dog/user/delete" cssClass="btn btn-info" onclick="return popUpConfirmation(event, this);">削除</n:button>
                            </td>
                        </tr>
                    </jsp:attribute>
                </n:listSearchResult>
            </n:form>

        </main>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
