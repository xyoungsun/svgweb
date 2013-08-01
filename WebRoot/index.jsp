<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	--><link rel="stylesheet" href="${basePath }jquery-ui-1.10.2/themes/base/jquery.ui.all.css">
	<script src="${basePath }jquery-ui-1.10.2/jquery-1.9.1.js"></script>
	<script src="${basePath }jquery-ui-1.10.2/ui/jquery.ui.core.js"></script>
	<script src="${basePath }jquery-ui-1.10.2/ui/jquery.ui.widget.js"></script>
	<script src="${basePath }jquery-ui-1.10.2/ui/jquery.ui.position.js"></script>
	<script src="${basePath }jquery-ui-1.10.2/ui/jquery.ui.menu.js"></script>
	<link rel="stylesheet" href="${basePath }jquery-ui-1.10.2/demos/demos.css">
	<script>
	$(function() {
		$( "#menu" ).menu();
	});
	</script>
	<style>
	.ui-menu { width: 150px; }
	</style>
</head>
<body>

<ul id="menu">
	<li class="ui-state-disabled"><a href="#">Aberdeen</a></li>
	<li><a href="#">Ada</a></li>
	<li><a href="#">Adamsville</a></li>
	<li><a href="#">Addyston</a></li>
	<li>
		<a href="#">Delphi</a>
		<ul>
			<li class="ui-state-disabled"><a href="#">Ada</a></li>
			<li><a href="#">Saarland</a></li>
			<li><a href="#">Salzburg</a></li>
		</ul>
	</li>
	<li><a href="#">Saarland</a></li>
	<li>
		<a href="#">Salzburg</a>
		<ul>
			<li>
				<a href="#">Delphi</a>
				<ul>
					<li><a href="#">Ada</a></li>
					<li><a href="#">Saarland</a></li>
					<li><a href="#">Salzburg</a></li>
				</ul>
			</li>
			<li>
				<a href="#">Delphi</a>
				<ul>
					<li><a href="#">Ada</a></li>
					<li><a href="#">Saarland</a></li>
					<li><a href="#">Salzburg</a></li>
				</ul>
			</li>
			<li><a href="#">Perch</a></li>
		</ul>
	</li>
	<li class="ui-state-disabled"><a href="#">Amesville</a></li>
</ul>

<div class="demo-description">
<p>A menu with the default configuration, disabled items and nested menus. A list is transformed, adding theming, mouse and keyboard navigation support. Try to tab to the menu then use the cursor keys to navigate.</p>
</div>
  </body>
</html>
