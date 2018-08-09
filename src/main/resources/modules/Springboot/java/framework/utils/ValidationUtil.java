package ${basePackage}.framework.utils;

import ${basePackage}.framework.base.BaseRequest;
import ${basePackage}.framework.base.BaseResponse;
import ${basePackage}.framework.base.ErrorType;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * 验证工具类。提供一些通用简单的数据验证功能。
 */
public class ValidationUtil {

    private static ValidatorFactory factory = Validation.buildDefaultValidatorFactory();

    public static <T extends BaseResponse> T validate(BaseRequest req, T response) {

        if (req == null) {
            response.addError(ErrorType.EXPECTATION_NULL, "请求对象不能为空");
            return response;
        }

        try {
            Validator validator = factory.getValidator();

            Set<ConstraintViolation<BaseRequest>> constraintViolations = validator.validate(req);

            if (constraintViolations.size() > 0) {
                for (ConstraintViolation<BaseRequest> violation : constraintViolations) {
                    response.addError(ErrorType.INVALID_PARAMETER, violation.getMessage());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            LogUtil.dumpException(e);
            response.addError(ErrorType.BUSINESS_ERROR, e.getMessage());
        }
        return response;
    }
}
