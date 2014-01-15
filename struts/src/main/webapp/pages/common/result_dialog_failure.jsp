<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<div id="resultMessageDialogDiv">
<sj:dialog
	id="resultMessageDialog"
	buttons="{
		'OK':function() { dialogOkButton(); }
		}"
	autoOpen="false"
	modal="true"
	title="Error"
	resizable="false"
	onCloseTopics="dialogClosed"
	closeOnEscape="false"
	><span style="color:red"><s:property value="message" escape="%{escape}"/></span>
</sj:dialog>
</div>
<script type="text/javascript">
function dialogOkButton(){
	$('#resultMessageDialog').dialog('close');
};
$(document).ready( function() {
	$('#resultMessageDialog').dialog('open');
	$.subscribe('dialogClosed',function(event, data) {
		$('#resultMessageDialogDiv').remove();
	});
});
</script>
