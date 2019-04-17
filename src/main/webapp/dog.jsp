<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <title>dog</title>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active"><a class="nav-link" href="/">Top</a></li>
                <li class="nav-item active"><a class="nav-link" href="/">Dog</a></li>
                <li class="nav-item active"><a class="nav-link" href="/">Cat</a></li>
            </ul>
        </div>
</nav>
<div class="container">
<n:form>
<div class="form-group row">
    <label for="form.name" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-2">
      <n:text name="form.name" cssClass="form-control"/>
      <n:error name="form.name" />
    </div>
</div>

<n:button type="submit" uri="/action/dog/search" cssClass="btn btn-success mx-auto d-block">検索</n:button>


<n:listSearchResult listSearchInfoName="form"
                      searchUri="/action/dog/search"
                      resultSetName="searchResult"
                      resultSetCss="table"
                      resultCountCss="d-inline"
                      pagingCss="text-right"
                      currentPageNumberCss="d-inline"
                      prevSubmitCss="d-inline"
                      nextSubmitCss="d-inline"
                      usePageNumberSubmit="true"
                      >

    <jsp:attribute name="headerRowFragment">
    <thead class="thead-dark">
        <tr>
            <th>num</th>
            <th>name</th>
            <th>price</th>
            <th>memo</th>
        </tr>
    </thead>
    </jsp:attribute>
    <jsp:attribute name="bodyRowFragment">
        <tr class="<n:write name='oddEvenCss' />">
            <td>[<n:write name="count" />]</td>
            <td><n:write name="row.name" /></td>
            <td><n:write name="row.price" /></td>
            <td><n:write name="row.memo" /></td>
        </tr>
    </jsp:attribute>
</n:listSearchResult>




</n:form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>