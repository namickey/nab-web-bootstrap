package jp.co.domain;

import nablarch.core.validation.ee.Length;
import nablarch.core.validation.ee.SystemChar;

/**
 * ドメイン定義。
 */
public class SampleDomainBean {

    /**
     * ドメイン定義の例。
     */
    @SystemChar(charsetDef = "システム許容文字")
    @Length(min = 3, max = 5)
    public String exampleDomain;
}
