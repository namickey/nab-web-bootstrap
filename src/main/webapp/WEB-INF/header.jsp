<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="/action/dog/top">DogPay</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav mr-auto">
      <!--
      <a class="nav-item nav-link active" href="/">Home <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link active" href="/">Features</a>
      <a class="nav-item nav-link active" href="/">Pricing</a>
      <a class="nav-item nav-link active" href="/">Disabled</a>
      -->
    </div>
    <div class="navbar-nav">
        <span class="navbar-text"><n:write name="name"/></span>
        <a class="nav-item nav-link active" href="/action/dog/login/logout">Logout</a>
    </div>
  </div>
</nav>
