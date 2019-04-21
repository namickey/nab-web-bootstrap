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
<body data-spy="scroll" data-target="#navbar1" data-offset="160">

<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary" id="navbar1">
    <div class="container">
        <div class="row">
            <a class="navbar-brand mr-1 mb-1 mt-0" href="../">Bootstrap 4</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse justify-content-center" id="collapsingNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="themesDd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Themes
                        </a>
                        <div class="dropdown-menu" aria-labelledby="themesDd">
                            <a class="dropdown-item px-2 " href="../tequila">Tequila</a>
                            <a class="dropdown-item px-2" href="https://themestr.app" rel="nofollow" target="_new" title="Bootstrap theme builder">Build your own...</a>
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="layoutDd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Layouts
                        </a>
                        <div class="dropdown-menu" aria-labelledby="layoutDd">
                            <a class="dropdown-item px-2" href="./">Default</a>
                            <a class="dropdown-item px-2" href="./template2.html">Layout 2</a>
                            <a class="dropdown-item px-2" href="./template3.html">Layout 3</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#buttons">Buttons</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#navs">Navs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#cards">Cards</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#modals">Modals</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#typography">Typography</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#forms">Forms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#grid">Grid</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="navbar-collapse collapse justify-content-center" id="collapsingNavbar">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="themesDd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  Themes
                                </a>
                                <div class="dropdown-menu" aria-labelledby="themesDd">
                                    <a class="dropdown-item px-2 " href="../tequila">Tequila</a>
                                    <a class="dropdown-item px-2" href="https://themestr.app" rel="nofollow" target="_new" title="Bootstrap theme builder">Build your own...</a>
                                </div>
                            </li>
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="layoutDd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  Layouts
                                </a>
                                <div class="dropdown-menu" aria-labelledby="layoutDd">
                                    <a class="dropdown-item px-2" href="./">Default</a>
                                    <a class="dropdown-item px-2" href="./template2.html">Layout 2</a>
                                    <a class="dropdown-item px-2" href="./template3.html">Layout 3</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#buttons">Buttons</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#navs">Navs</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#cards">Cards</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#modals">Modals</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#typography">Typography</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#forms">Forms</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#grid">Grid</a>
                            </li>
                        </ul>
                    </div>
                </div>
    </div>
</nav>


<div class="container p-0">
    <div class="row">
        <main class="col p-4">
            <n:form>
            <div class="form-group row">
                <label for="form.name" class="col-sm-2 col-form-label">DogName</label>
                <div class="col-sm-2">
                  <n:text name="form.dogName" cssClass="form-control"/>
                  <n:error name="form.dogName" />
                </div>
            </div>

            <n:button type="submit" uri="/action/dog/search" cssClass="btn btn-success mx-auto d-block">検索</n:button>


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
