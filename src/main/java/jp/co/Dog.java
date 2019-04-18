package jp.co;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * 
 *
 */
@Generated("GSP")
@Entity
@Table(schema = "PUBLIC", name = "DOG")
public class Dog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**  */
    private String id;

    /**  */
    private String name;

    /**  */
    private String color;
    /**
     * を返します。
     *
     * @return 
     */
    @Id
    @Column(name = "ID", length = 100, nullable = false, unique = true)
    public String getId() {
        return id;
    }

    /**
     * を設定します。
     *
     * @param id 
     */
    public void setId(String id) {
        this.id = id;
    }
    /**
     * を返します。
     *
     * @return 
     */
    @Column(name = "NAME", length = 100, nullable = false, unique = false)
    public String getName() {
        return name;
    }

    /**
     * を設定します。
     *
     * @param name 
     */
    public void setName(String name) {
        this.name = name;
    }
    /**
     * を返します。
     *
     * @return 
     */
    @Column(name = "COLOR", length = 100, nullable = true, unique = false)
    public String getColor() {
        return color;
    }

    /**
     * を設定します。
     *
     * @param color 
     */
    public void setColor(String color) {
        this.color = color;
    }
}
