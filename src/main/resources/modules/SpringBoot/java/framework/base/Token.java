package ${basePackage}.framework.base;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

/**
 * Token - 通行证类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class Token implements Serializable {
    private static final Long serialVersionUID = 1L;
    /** ID */
    private long id;
    /** 用户ID */
    private long userId;
    /** 用户名称 */
    private String userName;

    private Set<String> resourceSet = new HashSet<>();


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public boolean hasResource(String resource){
        return resourceSet.contains(resource);
    }

    public void putResource(String resource){
        resourceSet.add(resource);
    }
}
