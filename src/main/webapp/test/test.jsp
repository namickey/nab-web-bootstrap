<%--
TODO 疎通確認用のクラスです。確認完了後、ディレクトリごと削除してください。
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Webアプリケーション疎通確認</title>
</head>
<body>
<h1>Congratulations!</h1>

アプリケーションのデプロイに成功しました。
以下の疎通確認結果を確認してください。

<h2>各機能の疎通確認結果</h2>

<h3>ディスパッチ機能</h3>

<%-- このJSPに遷移しているということはディスパッチは機能している --%>
ディスパッチ機能は正常に動作しています。

<h3>セッションストア</h3>

リロードする度に、以下のカウンタがカウントアップされていれば成功です。
<p>
カウンタ：<n:write name="number"/>
</p>

<h3>コード管理機能</h3>
セレクトメニューが表示されていれば成功です。

<n:form name="dummyForm">
  <n:codeSelect name="sample.codeSelectValues" codeId="C0000001" multiple="true"/>
</n:form>

<h3>データベースアクセス機能</h3>

<%-- コード機能で例外は発生しないということは、DBアクセスは機能している --%>
データベースアクセス機能は正常に動作しています。

<h3>メッセージ管理機能</h3>
<p>
「」内にメッセージが表示されていれば成功です。
</p>
メッセージID=errors.doubleSubmission のメッセージは
<p>
「<n:message messageId="errors.doubleSubmission" />」
</p>
です。

<h3>リソースマッピング</h3>
<p>
画像が表示されていれば成功です。
</p>

<n:img src="/test/nablarch-logo.jpg" alt="logo"/>

<hr/>
確認完了後は、疎通確認用のリソースを削除してください。

</body>
</html>