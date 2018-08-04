package ${basePackage}.framework.base;

/**
 * BaseFindRequest - 基类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class BaseGetAllRequest extends BaseRequest {

    private String sortKey;

    private SortType sortType;

    public String getSortKey() {
        return sortKey;
    }

    public void setSortKey(String sortKey) {
        this.sortKey = sortKey;
    }

    public SortType getSortType() {
        return sortType;
    }

    public void setSortType(SortType sortType) {
        this.sortType = sortType;
    }

}
