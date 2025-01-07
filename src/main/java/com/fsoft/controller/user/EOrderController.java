package com.fsoft.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
public class EOrderController {

    @GetMapping("/user/order")
    public ModelAndView index(@ModelAttribute("message") HashMap<String, String> message) {
        ModelAndView mav = new ModelAndView("user/order/index");
        mav.addObject("message", message);
        return mav;
    }

}
