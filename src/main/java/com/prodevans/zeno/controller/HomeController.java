package com.prodevans.zeno.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.prodevans.zeno.pojo.UserInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView loginhome(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return new ModelAndView("redirect:login", "user", new UserInfo());
	}

	@RequestMapping(value = "/paymentresponse", method = RequestMethod.GET)
	public ModelAndView paymentresponse(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return new ModelAndView("paymentresponse");
	}

	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public String
	 * login(@ModelAttribute("user") UserInfo user, ModelMap model, HttpSession
	 * session) { model.addAttribute("user", user); session.setAttribute("user",
	 * user); return "redirect:dashboard";
	 * 
	 * }
	 */

}
