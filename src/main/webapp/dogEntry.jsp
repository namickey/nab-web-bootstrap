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

<%@ include file="/WEB-INF/header.jsp"%>

<div class="container-fluid p-0">
    <div class="row flex-nowrap">

        <%@ include file="/WEB-INF/sidebar.jsp"%>

        <main class="col-9 p-4">
            <%@ include file="/WEB-INF/dogNav.jsp"%>

                <n:form>
                    <n:hiddenStore name="nablarch_hiddenStore" />
                    <h3>
                        Dog名 : <n:write name="name"/>ちゃん
                    </h3>
                    <n:errors/>

                    <div class="form-group col-md-6">
                      <label for="inputEmail4">Email</label>
                      <n:text name="form.email" cssClass="form-control" id="inputEmail4" placeholder="Email"/>
                      <n:error name="form.email" />
                    </div>
                    <div class="form-group col-md-6">
                      <label for="inputPassword4">Password</label>
                      <n:text name="form.password" cssClass="form-control" id="inputPassword4" placeholder="Password"/>
                    </div>
                  <div class="form-group col-md-6">
                    <label for="inputAddress">Address</label>
                    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="inputAddress2">Address 2</label>
                    <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
                  </div>

                  <div class="form-group">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="gridCheck">
                      <label class="form-check-label" for="gridCheck">
                        Check me out
                      </label>
                    </div>
                  </div>
                  <n:button type="submit" uri="/action/dog/some" cssClass="btn btn-secondary">戻る</n:button>
                  <n:button type="submit" uri="/action/dog/entryDog" cssClass="btn btn-info">登録</n:button>
                </n:form>

        </main>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
