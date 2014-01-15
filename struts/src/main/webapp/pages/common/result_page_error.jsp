<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<script type="text/javascript">
<!--
function cnfirmOkButtonClicked() {
	location.reload();
}
//-->
</script>
<div align="center" style="position:relative; height:100%; top:50px">
<div style="position: relative;">
<fieldset style="width: 400px; min-height: 100px">
<div align="left" style="color: red"><B>Error occcured:</B></div>
<div style="position:relative; margin: 10px;" align="left">
<s:property value="message" />
</div>
<div><br><br>
<sj:a button="true" onclick="cnfirmOkButtonClicked()"
>OK</sj:a>
</div>
</fieldset>
</div>
</div>