package ${basePackage}.framework.base;

/**
 * BaseFindRequest - 基类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class BaseFindRequest extends BaseGetAllRequest {
    private int pageNumber = 1;
    private int pageSize = 10;
    private int beginIndex = 0;
    private int endIndex = 10;

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getBeginIndex() {
        beginIndex = pageSize * (pageNumber - 1);
        return beginIndex;
    }

    public void setBeginIndex(int beginIndex) {
        this.beginIndex = beginIndex;
    }

    public int getEndIndex() {
        endIndex = pageSize * (pageNumber - 1) + pageSize;
        return endIndex;
    }

    public void setEndIndex(int endIndex) {
        this.endIndex = endIndex;
    }

    public void updatePageNumber(int totalCount){
        int maxPage = totalCount / pageSize + (totalCount % pageSize > 0 ? 1 : 0);

        if (pageNumber > maxPage){
            pageNumber = maxPage;
        }
    }
}
