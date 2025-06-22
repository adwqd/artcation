package com.webserver.project.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;


@Controller
public class CustomErrorController implements ErrorController {
    
    private static final String ERROR_PATH = "/error";
    
    @RequestMapping(value = ERROR_PATH)
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        Object exception = request.getAttribute(RequestDispatcher.ERROR_EXCEPTION);
        Object message = request.getAttribute(RequestDispatcher.ERROR_MESSAGE);
        Object requestUri = request.getAttribute(RequestDispatcher.ERROR_REQUEST_URI);
        
        // 에러 정보를 모델에 추가 (필요한 경우)
        if (status != null) {
            model.addAttribute("statusCode", status.toString());
        }
        
        if (exception != null) {
            model.addAttribute("exception", exception.toString());
        }
        
        if (message != null) {
            model.addAttribute("errorMessage", message.toString());
        }
        
        if (requestUri != null) {
            model.addAttribute("requestUri", requestUri.toString());
        }
        
        return "error";
    }
    
    public String getErrorPath() {
        return ERROR_PATH;
    }
} 