package ${domain};

import okhttp3.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class DownloadUtil {
    public static class Builder {
        private String savePath;
        private String saveName;
        private String fileUrl;
        private OnDownloadListener onDownloadListener;

        public Builder setFileUrl(String fileUrl) {
            this.fileUrl = fileUrl;
            return this;
        }

        public Builder setSavePath(String savePath) {
            this.savePath = savePath;
            return this;
        }

        public Builder setSaveName(String saveName) {
            this.saveName = saveName;
            return this;
        }

        public Builder setFileName(OnDownloadListener onDownloadListener) {
            this.onDownloadListener = onDownloadListener;
            return this;
        }

        public void start() {
            if (savePath == null){
                System.err.println("savePath can not be null!");
                return;
            }
            if (saveName == null){
                saveName = getNameFromUrl(fileUrl);
            }

            if (onDownloadListener == null){
                onDownloadListener = new OnDownloadListener() {
                    @Override
                    public void onFinish() {

                    }

                    @Override
                    public void onUpdate(int progress) {

                    }

                    @Override
                    public void onFailed() {

                    }
                };
            }

            DownloadUtil.download(fileUrl, savePath, saveName, onDownloadListener);
        }
    }

    /**
     * @param url      下载连接
     * @param savePath 储存目录
     * @param saveName 储存文件名
     * @param listener 下载监听
     */
    public static void download(final String url, final String savePath, final String saveName, final OnDownloadListener listener) {
        OkHttpClient okHttpClient = new OkHttpClient();
        Request request = new Request.Builder().url(url).build();
        okHttpClient.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                // 下载失败
                listener.onFailed();
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {
                InputStream is = null;
                byte[] buf = new byte[2048];
                int len = 0;
                FileOutputStream fos = null;
                // 储存下载文件的目录
                File saveP = new File(savePath);
                if (!saveP.exists()) {
                    saveP.mkdirs();
                }
                try {
                    is = response.body().byteStream();
                    long total = response.body().contentLength();
                    File saveF = new File(savePath, saveName);
                    fos = new FileOutputStream(saveF);
                    long sum = 0;
                    while ((len = is.read(buf)) != -1) {
                        fos.write(buf, 0, len);
                        sum += len;
                        int progress = (int) (sum * 1.0f / total * 100);
                        // 下载中
                        listener.onUpdate(progress);
                    }
                    fos.flush();
                    // 下载完成
                    listener.onFinish();
                } catch (Exception e) {
                    listener.onFailed();
                } finally {
                    try {
                        if (is != null)
                            is.close();
                    } catch (IOException e) {
                    }
                    try {
                        if (fos != null)
                            fos.close();
                    } catch (IOException e) {
                    }
                }
            }
        });
    }

    /**
     * @param url
     * @return 从下载连接中解析出文件名
     */
    private static String getNameFromUrl(String url) {
        return url.substring(url.lastIndexOf("/") + 1);
    }

    public interface OnDownloadListener {
        /**
         * 下载成功
         */
        void onFinish();

        /**
         * @param progress 下载进度
         */
        void onUpdate(int progress);

        /**
         * 下载失败
         */
        void onFailed();
    }
}
