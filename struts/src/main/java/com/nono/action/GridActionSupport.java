/*
 * [RESTRICTED]
 *
 * Hongkong Shanghai Banking Corporation (JAPAN)
 * Legal copyright HSBC  2011
 *
 * Project: Delorean_web
 * Module:  GridActionSupport.java
 *
 * Create Date: Jun 6, 2011
 * Create Time: 9:24:17 PM
 * Author: 		43309727 Yoichi Masumoto
 *
 * Description:
 * <INSERT DESCRIPTION OF MODULE HERE>
 *
 * TODO
 *
 */
package com.nono.action;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanComparator;
import org.apache.commons.collections.comparators.ReverseComparator;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;

public class GridActionSupport extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 5078264277068533593L;

	// Sorting order constants
	protected static final String ASC = "asc";
	protected static final String DESC = "desc";

	// Search operation constants
	protected static final String EQ = "eq";
	protected static final String NE = "ne";
	protected static final String LT = "lt";
	protected static final String LE = "le";
	protected static final String GT = "gt";
	protected static final String GE = "ge";
	protected static final String BW = "bw";
	protected static final String BN = "bn";
	protected static final String IN = "in";
	protected static final String NI = "ni";
	protected static final String EW = "ew";
	protected static final String EN = "en";
	protected static final String CN = "cn";
	protected static final String NC = "nc";

	// Your result List
	private List<?> gridModel;

	// get how many rows we want to have into the grid - rowNum attribute in the
	// grid
	private Integer rows = 0;

	// Get the requested page. By default grid sets this to 1.
	private Integer page = 0;

	// sorting order - asc or desc
	private String sord;

	// get index row - i.e. user click to sort.
	private String sidx;

	// Search Field
	private String searchField;

	// The Search String
	private String searchString;

	// Limit the result when using local data, value form attribute rowTotal
	private Integer totalrows;

	// he Search Operation
	// ['eq','ne','lt','le','gt','ge','bw','bn','in','ni','ew','en','cn','nc']
	private String searchOper;

	// Your Total Pages
	private Integer total = 0;

	// All Records
	private Integer records = 0;

	private boolean loadonce = false;
	private Map<String, Object> session;
	private String beansId = getClass().getName() + "_actionbeans";

	@Override
	public String execute() {
		return SUCCESS;
	}

	public String getJSON() {
		return "";
	}

	/**
	 * @return how many rows we want to have into the grid
	 */
	public Integer getRows() {
		return rows;
	}

	/**
	 * @param rows
	 *            how many rows we want to have into the grid
	 */
	public void setRows(Integer rows) {
		this.rows = rows;
	}

	/**
	 * @return current page of the query
	 */
	public Integer getPage() {
		return page;
	}

	/**
	 * @param page
	 *            current page of the query
	 */
	public void setPage(Integer page) {
		this.page = page;
	}

	/**
	 * @return total pages for the query
	 */
	public Integer getTotal() {
		return total;
	}

	/**
	 * @param total
	 *            total pages for the query
	 */
	public void setTotal(Integer total) {
		this.total = total;
	}

	/**
	 * @return total number of records for the query. e.g. select count(*) from
	 *         table
	 */
	public Integer getRecords() {
		return records;
	}

	/**
	 * @param record
	 *            total number of records for the query. e.g. select count(*)
	 *            from table
	 */
	public void setRecords(Integer record) {
		this.records = record;
		if (this.records > 0 && this.rows > 0)
			total = (int) Math.ceil((double) this.records / (double) this.rows);
	}

	/**
	 * @return an collection that contains the actual data
	 */
	public List<?> getGridModel() {
		return gridModel;
	}

	/**
	 * @param gridModel
	 *            an collection that contains the actual data
	 */
	public void setGridModel(List<?> gridModel) {
		this.gridModel = gridModel;
	}

	/**
	 * @return sorting order
	 */
	public String getSord() {
		return sord;
	}

	/**
	 * @param sord
	 *            sorting order
	 */
	public void setSord(String sord) {
		this.sord = sord;
	}

	/**
	 * @return get index row - i.e. user click to sort.
	 */
	public String getSidx() {
		return sidx;
	}

	/**
	 * @param sidx
	 *            get index row - i.e. user click to sort.
	 */
	public void setSidx(String sidx) {
		this.sidx = "".equals(sidx) ? null : sidx;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	public void setSearchOper(String searchOper) {
		this.searchOper = searchOper;
	}

	public void setLoadonce(boolean loadonce) {
		this.loadonce = loadonce;
	}

	public void setTotalrows(Integer totalrows) {
		this.totalrows = totalrows;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	/**
	 * @return the searchField
	 */
	public String getSearchField() {
		return searchField;
	}

	/**
	 * @return the searchString
	 */
	public String getSearchString() {
		return searchString;
	}

	/**
	 * @return the searchOper
	 */
	public String getSearchOper() {
		return searchOper;
	}

	/**
	 * @return the loadonce
	 */
	public boolean isLoadonce() {
		return loadonce;
	}

	/**
	 * @return the totalrows
	 */
	public Integer getTotalrows() {
		return totalrows;
	}

	/**
	 * @return the session
	 */
	public Map<String, Object> getSession() {
		return session;
	}

	public void putBeans(List<?> beans) {
		session.put(beansId, beans);
	}

	public void putBeans(String id, List<?> beans) {
		session.put(id, beans);
	}

	public Integer getRowTo() {
		return Math.min(rows * page, records);
	}

	public Integer getRowFrom() {
		int from = (page - 1) * rows;
		if(getRowTo()< from) {
			page = 1;
			return 0;
		}
		return from;
	}

	public List<?> getBeans() {
		return (List<?>) session.get(beansId);
	}

	public List<?> getBeans(String id) {
		return (List<?>) session.get(id);
	}

	@SuppressWarnings("unchecked")
	public void doSortBeans(List<?> list) {
		/**
		 * Sort beans
		 */
		if(ASC.equals(getSord())&&getSidx()!=null)
			Collections.sort(list, new BeanComparator(getSidx()));
		else if(DESC.equals(getSord())&&getSidx()!=null)
			Collections.sort(list, new BeanComparator(getSidx(),new ReverseComparator()));
	}
}
