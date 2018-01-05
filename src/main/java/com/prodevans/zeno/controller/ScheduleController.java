package com.prodevans.zeno.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.prodevans.zeno.dao.impl.ScheduleDAOImpl;
import com.prodevans.zeno.pojo.SessionDetails;

@Controller
public class ScheduleController {

    @Autowired
    private ScheduleDAOImpl scheduleDAOImpl;

    /**
     * Created logger object for the logging.
     */
    private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);

    @RequestMapping(value = "/time-schedule", method = RequestMethod.POST)
    public String timeschedule(ModelMap model, HttpSession session, @RequestParam(name = "time_start_time", required = false) String start_time, @RequestParam(name = "time_end_time", required = false) String end_time) {
        if (session.getAttribute("user") == null) {
            return "redirect:/logout";
        } else {
            SessionDetails user = (SessionDetails) session.getAttribute("user");

            String time = start_time.trim() + "-" + end_time.trim();

            System.out.println("Time : " + time);

            if (scheduleDAOImpl.applyTimeSchedule(user.getDomid(), user.getActid() + "_SCHEDULE", "daily", time, user.getActid() + "_access_policy_rule")) {
                logger.info("Daily schedule applied successfully..");
                session.setAttribute("time_msg", "Schedule applied successfully.");

            } else {
                logger.info("Daily schedule was not applied..");
                session.setAttribute("time_msg", "Oops! Scheduling failed. Please try again.");
            }

            return "redirect:control";
        }

    }

    @RequestMapping(value = "/days-schedule", method = RequestMethod.POST)
    public String dayschedule(ModelMap model, HttpSession session, @RequestParam(name = "days_start_time", required = false) String start_time, @RequestParam(name = "days_end_time", required = false) String end_time, @RequestParam(name = "days_days_checkbox", required = false) ArrayList<String> days_days_checkbox) {
        if (session.getAttribute("user") == null) {
            return "redirect:/logout";
        } else {
            String time = start_time.trim() + "-" + end_time.trim();
            System.out.print("Time : " + time);

            if(days_days_checkbox == null)
            {
            	logger.info("User has not selected days..");
                session.setAttribute("day_msg", "Oops! You have not selected days.");
                return "redirect:control";
            }
            
            for (String string : days_days_checkbox) {
                System.out.println("Days : " + string);
            }

            //fetching the user details from the session.
            SessionDetails user = (SessionDetails) session.getAttribute("user");

            if (scheduleDAOImpl.applyDaysSchedule(user.getDomid(), user.getActid() + "_SCHEDULE", days_days_checkbox, time, user.getActid() + "_access_policy_rule")) {
                logger.info("Days schedule applied successfully..");
                session.setAttribute("day_msg", "Schedule applied successfully.");

            } else {
                logger.info("Days schedule was not applied..");
                session.setAttribute("day_msg", "Oops! Scheduling failed. Please try again.");
            }

            return "redirect:control";
        }

    }

    @RequestMapping(value = "/non-recurring-schedule", method = RequestMethod.POST)
    public String nonrecurringschedule(ModelMap model, HttpSession session, @RequestParam(name = "dates_start_time", required = false) String start_time, @RequestParam(name = "dates_end_time", required = false) String end_time, @RequestParam(name = "dates_start_date", required = false) String dates_start_date, @RequestParam(name = "dates_end_date", required = false) String dates_end_date) {
        if (session.getAttribute("user") == null) {
            return "redirect:/logout";
        } else {
            String time = start_time.trim() + "-" + end_time.trim();
            System.out.print("Time : " + time);

            System.out.print("dates_start_date : " + dates_start_date);
            System.out.print("dates_end_date : " + dates_end_date);

            String when = dates_start_date + "@" + start_time + "-" + dates_end_date + "@" + end_time;

            System.out.print("When : " + when);

            //fetching the user details from the session.
            SessionDetails user = (SessionDetails) session.getAttribute("user");

            if (scheduleDAOImpl.applyNonRecurringSchedule(user.getDomid(), user.getActid() + "_SCHEDULE", when, user.getActid() + "_access_policy_rule")) {
                logger.info("Non-Recurring schedule applied successfully..");
                session.setAttribute("date_msg", "Schedule applied successfully.");

            } else {
                logger.info("Non-Recurring schedule was not applied..");
                session.setAttribute("date_msg", "Oops! Scheduling failed. Please try again.");
            }

            return "redirect:control";
        }

    }

}
