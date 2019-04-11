package jp.co;

import nablarch.common.web.session.SessionUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;

/**
 * 疎通確認用のアクションクラス。
 *
 * 以下の機能について、疎通確認を行う。
 * <ul>
 *     <li>ディスパッチ機能</li>
 *     <li>データベースアクセス</li>
 *     <li>メッセージ機能</li>
 *     <li>コード機能</li>
 *     <li>スレッドコンテキスト</li>
 *     <li>リソースマッピング</li>
 * </ul>
 * <p>
 * 疎通確認に失敗した場合は、その時点で例外が発生する。
 * </p>
 * <p>
 * 全ての疎通確認に成功した場合、画面に疎通確認結果が表示される。
 *
 * @deprecated TODO 疎通確認用のクラスです。確認完了後、削除してください。
 */
public class SampleAction {

    /**
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    public HttpResponse index(HttpRequest request, ExecutionContext context) {
        //セッションストアの動作確認用
        //(DBストア使用時(デフォルトはDBストア)、USER_SESSIONテーブルにセッションのデータが格納されます。疎通確認後、USER_SESSIONテーブルのデータを削除してください)
        Integer number = SessionUtil.or(context, "number", Integer.valueOf(0));
        context.setRequestScopedVar("number", number);
        SessionUtil.put(context, "number", number + 1);

        return new HttpResponse("/test/test.jsp");
    }


}
