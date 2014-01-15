	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

  <!doctype html>

 <!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">-->
<html>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- <meta http-equiv="X-UA-Compatible" content="IE=8"> -->
<!-- <link rel="stylesheet" type="text/css" href="css/pro_dropdown_2.css" /> -->

<sj:head jqueryui="true" jquerytheme="start" />
<s:set name="currentFunction" value="function"/>
<script type="text/javascript">

$(document).ready(function () {
	if ('${currentFunction}'.length == 0) {
		return;
	}
	var options = {};
	options.jqueryaction = 'anchor';
	options.id = '${currentFunction}';
	options.targets = 'function_pane';
	options.href = '${currentFunction}';
	options.indicatorid = 'page_indicator';
	$.struts2_jquery.bind($('#loadfunction'),options);
	$('#loadfunction').trigger('click');
	$('#loadfunction').unbind('click');

});

</script>

  <link href="<s:url value="/styles/flexible-grids.css" />" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="styles/pro_dropdown_2.css" />

<style type="text/css">
.ui-jqgrid tr.jqgrow td {
	font-size: 1em
}

.ui-jqgrid-sortable {
	font-size: 1em
}

.ui-jqgrid-title {
	font-size: 1.3em
}

.ui-paging-info {
	font-size: 1.3em;;
	color: #ffffff;
}

.ui-pg-input {
	font-size: 0.7em
}

#sp_1_mygridtable_toppager {
	font-size: 0.7em
}

td {
	font-size: 1em;
	font-family: "ＭＳ　Ｐゴシック", "MS P Gothic", "MS PGothic", sans-serif;
	/*color: #424242;*/
}


.ui-widget input, .ui-widget select{
	font-size: 0.7em;

}

body {
	font-size: 12px;
/*  	font-family: monospace; */
/* 	font-family: verdana,arial,sans-serif; */
font-family: verdana,arial,sans-serif;
}


.ym-hlist{
background: url("images/ui-bg_gloss-wave_75_2191c0_500x100.png")
}

form {
   margin-top:0em;
   margin-bottom:0em
}
</style>

</head>


<body topmargin="5" bottommargin="0" leftmargin="2" rightmargin="2">
<a id="loadfunction" href="javascript:void(0)" style="display: none"></a>
<div id="page_indicator" style="position: fixed; width: 100%; height: 100%; display:none;z-index: 9999; background: #E0E0E0;
		filter:alpha(opacity=50); opacity:50;">
		<img src="pages/images/indicator.gif"
			alt="Loading..."
			style="position: absolute; left: 50%; top: 50%; z-index: 10000;"/>
	</div>


	<div style="font-size:12px; position: absolute; top: 0px; right: 10px; color: #5f5f5f;margin:0">
			Welcome <%=session.getAttribute("Spnego.Auth.Principal") %>
</div>


				<div id="header" class="ui-widget-header" style=" position: relative; z-index:9;" >

				<div style="background: none; border: none; width: 700px; font-size: 18px">
						<a Href="main" target="_top" style=" text-decoration:none;">	HSBC AMJP Data Warehouse Online</a>
</div>



		<div id="myslidemenu" class="jqueryslidemenu"
			style="position: absolute; bottom:0px; background-color: transparent; width: 100%;">
			<ul id="nav">

				<li class='top'>
				<a class='top_link'><span class='down'>Report</span></a>
			<ul class='sub'>
	<li><a id="asiaReport" href="main?function=asia">Asia</a></li>

	<!-- 
	<li><a id="euroReport" href="main?function=euro">Euro</a></li>
	
	<li><a id="emdReport" href="main?function=emd">EMD</a></li>
 -->
		</ul>

		</div>
</div>



 <div style="position: relative; margin-left:10px; margin-right:10px; margin-top:10px; z-index: 0">

<!-- 	<div class="ym-wrapper"> 
-->
		<div id="function_pane">
			<s:if test="%{function==null}">
				<%@ include file="./mainInformationFragment.jsp" %>
			</s:if>
		</div>
	<!-- </div> -->
</div>






	<!-- <div id="footer"> -->
	<div style="position:fixed; margin-left: 10px; margin-right: 10px; bottom: 2px; z-index: -1000">
	<p style="color: gray">
	 © Copyright. All rights reserved.
	</p>
	</div>

</body>
</html>
