package com.example.example;

import com.example.example.req.NewTableGetRequest;
import com.example.example.rsp.NewTableGetResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "EXAMPLE-WEB")
public interface ClientService {
    @PostMapping("/user")
    NewTableGetResponse findById(@RequestBody NewTableGetRequest request,@RequestParam("tokenId") Long id);
}
