
package com.prodevans.zeno.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.xmlrpc.XmlRpcException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.prodevans.zeno.dao.impl.ProfileDAOImpl;
import com.prodevans.zeno.pojo.ChangePassword;
import com.prodevans.zeno.pojo.ProfileDetails;
import com.prodevans.zeno.pojo.SendMailDetails;
import com.prodevans.zeno.pojo.SessionDetails;

@Controller
@RequestMapping(value = "/profile")
public class ProfileController {
	@Autowired
	private ProfileDAOImpl profileImpl;

	/**
	 * @param profileImpl
	 *            the profileImpl to set
	 */
	public void setProfileImpl(ProfileDAOImpl profileImpl) {
		this.profileImpl = profileImpl;
	}

	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String billingPayment(@RequestParam(name = "result", required = false) String result, Locale locale,
			ModelMap model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		} else {
			SessionDetails user = (SessionDetails) session.getAttribute("user");
			ProfileDetails userdetails = new ProfileDetails();
			model.addAttribute("result", result);
			try {
				userdetails = profileImpl.getProfile(user.getActid());
				model.addAttribute("profile", userdetails);
				ChangePassword changePassword = new ChangePassword();
				changePassword.setActid(user.getActid());
				model.addAttribute("change_pass", changePassword);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "profile";
		}
	}

	@RequestMapping(value = "/change-pass", method = RequestMethod.POST)
	public String ChangePass(ModelMap model, HttpSession session,@ModelAttribute("change_pass") ChangePassword pass) {
		boolean result = false;
		boolean result1= false;
		try {

			if (!pass.getPassword().isEmpty()) {
				if (pass.getPassword().equals(pass.getConfirm_password())) {
					SessionDetails user = (SessionDetails) session.getAttribute("user");
					result = profileImpl.updatePassword(pass.getActid(), pass.getPassword());
					result1= profileImpl.sentMailChangePassword(user);
					
					
					if (result)
						model.addAttribute("result", "Password has been changed successfuly");
					else
						model.addAttribute("result", "Something went wrong");
				} else {
					model.addAttribute("result", "Entered password is not matched with confirm password");
				}
			} else {
				model.addAttribute("result", "Password field must not be empty");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/profile";
	}
	
}



