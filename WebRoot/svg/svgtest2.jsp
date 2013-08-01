<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("basePath", basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'svgtest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${basePath }jquery-plugin/jquery-ui-1.10.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="${basePath }jquery-plugin/jquery.svg.package-1.4.5/jquery.svg.css">
	<!-- 使用jquery-1.9.1有问题，所以使用1.7.2 -->
	<script type="text/javascript" src="${basePath }jquery-plugin/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${basePath }jquery-plugin/jquery.svg.package-1.4.5/jquery.svg.min.js"></script>
	<script type="text/javascript" src="${basePath }jquery-plugin/jquery-ui-1.10.2/ui/jquery-ui.js"></script>
	
	
<style type="text/css">
	
	#svgintro {
	height: 90%;
	background: #fff;
	border: 1px solid #3c8243;
	}
	.ui-menu { width: 150px; }
	
	#menu {
	font-size: 80%;
	font-family: "Trebuchet MS", "Arial", "Helvetica", "Verdana", "sans-serif";
	}
	button {
	font-size: 100%;
	}
	
	.positionDiv {
    position: absolute;
    width: 100%;
    height: 90%;
    background: green;
  }
  .positionDiv1 {
    position: absolute;
    width: 155;
    height: 255;
    background: blue;
  }
	
</style>	
	



		<script type="text/javascript">
$(function() {
	
	
	//$('#svgload').svg();
	
	var svg = $('#svgintro').svg({onLoad: drawIntro})
	function drawIntro(svg) {
		svg.load("CGB.svg", {
		//addTo : $('#addTo')[0].checked,
		changeSize : false,
		onload: resetSize()
		});
	}
	
	function resetSize() {
		//alert(svg.width());
		
	}
	$('button').button();
	
	$("#adapteButton").click(function(){
		//alert(svg.width() + " " + svg.container.width());
		//alert(1);
		var svg1 = $('#svgintro').svg('get');
		//获取SVG图实际的大小
		var SVGRect = svg1._svg.getBBox();
		//svg1._svg.getBBox().width=1323;
		//alert(SVGRect.width + "  " + SVGRect.height);
		svg1.configure({viewBox: '0 0 ' + SVGRect.width + ' ' + SVGRect.height}, false);
		
	});
	$( "#menu" ).menu();
	
	
	
	
	
	
	

});





</script>


	</head>
  
  <body>
<button id="adapteButton">调整大小</button>
<button id="">显示图层</button>
<div id='target'>
<div id = 'svgintro'  class='positionDiv'> </div>
<div id ='menuDiv' class='positionDiv1'>
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
</div>

</div>
<script>
 
$( "#svgintro" ).position({
  		my: "left top",
  		at: "left top",
 	 	of: "#target"
	});
$( "#menuDiv" ).position({
  		my: "left top",
  		at: "left top",
 	 	of: "#target"
	});
</script>
  	</body>
   
</html>
