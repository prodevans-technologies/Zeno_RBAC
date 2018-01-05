package com.prodevans.zeno.dao.mapper;

import org.springframework.beans.factory.config.SingletonBeanRegistry;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.prodevans.zeno.dao.impl.FeedbackDAOImpl;

public class DeleteApplicationContext 
{

	public static void main(String cp[])
	{
		ConfigurableApplicationContext context = new ClassPathXmlApplicationContext(new String[] {"rpc-cong.xml"});

		FeedbackDAOImpl cust = (FeedbackDAOImpl)context.getBean("FeedbackDAOImpl");

		    	System.out.println(cust);

		    	context.close();
	}
}
