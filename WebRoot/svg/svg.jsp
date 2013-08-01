<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'svg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function page_load(t) {
			svg = this.document.getElementById('objMap');
			doc = svg.getSVGDocument();
			root = doc.getElementById('mainBox');
			svgH = doc.firstChild.getAttribute('height');
			svgW = doc.firstChild.getAttribute('width');
			//ROOT.setAttribute('viewBox',v);
			map = this.document.getElementById('objMap');
			cH = this.document.body.scrollHeight;
			cW = this.document.body.scrollWidth;
			map.setAttribute('height', cH);
			map.setAttribute('width', cW);
			var mapping = new Map();
			<c:forEach items="${layer}" var="l">
	   			mapping.put('${l.name }','${l.dispname }');
	   		</c:forEach>
	        //初始化控制图层
            initLayer(doc,doc.getElementById('mapscaleControl'),document.getElementById('layerFrame'),mapping);
            useWheel = true;
            init(doc,root,cH,cW);
            initParser(svg,doc,'<?xml version="1.0" encoding="UTF-8" standalone="no"?>');
        }
	
	</script>

  </head>

	<body>
		<div id="divMenu"
			style='position: absolute; width: 150px; height: 180px; z-index: 2000; left: 10px; top: 10px'>
			<iframe style="border-collapse: collapse" name="layerFrame"
				id='layerFrame' scrolling="no" frameborder="0" width="100%"
				height="100%">
			</iframe>
		</div>
		<embed id="objMap" type="image/svg+xml" align="center" width="100%"
			height="100%" src="${basePath }showsvg/getsvgfile.action" />
	</body>
</html>
