<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<script type="text/javascript">

var editgridOpen="N";

$( function() {
	$.subscribe('clearButtonClick', function(event, data) {

		$('#filter_isin').val('');
		$('#filter_issuedate').val('');
		reloadGrid();
	});
	
	$.subscribe('closedialog',function(event, data) {
		editgridOpen = "N";
	});
	
	$.subscribe('rowdblclicked',function(event, data) {

		if(editgridOpen == "N"){
			$('#editDialog').dialog('open');
		}else{
			$('#editDialog').dialog('close');
		}
	
		return false;
	}
	);
	
	$("#filter_isin").keypress(function(event) {
		if ( event.which == 13 ) {
			reloadGrid();
		}
	});

	$.subscribe('func_gridcomplete',function(event, data) {

	});

	$.subscribe('mainGridSelectrow',function(event, data) {
		var grid = event.originalEvent.grid;
		lastSel = event.originalEvent.id;
		
		var fields = ['isin', 'holdingplace', 'fundcode', 'refno', 'transtype',
		'saletype', 'qtyamount', 'execprice', 'oas', 'tradedate', 'settledate',
		'creationdate', 'secname', 'cpn', 'issueDt', 'ytm', 'maturity', 'ytw',
		'ytwMaturity', 'oad', 'oasd', 'reporttype'];
		$.each(fields, function(index, field){
			var fieldValue = grid.jqGrid('getCell', lastSel, field);
			$('#dl' + field).val(fieldValue);
		});
		}
	);

});

function reloadGrid() {
	var filter_isin = $('#filter_isin').val();
	var filter_issuedate = $('#filter_issuedate').val();
	
	$("#asiagridtable").jqGrid('setGridParam', {
		postData : {
			filterIsin : filter_isin,
			filterIssuedate : filter_issuedate
		}
	}).trigger("reloadGrid");
}

function dateFormatter(cellvalue, options, row) {

    var str = new String(cellvalue);
	if(cellvalue != null && cellvalue != "-99999999"){

		cellvalue = str.substring(0,4)+"/"+str.substring(4,6)+"/"+str.substring(6,8);

	}else cellvalue = "<br>";

	return cellvalue;
}


function dateFormatter(cellvalue, options, row) {

    var str = new String(cellvalue);
	if(cellvalue != null){
		cellvalue = str.substring(0,4)+"/"+str.substring(4,6)+"/"+str.substring(6,8);

	}else cellvalue = "<br>";

	return cellvalue;
}

function toBeImple(){
	alert("Sorry, this function is under construction.");
	return false;
}

</script>

<div
	style="top: -10px; font-family: arial, verdana, sans-serif; font-size: 11px; margin-bottom: 20px">
	<table cellspacing='0'>
		<tr align='left' valign='top'>
			<th><font color='#5f5f5f'>Report &gt;</font></th>
			<th width='10'></th>
			<th><a id='TaxReportAction' href='main?function=asia'
				title='Refresh current screen'><font color='#DD0000'>Asia
						</font> </a></th>
			<th width='10'></th>
		</tr>
	</table>
</div>

