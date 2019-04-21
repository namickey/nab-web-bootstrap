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
</head>
<body style="padding-top:60px;">


<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="/">DogPay</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link active" href="/">Home <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link active" href="/">Features</a>
      <a class="nav-item nav-link active" href="/">Pricing</a>
      <a class="nav-item nav-link active" href="/">Disabled</a>
    </div>
  </div>
</nav>

<div class="container-fluid p-0">
    <div class="row flex-nowrap">
        <div class="col-3 p-4 border-right" style="min-width:230px;max-width:230px;">
        <n:form cssClass="">
            <div class="form-group">
                <label for="form.name">DogName</label>
                <div class="form-inline flex-nowrap">
                    <n:text name="form.dogName" cssClass="form-control" size="10"/>
                    <n:button type="submit" uri="/action/dog/search" cssClass="btn btn-success">検索</n:button>
                </div>
                <n:error name="form.dogName" />
            </div>
        </n:form>
        </div>
        <main class="col-9 p-4">
            <n:form>





            <n:listSearchResult listSearchInfoName="form"
                                  searchUri="/action/dog/search"
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
                <thead style="background-color:#563d7c;color: #fff;">
                    <tr>
                        <th>num</th>
                        <th>id</th>
                        <th>name</th>
                        <th>color</th>
                        <th>download</th>
                    </tr>
                </thead>
                </jsp:attribute>
                <jsp:attribute name="bodyRowFragment">
                    <tr class="<n:write name='oddEvenCss' />">
                        <td>[<n:write name="count" />]</td>
                        <td><n:write name="row.id" /></td>
                        <td><n:write name="row.name" /></td>
                        <td><n:write name="row.color" /></td>
                        <td><n:button uri="/action/dog/download" cssClass="btn btn-success">download</n:button></td>
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
