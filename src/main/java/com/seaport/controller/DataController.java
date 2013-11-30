package com.seaport.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seaport.domain.DataTablesRequest;
import com.seaport.domain.DataTablesResponse;

@Controller
@RequestMapping(value="/api")
public class DataController {

    @RequestMapping(value="/data", method= RequestMethod.POST)
    public @ResponseBody
    DataTablesResponse<Object> getData(@RequestBody DataTablesRequest dtReq, HttpServletResponse response) {
        return new DataTablesResponse<Object>();
    }
}
