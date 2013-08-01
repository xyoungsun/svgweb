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
	<script type="text/javascript" src="${basePath }js/layer.js"></script>
	
	
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
	
	.positionable {
    position: absolute;
    display: block;
    
	left:10px;
	top:15px

    background-color: #bcd5e6;
    text-align: center;
  }
  #positionable1 {
    width: 75px;
    height: 75px;
  }
  #guanggao{
	position:absolute;
	top:130px;
	left:30px;
}
.iframe{
	SCROLLBAR-FACE-COLOR:   rgb(10,236,209);   //滚动条凸出部分的颜色 
	SCROLLBAR-HIGHLIGHT-COLOR:   rgb(23,255,155);//滚动条空白部分的颜色 
	SCROLLBAR-SHADOW-COLOR:   rgb(255,116,23);//立体滚动条阴影的颜色 
	SCROLLBAR-3DLIGHT-COLOR:   rgb(66,93,127);//滚动条亮边的颜色 
	SCROLLBAR-ARROW-COLOR:   rgb(93,232,255);//上下按钮上三角箭头的颜色 
	SCROLLBAR-TRACK-COLOR:   rgb(255,70,130);//滚动条的背景颜色 
	SCROLLBAR-DARKSHADOW-COLOR:   rgb(10,0,209);//滚动条强阴影的颜 
	SCROLLBAR-BASE-COLOR:   rgb(66,93,128)/滚动条的基本颜色 
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
	
	function position() {
      $( ".positionable" ).position({
        of: $( "#svgintro" ),
        my: "left top",
        at: "left top",
        collision: "flip flip"
      });
    }
 
    $( ".positionable" ).css( "opacity", 0.5 );
 
   // $( "select, input" ).bind( "click keyup change", position );
 
   // $( "#parent" ).draggable({
   //   drag: position
   // });
 
    
	
	
	$("#layerButton").click(function(){
		var svg1 = $('#svgintro').svg('get');
		var h = initLayer(svg1.root());
		//alert(h);
		//alert($(document.getElementById("layerFrame").contentWindow.document.body).html() ); 
		$(document.getElementById("layerFrame").contentWindow.document.body).html(h);
	});
	$("#zoominButton").click(function(){
		alert("放大");
		var svg1 = $('#svgintro').svg('get');
		
		
		
	});
	
	$("#zoomoutButton").click(function(){
		alert("缩小");
		var svg1 = $('#svgintro').svg('get');
		
		
		
	});
	
	
	
	
	
	
	

});





</script>


	</head>
  
  <body>
<button id="adapteButton">调整大小</button>
<button id="layerButton">显示图层</button>
<button id="zoominButton">放大</button>
<button id="zoomoutButton">放大</button>
<div id="divMenu"
				style='position: absolute; width: 150px; height: 180px; z-index: 2000; left: 30px; top: 80px'>
				<iframe style="border-collapse: collapse" name="layerFrame"
					id='layerFrame' scrolling="no" frameborder="0" width="100%" src="${basePath }svg/red.html"
					height="100%">
				</iframe>
</div>

<div id = 'svgintro' width='100%' height='90%'> </div>

 	
   
</html>
