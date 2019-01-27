package com.example.action;

import com.example.framework.base.BaseResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@ResponseBody
@RequestMapping("/feign")
public class FeignController {

    @RequestMapping(value = "/user/", method = RequestMethod.POST)
    public BaseResponse d(@RequestBody   asd) {

        return newTableGetResponse;
    }
}
