package ${basePackage}.action;

import ${basePackage}.framework.utils.LogUtil;
import ${basePackage}.framework.base.FileUploadResponse;
import ${basePackage}.framework.base.BaseResponse;
import ${basePackage}.framework.base.ErrorType;
import ${basePackage}.framework.base.Screen;
import ${basePackage}.framework.utils.LocalData;
import ${basePackage}.framework.config.BeanDefinitionRegistryConfig;
import org.springframework.beans.BeansException;
import org.apache.commons.io.FileUtils;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Value;

@Controller
@ControllerAdvice
public class GlobalController implements ErrorController {

    @Value("${r'${web.welcome.page}'}")
    private String homePage;

    /**
     * 全局异常捕捉
     *
     * @param request
     * @param response
     * @param exception 要捕获的异常
     * @return
     */
    @ExceptionHandler(Exception.class)
    public String excepitonHandler(HttpServletRequest request, HttpServletResponse response, Model model, Exception exception) {
        StringBuffer msg = new StringBuffer("");
        if (exception != null) {
            msg = new StringBuffer("");
            String message = exception.toString();
            int length = exception.getStackTrace().length;
            if (length > 0) {
                msg.append("<a>").append(message).append("</a><br>");
                for (int i = 0; i < length; i++) {
                    msg.append("<a>").append(exception.getStackTrace()[i]).append("</a><br>");
                }
            } else {
                msg.append(message);
            }
        }
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        model.addAttribute("msg", msg.toString());
        return "500";
    }

    private final static String ERROR_PATH = "/error";

    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }

    @RequestMapping(value = ERROR_PATH)
    public String error(HttpServletRequest request) {
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");

        switch (statusCode) {
            case 404:
                return "404";
            case 403:
                return "403";
            case 500:
                return "500";
            default:
                return "403";
        }
    }

    /**
     * 当未明确指定控制器时，走该请求，默认返回对应的layout布局和screen视图
     * 当需要使用layout时，不需要返回值，ViewNameTranslator会处理对应关系
     * @param model
     * @param request
     */
    @RequestMapping("/**")
    public void hold(HttpServletRequest request, Model model) {
        HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();

        // 处理根Url
        String servletPath = request.getServletPath();
        if ("/".equals(servletPath)) {
            servletPath = "/" + homePage;
        }
        LocalData.setTarget(servletPath);

        // 尝试执行Target Screen执行器(服务器渲染)，不存在则直接返回视图模板(Ajax渲染)
        Screen screenExec = null;
        try {
            servletPath = servletPath.replaceAll("/", ".").toLowerCase();
            screenExec = LocalData.getApplicationContext().getBean(BeanDefinitionRegistryConfig.SCREEN_PREFIX + servletPath, Screen.class);
            screenExec.exec(model, request, response);
        } catch (BeansException e) {

        }

        //todo 可在此获取共性数据(也可以在全局拦截器GlobalHandlerInterceptor、拦截器作用域比此更高)，
        //todo 例如用户信息等。其他业务数据在页面渲染后通过Ajax请求
    }

    @RequestMapping("/upload")
    @ResponseBody
    public BaseResponse upload(HttpServletRequest request) {
        FileUploadResponse fileUploadResponse = new FileUploadResponse();
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        MultipartFile target = multipartHttpServletRequest.getFile("file");

        String fileName = target.getOriginalFilename();

        //========
        //处理文件
        //========
        fileUploadResponse.setId(1L);
        fileUploadResponse.setUrl("example.com\\img\\1.jpg");
        fileUploadResponse.setDownloadUrl("example.com\\img\\1.jpg");


        if (target != null) {
            fileUploadResponse.addError(ErrorType.BUSINESS_ERROR, "文件上传成功,但未处理文件[" + fileName + "]!");
        } else {
            fileUploadResponse.addError(ErrorType.BUSINESS_ERROR, "文件上传失败!");
        }

        return fileUploadResponse;
    }

    @RequestMapping("/download")
    @ResponseBody
    public ResponseEntity<byte[]> download(@RequestParam(value = "file", required = false) String file) throws IOException {

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", file);

        //========
        //下载DEMO
        //========
        if (file == null) {
            file = "test.txt";
            headers.setContentDispositionFormData("attachment", file);
            return new ResponseEntity<byte[]>("test".getBytes(),
                    headers, HttpStatus.CREATED);
        }

        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(new File(file)),
                headers, HttpStatus.CREATED);
    }
}