<s:form id="downloadForm" action="crdExcelDownload" theme="simple">
	<fieldset style="position: relative;">
		<legend>Asia Report</legend>

		<table style="width: 60%">
			<tr>
				<td><label id="lbl_isin">ISIN: <s:textfield
					id="filter_isin" name="filter_isin" theme="simple" width="50"
					maxlength="30"  /></label></td>
				<td><label id="lbl_issuedate">Issue Date:<sj:datepicker id="filter_issuedate" 
					name="filter_issuedate" label="lbl_issuedate" 
					displayFormat="yy/mm/dd" maxlength="10" readonly="false" />
			</label></td>
				<td align="right">
					<sj:a id="searchButton" button="true" buttonIcon="ui-icon-search"
						onclick="reloadGrid()" style="line-height:0;">Search</sj:a>
				</td>
				<td><sj:a id="clearButton" button="true"
						onClickTopics="clearButtonClick" style="line-height:0;">Clear</sj:a>
				</td>
			</tr>
		</table>

		<div style="position: relative;">
			<s:url var="remoteurl" action="jsontable" />
			<s:url var="editurl" action="edit-customer" />
			<sjg:grid caption="Asia" id="asiagridtable" autowidth="true"
				dataType="json" href="%{remoteurl}" pager="true" navigator="false"
				navigatorCloneToTop="false" gridModel="gridModel" rowTotal="true"
				rownumbers="true" rowList="5,10,15,20,30" rowNum="20"
				viewrecords="true" toppager="false" multiselect="false"
				editurl="%{editurl}" editinline="true" resizable="true"
				draggable="true" draggableHelper="original" draggableCursor="move"
				draggableRevert="invalid" draggableZindex="5000"
				draggableContainment="document"
				onDblClickRowTopics="rowdblclicked"
				onGridCompleteTopics="func_gridcomplete"
				onSelectRowTopics="mainGridSelectrow"
				navigatorSearchOptions="{
					drag:true,
		    		reloadAfterSubmit:true,
					afterSubmit:function(response, postdata) {
									return isError(response.responseText);
		                         }
					}"
				navigatorRefresh="true" navigatorSearch="false"
				navigatorDelete="false" navigatorAdd="false" navigatorEdit="false"
				navigatorInlineEditButtons="false"
				navigatorEditOptions="{
					drag:true,
		    		reloadAfterSubmit:true,
					afterSubmit:function(response, postdata) {
									return isError(response.responseText);
		                         }
					}">
				<sjg:gridColumn name="isin" index="isin" title="ISIN"
					sortable="true" editable="true" editable="true" width="100" />
				<sjg:gridColumn name="holdingplace" index="holdingplace"
					title="運用会社" sortable="true" width="180" editable="true" />
				<sjg:gridColumn name="fundcode" index="fundcode" title="ファンドコード"
					sortable="true" width="100" editable="true" />
				<sjg:gridColumn name="refno" index="refno" title="Ref_No"
					sortable="true" width="100" editable="true" />						
				<sjg:gridColumn name="transtype" index="transtype" title="BUY/SELL"
					sortable="true" width="100" editable="true" />
				<sjg:gridColumn name="saletype" index="saletype" title="売却種類"
					sortable="true" editable="true" width="100"/>
				<sjg:gridColumn name="qtyamount" index="qtyamount" title="Amount"
					sortable="true" editable="true" width="100" />					
				<sjg:gridColumn name="execprice" index="execprice" title="Price"
					sortable="true" editable="true" width="100" />					
				<sjg:gridColumn name="oas" index="oas" title="OAS"
					sortable="true" editable="true" width="100" />
				<sjg:gridColumn name="tradedate" index="tradedate" title="TradeDate"
					sortable="true" editable="true" width="100" />					
				<sjg:gridColumn name="settledate" index="settledate" title="SettleDate"
					sortable="true" editable="true" width="100" />					
				<sjg:gridColumn name="creationdate" index="creationdate" title="作成日"
					sortable="true" editable="true" width="100" />	
				<sjg:gridColumn name="secname" index="secname" title="銘柄名"
					sortable="true" editable="true" width="100" />	
				<sjg:gridColumn name="cpn" index="cpn" title="クーポン"
					sortable="true" editable="true" width="100" />	
				<sjg:gridColumn name="issueDt" index="issueDt" title="発行日"
					sortable="true" editable="true" width="100" formatter="dateFormatter"/>	
				<sjg:gridColumn name="ytm" index="ytm" title="YTM"
					sortable="true" editable="true" width="100" />		
				<sjg:gridColumn name="maturity" index="maturity" title="Maturity"
					sortable="true" editable="true" width="100" />		
				<sjg:gridColumn name="ytw" index="ytw" title="YTW"
					sortable="true" editable="true" width="100" />		
				<sjg:gridColumn name="ytwMaturity" index="ytwMaturity" title="YTW Maturity"
					sortable="true" editable="true" width="100" />		
				<sjg:gridColumn name="oad" index="oad" title="OAD"
					sortable="true" editable="true" width="100" />
				<sjg:gridColumn name="oasd" index="oasd" title="OASD"
					sortable="true" editable="true" width="100" />	
				<sjg:gridColumn name="reporttype" index="reporttype" title="Report Type"
					sortable="true" editable="true" width="100" hidden="true"/>	
																																																					
			</sjg:grid>
			<br />
		</div>

		<hr size="1" width="100%">
		<br>

		<sj:a id="refreshButton" button="true" buttonIcon="ui-icon-refresh "
			onclick="reloadGrid()">Refresh</sj:a>
<%--
		<sj:a id="downloadButton" button="true"
			buttonIcon="ui-icon-arrowstop-1-s " formIds="downloadForm" onclick="toBeImple()">Export as pdf</sj:a>
--%>

		<sj:a id="downloadButton2" button="true"
			buttonIcon="ui-icon-arrowstop-1-s " formIds="downloadForm">Export as Excel</sj:a>
	</fieldset>
</s:form>

