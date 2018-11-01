package xyz.wbsite.dbtool.web.framework.base;

/**
 * BaseFindRequest - 基类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class BaseFindRequest extends BaseRequest {
    private long pageNumber = 1L;
    private long pageSize = 10L;
    private long beginIndex = 0;
    private long endIndex = 10;
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

    public long getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(long pageNumber) {
        this.pageNumber = pageNumber;
    }

    public long getPageSize() {
        return pageSize;
    }

    public void setPageSize(long pageSize) {
        this.pageSize = pageSize;
    }

    public long getBeginIndex() {
        beginIndex = pageSize * (pageNumber - 1);
        return beginIndex;
    }

    public void setBeginIndex(long beginIndex) {
        this.beginIndex = beginIndex;
    }

    public long getEndIndex() {
        endIndex = pageSize * (pageNumber - 1) + pageSize;
        return endIndex;
    }

    public void setEndIndex(long endIndex) {
        this.endIndex = endIndex;
    }

    public void updatePageNumber(Long totalCount){
        long maxPage = totalCount / pageSize + (totalCount % pageSize > 0 ? 1 : 0);

        if (pageNumber > maxPage){
            pageNumber = maxPage;
        }
    }
}
