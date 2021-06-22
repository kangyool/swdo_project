package com.swdo.test.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.api.gax.paging.Page;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.google.common.collect.Lists;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws IOException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() throws IOException {
		
//		String jsonPath = "";
//		
//		authExplicit(jsonPath);
		
		return "home";
	}
	
//	  void authExplicit(String jsonPath) throws IOException {
//		    // You can specify a credential file by providing a path to GoogleCredentials.
//		    // Otherwise credentials are read from the GOOGLE_APPLICATION_CREDENTIALS environment variable.
//		    GoogleCredentials credentials = GoogleCredentials.fromStream(new FileInputStream(jsonPath))
//		          .createScoped(Lists.newArrayList("https://www.googleapis.com/auth/cloud-platform"));
//		    Storage storage = StorageOptions.newBuilder().setCredentials(credentials).build().getService();
//
//		    System.out.println("Buckets:");
//		    Page<Bucket> buckets = storage.list();
//		    for (Bucket bucket : buckets.iterateAll()) {
//		      System.out.println(bucket.toString());
//		    }
//		  }
	
}
