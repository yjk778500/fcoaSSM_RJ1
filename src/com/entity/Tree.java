package com.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Tree {
	
	private String id;
	private String text;
	private List<Tree> children = new ArrayList<Tree>();
	private Map<String, String> attributes = new HashMap<String, String>();
	private String iconCls;
	private String state = "open";
	private String url;
	private int lv;
	
	
	
	
	public Tree(String id, String text, String url, int lv) {
		super();
		this.id = id;
		this.text = text;
		this.url = url;
		this.lv = lv;
	}
	public Tree(String id, String text, String url) {
		super();
		this.id = id;
		this.text = text;
		this.attributes.put("url", url);
	}
	public Tree(String id, String text, List<Tree> children) {
		super();
		this.id = id;
		this.text = text;
		this.children = children;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<Tree> getChildren() {
		return children;
	}
	public void setChildren(List<Tree> children) {
		this.children = children;
	}
	public Map<String, String> getAttributes() {
		return attributes;
	}
	public void setAttributes(Map<String, String> attributes) {
		this.attributes = attributes;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getLv() {
		return lv;
	}
	public void setLv(int lv) {
		this.lv = lv;
	}
	
	

}
