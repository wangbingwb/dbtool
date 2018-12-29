package ${domain};

import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.RequestBody;
import okio.Buffer;
import okio.BufferedSink;
import okio.Okio;
import okio.Source;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;

public abstract class ProgressRequestBody extends RequestBody {

    public static RequestBody createProgressRequestBody(final MediaType contentType, final File file, final ProgressListener listener) {

        return new RequestBody() {

            @Override
            public MediaType contentType() {
                return contentType;
            }

            @Override
            public long contentLength() {
                return file.length();
            }

            @Override
            public void writeTo(BufferedSink sink) throws IOException {
                Source source;
                source = Okio.source(file);
                if (listener != null) {
                    try {
                        Buffer buf = new Buffer();
                        Long remaining = contentLength();
                        for (long readCount; (readCount = source.read(buf, 102400)) != -1; ) {
                            sink.write(buf, readCount);
                            listener.onProgress(contentLength(), remaining -= readCount, remaining == 0);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
                    sink.writeAll(source);
                }

            }
        };
    }

    public static RequestBody createProgressRequestBody(final String data, final ProgressListener listener) {

        return new RequestBody() {

            @Override
            public MediaType contentType() {
                return MultipartBody.FORM;
            }

            @Override
            public long contentLength() {
                return data.length();
            }

            @Override
            public void writeTo(BufferedSink sink) throws IOException {
                Source source;
                ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(data.getBytes());
                source = Okio.source(byteArrayInputStream);
                if (listener != null) {
                    try {
                        Buffer buf = new Buffer();
                        Long remaining = contentLength();
                        for (long readCount; (readCount = source.read(buf, 102400)) != -1; ) {
                            sink.write(buf, readCount);
                            listener.onProgress(contentLength(), remaining -= readCount, remaining == 0);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
                    sink.writeAll(source);
                }

            }
        };
    }

    public interface ProgressListener {
        void onProgress(long totalBytes, long remainingBytes, boolean done);
    }
}
