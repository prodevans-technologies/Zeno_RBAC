/*
 * this class is created for the list all category by the protection level.
 */
package com.prodevans.zeno.pojo;

import java.util.ArrayList;

/**
 *
 * @author rajanikant
 */
public class CategoryList {

    private ArrayList<String> blocked_catogery;
    private ArrayList<String> allowded_catogery;
    private ArrayList<String> filter_pattern;
    private ArrayList<String> remove_filter_pattern;
    
    private ArrayList<String> selected_allowded_catogery;
    private ArrayList<String> selected_blocked_catogery;
    private ArrayList<String> selected_filter_pattern;
    
    
    private String block_list_data;
    private String allow_list_data;

    public CategoryList() {
        blocked_catogery = new ArrayList<>();
        allowded_catogery = new ArrayList<>();
        filter_pattern = new ArrayList<>();
        remove_filter_pattern = new ArrayList<>();
        
        selected_allowded_catogery=new ArrayList<>();
        selected_blocked_catogery=new ArrayList<>();
        selected_filter_pattern = new ArrayList<>();
        
                
        block_list_data = "";
        allow_list_data = "";
    }


    
	public ArrayList<String> getRemove_filter_pattern() {
		return remove_filter_pattern;
	}





	public void setRemove_filter_pattern(ArrayList<String> remove_filter_pattern) {
		this.remove_filter_pattern = remove_filter_pattern;
	}





	public ArrayList<String> getFilter_pattern() {
		return filter_pattern;
	}



	public void setFilter_pattern(ArrayList<String> filter_pattern) {
		this.filter_pattern = filter_pattern;
	}



	public ArrayList<String> getSelected_filter_pattern() {
		return selected_filter_pattern;
	}



	public void setSelected_filter_pattern(ArrayList<String> selected_filter_pattern) {
		this.selected_filter_pattern = selected_filter_pattern;
	}



	public ArrayList<String> getSelected_allowded_catogery() {
		return selected_allowded_catogery;
	}



	public void setSelected_allowded_catogery(ArrayList<String> selected_allowded_catogery) {
		this.selected_allowded_catogery = selected_allowded_catogery;
	}



	public ArrayList<String> getSelected_blocked_catogery() {
		return selected_blocked_catogery;
	}



	public void setSelected_blocked_catogery(ArrayList<String> selected_blocked_catogery) {
		this.selected_blocked_catogery = selected_blocked_catogery;
	}



	/**
     * @return the blocked_catogery
     */
    public ArrayList<String> getBlocked_catogery() {
        return blocked_catogery;
    }

    /**
     * @param blocked_catogery the blocked_catogery to set
     */
    public void setBlocked_catogery(ArrayList<String> blocked_catogery) {
        this.blocked_catogery = blocked_catogery;
    }

    /**
     * @return the allowded_catogery
     */
    public ArrayList<String> getAllowded_catogery() {
        return allowded_catogery;
    }

    /**
     * @param allowded_catogery the allowded_catogery to set
     */
    public void setAllowded_catogery(ArrayList<String> allowded_catogery) {
        this.allowded_catogery = allowded_catogery;
    }

    /**
     * @return the block_list_data
     */
    public String getBlock_list_data() {
        return block_list_data;
    }

    /**
     * @param block_list_data the block_list_data to set
     */
    public void setBlock_list_data(String block_list_data) {
        this.block_list_data = block_list_data;
    }

    /**
     * @return the allow_list_data
     */
    public String getAllow_list_data() {
        return allow_list_data;
    }

    /**
     * @param allow_list_data the allow_list_data to set
     */
    public void setAllow_list_data(String allow_list_data) {
        this.allow_list_data = allow_list_data;
    }

}
