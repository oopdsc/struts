<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC
 "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sample</title>
<!--  -->
<script type="text/javascript">

//window.open("about:blank","_self").close();
var locationhref = '<%=request.getContextPath() %>';
var x=0, y=0, width=1020, height=704;

if(screen.width>1024)
	x = (screen.width-width)/2;
if(screen.height>768)
	y = (screen.height-height)/2;
locationhref += "/main";

locationhref = "/dwh/main";
var title = 'AMJP Data Warehouse';
var status = 'width='+width+',height='+height+',top='+y+',left='+x+',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no';

//var w = window.open(locationhref, title, status);
//w.focus();
window.location = locationhref;

</script>

</head>
<body>
<p>Hello <%= request.getRemoteUser() %> !</p>
</body>
</html>
