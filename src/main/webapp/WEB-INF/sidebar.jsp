<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        <div class="col-3 p-4 border-right" style="min-width:290px;max-width:290px;">
            <div class="card m-1">
                <div class="card-header text-white bg-primary">
                    検索
                </div>
                <div class="card-body">
                    <n:form>
                    <n:hiddenStore name="nablarch_hiddenStore" />
                        <div class="form-group">
                            <label for="form.name">Dog名</label>
                            <div class="form-inline flex-nowrap">
                                <n:text name="form.dogName" cssClass="form-control" size="10"/>
                                <n:button type="submit" uri="/action/dog/find" cssClass="btn btn-success">検索</n:button>
                            </div>
                            <n:error name="form.dogName" />
                        </div>
                    </n:form>
                    <n:form>
                        <n:button type="submit" uri="/" cssClass="btn btn-success">Dog名寄せ</n:button>
                    </n:form>
                </div>
            </div>
            <div class="card m-1">
                <div class="card-header text-white bg-primary">
                    その他
                </div>
                <div class="card-body">
                    <nav class="nav flex-column">
                        <a class="nav-link active" href="/">チワワ</a>
                        <a class="nav-link active" href="/">プードル</a>
                        <a class="nav-link active" href="/">コーギー</a>
                        <a class="nav-link active" href="/">ブル</a>
                    </nav>
                </div>
            </div>
        </div>
