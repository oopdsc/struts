package com.nono.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.text.ParseException;
import java.util.List;

import jp.co.hsbc.dwh.common.action.GridActionSupport;
import jp.co.hsbc.dwh.common.util.AppContextUtil;
import jp.co.hsbc.dwh.report.dao.model.Report;
import jp.co.hsbc.dwh.report.gridbean.ReportGrid;
import jp.co.hsbc.dwh.report.service.ReportExportService;
import jp.co.hsbc.dwh.report.service.ReportService;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

/**
 * <p>
 * <b>The main action class related with CRD/ASIA report pages.</b>
 * </p>
 */
@ParentPackage(value = "DWH")
public class CrdFormAction extends GridActionSupport {


}
