package com.fsoft.controller.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fsoft.utils.SecurityUtils;

@Controller
public class DashBoardController {
	 @RequestMapping(value = "/", method = RequestMethod.GET)
	   public RedirectView firstPage() {
		 	RedirectView redirectView = new RedirectView();
	        redirectView.setUrl("admin/dashboard");
	        return redirectView;
	  }
	 
	 @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')")
	 @RequestMapping(value = "admin/dashboard", method = RequestMethod.GET)
	   public ModelAndView homePage(@ModelAttribute("message") HashMap<String, String> message) {
	      ModelAndView mav = new ModelAndView("admin/dashboard/dashboard");
	      mav.addObject("message", message);
	      return mav;
	  }
}
