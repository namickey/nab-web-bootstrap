package jp.co;

import org.junit.ComparisonFailure;
import org.junit.Test;

import jp.co.test.XxxxHttpRequestTestBase;

import nablarch.core.repository.SystemRepository;


/**
 * {@link SampleAction}のテストクラス。
 *
 * @deprecated TODO 疎通確認用のクラスです。確認完了後、削除してください。
 */
public class SampleActionRequestTest extends XxxxHttpRequestTestBase {

    @Override
    protected String getBaseUri() {
        return "/action/";
    }

    @Test
    public void 疎通確認() {
        try {
            execute("疎通確認");
        } catch (ComparisonFailure e) {
            // 疎通確認失敗時にエラーメッセージを出力する。
            // 疎通確認用の処理であり、通常はこのような処理は行わない。
            throw is404Error(e) ? createError(e) : e;
        }
    }

    /**
     * リクエスト単体テスト実行結果が404エラーであるかどうかを判定する。
     *
     * @param error テスト実行時に発生したエラー
     * @return ステータスコードが404の場合、真
     */
    private boolean is404Error(ComparisonFailure error) {
        return error.getMessage().contains("[HTTP STATUS]")
                && error.getExpected().equals("200")
                && error.getActual().equals("404");
    }

    /**
     * 404エラー発生時に詳細情報を付加したエラーを生成する。
     *
     * @param cause 原因となったエラー
     * @return 新しいエラー
     */
    private AssertionError createError(ComparisonFailure cause) {
        String basePackage = SystemRepository.getString("nablarch.commonProperty.basePackage");
        String msg = "期待しない404エラーが発生しました。\n" +
                "コンポーネント'packageMapping'の設定に誤りの可能性があります。\n" +
                "環境設定項目${nablarch.commonProperty.basePackage}が正しく設定されているか確認してください。\n" +
                "現在の設定値=[" + basePackage + "].\n" +
                cause.getMessage();
        return new AssertionError(msg);
    }
}