<%-- EDIT Dialog for Grid--%>
<sj:dialog id="editDialog"
	buttons="{
				'Edit':function() { dlOkButton(); editgridOpen = 'N'; },
				'Delete':function() { dlDeleteButton(); editgridOpen = 'N'; },
				'Cancel':function() { $(this).dialog('close'); }
			}"
	autoOpen="false" modal="true" title="Asia Report Edit" width="750"
	draggable="true" resizable="true" position="{'100','500'}"
	onCloseTopics="closedialog">
	<div id="editReport" class="edit">
		<s:form id="editForm">		
			<s:textfield id="dlisin" name="editReport.isin"
				label="ISIN" readonly="true" cssStyle="background:#CCC" size="50"/>
			<s:textfield id="dlholdingplace"
				name="editReport.holdingplace" label="運用会社"
				readonly="false" cssStyle="" size="70"/>
			<s:textfield id="dlfundcode" name="editReport.fundcode"
				label="ファンドコード" readonly="false" size="70" />
			<s:textfield id="dlrefno" name="editReport.refno"
				label="Ref_No" readonly="false" cssStyle=""
				size="50" />
			<s:textfield id="dltranstype" name="editReport.transtype"
				label="BUY/SELL" readonly="false" cssStyle="" size="50"/>
			<s:textfield id="dlsaletype" name="editReport.saletype"
				label="売却種類" readonly="false" size="50"/>
			<s:textfield id="dlqtyamount" name="editReport.qtyamount"
				label="Amount" readonly="false" cssStyle="" size="50"/>					
			<s:textfield id="dlexecprice" name="editReport.execprice"
				label="Price" readonly="false" cssStyle="" size="50"/>				
			<s:textfield id="dloas"	name="editReport.oas" label="OAS"
				readonly="false" cssStyle="" size="50"/>	
				
			<sj:datepicker id="dltradedate" 
					name="editReport.tradedate" label="TradeDate" 
					displayFormat="yy/mm/dd" maxlength="10" readonly="false" size="20"/>
			<sj:datepicker id="dlsettledate" 
					name="editReport.settledate" label="SettleDate" 
					displayFormat="yy/mm/dd" maxlength="10" readonly="false" size="20"/>
		
			<s:textfield id="dlcreationdate" name="editReport.creationdate"
				label="作成日" readonly="true" cssStyle="background:#CCC" size="20"/>
			<s:textfield id="dlsecname" name="editReport.secname"
				label="銘柄名" readonly="false" cssStyle="" size="70"/>									
			<s:textfield id="dlcpn" name="editReport.cpn"
				label="クーポン" readonly="false" cssStyle="" size="50"/>				
			<s:textfield id="dlissueDt"
				name="editReport.issueDt" label="発行日"
				readonly="true" cssStyle="background:#CCC" size="50"/>	
			<s:textfield id="dlytm" name="editReport.ytm"
				label="YTM" readonly="false" cssStyle=""
				size="50" />
			<s:textfield id="dlmaturity" name="editReport.maturity"
				label="Maturity" readonly="false" cssStyle="" size="50"/>			
			<s:textfield id="dlytw" name="editReport.ytw"
				label="YTW" readonly="false" cssStyle="" size="50"/>							
			<s:textfield id="dlytwMaturity" name="editReport.ytwMaturity"
				label="YTW Maturity" readonly="false" cssStyle="" size="50"/>					
			<s:textfield id="dload" name="editReport.oad"
				label="OAD" readonly="false" cssStyle="" size="50"/>
			<s:textfield id="dloasd" name="editReport.oasd"
				label="OASD" readonly="false" cssStyle="" size="50"/>	
			<s:hidden id="dlreporttype" name="editReport.reporttype"
				label="ReportType" readonly="true" cssStyle="background:#CCC"/>
		</s:form>
	</div>
</sj:dialog>
<s:url id="editUrl" action="editCustomer"/>
<sj:a id="editsubmit" formIds="editForm" href="%{editUrl}" targets="editResult" />

<s:url id="editDeleteUrl" action="editDeleteCustomer"/>
<sj:a id="editDeletesubmit" formIds="editForm" href="%{editDeleteUrl}" targets="editResult" />

<script type="text/javascript">

function dlOkButton() {
	$('#editsubmit').trigger('click');
	$('#editDialog').dialog('close');
}

function dlDeleteButton() {
	$('#anchordialogconfirm').dialog('open');
}

</script>
<sj:dialog id="anchordialogconfirm"
	buttons="{
            'OK':function() {
			$('#editDeletesubmit').trigger('click');
			$('#editDialog').dialog('close');
			$(this).dialog('close');
            },
            'Cancel':function() {  $(this).dialog('close'); }
            }"
	resizable="false" autoOpen="false" modal="true" title="Remove?">
 Are you sure you want to remove this record?
</sj:dialog>

<div id="editResult"></div>

