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
    private String fileName;
    private File file;
    private byte[] bytes;

    public void setFile(File file) {
        this.file = file;
        this.fileName = file.getName();
        this.bytes = null;
    }

    public void setFile(byte[] bytes, String fileName) {
        this.bytes = bytes;
        this.fileName = fileName;
        this.file = null;
    }

    public boolean isExist() {
        if ((file != null && file.exists()) || bytes != null) {
            return true;
        }
        return false;
    }

    public File getFile() {
        return file;
    }

    public byte[] getBytes() {
        return bytes;
    }

    public String getFileName() {
        return fileName;
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
