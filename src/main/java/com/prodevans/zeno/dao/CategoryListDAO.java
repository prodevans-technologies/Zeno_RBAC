/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.prodevans.zeno.dao;

import java.util.ArrayList;

import com.prodevans.zeno.pojo.CategoryList;

/**
 *
 * @author rajanikant
 */
public interface CategoryListDAO {
    CategoryList getCategoryList(String protection_status, String domain_id);
  //  boolean updateCategoryList(String block_category, String allow_category,String domain_id,String user_id,String select_update);
	boolean updateCategoryList(ArrayList<String> block_category, ArrayList<String> allow_category, String domain_id,
			String user_id, String select_update);
	
	boolean updateFilterPattern(ArrayList<String> filter_pattern_remove, String domain_id,String select_update);
	
}
