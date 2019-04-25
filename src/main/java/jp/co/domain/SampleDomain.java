package jp.co.domain;

import nablarch.core.validation.domain.DomainDefinition;
import nablarch.core.validation.domain.DomainValidationHelper;
import nablarch.core.validation.validator.Length;
import nablarch.core.validation.validator.unicode.SystemChar;

import java.lang.annotation.Annotation;
import java.util.List;

public enum SampleDomain implements DomainDefinition {

    @Length(max = 10)
    @SystemChar(charsetDef = "全角文字")
    NAME,

    @Length(min = 8, max = 8)
    @SystemChar(charsetDef = "半角数字")
    DATE;

    // インタフェースで定義されているメソッドの実装
    // 実装する内容は、この例と全く同じとすること
    @Override
    public Annotation getConvertorAnnotation() {
        return DomainValidationHelper.getConvertorAnnotation(this);
    }

    @Override
    public List<Annotation> getValidatorAnnotations() {
        return DomainValidationHelper.getValidatorAnnotations(this);
    }
}
