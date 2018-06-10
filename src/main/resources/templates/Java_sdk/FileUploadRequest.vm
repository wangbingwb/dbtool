package ${domain};

import java.io.File;

/**
 * FileUploadRequest - 文件上传请求
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class FileUploadRequest implements ApiRequest<FileUploadResponse> {
    private File file;

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void check() {

    }

    public String apiMethod() {
        return "api.file.upload";
    }

    public Class<FileUploadResponse> responseClass() {
        return FileUploadResponse.class;
    }
}
