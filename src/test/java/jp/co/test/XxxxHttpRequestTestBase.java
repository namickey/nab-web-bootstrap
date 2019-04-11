package jp.co.test;

import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.test.core.http.AbstractHttpRequestTestTemplate;
import nablarch.test.core.http.Advice;
import nablarch.test.core.http.HttpRequestTestSupport;
import nablarch.test.core.http.TestCaseInfo;

/**
 * 本プロジェクト専用の{@link HttpRequestTestSupport}継承クラス。<br/>
 * プロジェクト固有の共通処理を提供する。
 * 画面オンライン処理方式のリクエスト単体テストを作成する場合、
 * {@link HttpRequestTestSupport}を直接継承するのではなく、
 * 本クラスを継承すること。
 */
// TODO XxxxをPJ名に変更してください(例:MyProjectHttpRequestTestBase)。
public abstract class XxxxHttpRequestTestBase
        extends AbstractHttpRequestTestTemplate<TestCaseInfo> {

    /** コンストラクタ。*/
    protected XxxxHttpRequestTestBase() {
        super();
    }

    /**
     * コンストラクタ。
     * @param testClass テストクラス
     */
    public XxxxHttpRequestTestBase(Class<?> testClass) {
        super(testClass);
    }

    /**
     * リクエスト単体時には、リクエストパラメータに排他制御情報を記載しなくてすむようにするため、
     * 一律、リクエストパラメータにダミーのバージョン情報を格納する。
     *
     * @param testCaseInfo テストケース情報
     * @param context      ExecutionContextインスタンス
     * @param advice       実行前後の処理を実装した{@link Advice}
     */
    @Override
    protected void beforeExecuteRequest(TestCaseInfo testCaseInfo, ExecutionContext context, Advice<TestCaseInfo> advice) {
        super.beforeExecuteRequest(testCaseInfo, context, advice);
        HttpRequest request = testCaseInfo.getHttpRequest();
        request.setParam("nablarch_version", "version=1|versionColumnName=VERSION");
    }
}
