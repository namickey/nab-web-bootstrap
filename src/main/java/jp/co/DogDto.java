package jp.co;

import lombok.Data;
import nablarch.common.databind.csv.Csv;

import java.io.Serializable;

@Data
@Csv(headers = {"id", "name", "color"}, properties = {"id", "name", "color"},type = Csv.CsvType.DEFAULT)
public class DogDto implements Serializable {

    private static final long serialVersionUID = 1L;
    private String id;
    private String name;
    private String color;
}
