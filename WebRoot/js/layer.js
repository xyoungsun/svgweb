var layerRoot;

var pre = "<div style='border:2px #9fb5d2 solid ; overflow:scroll; position:absolute; width:150px; height:180px; left: 0px; top: 0px;white-space:nowrap'>";
var end = "</div>";

function initLayer(lRoot){
	layerRoot = lRoot;
	result = getLayer(layerRoot);
	//var s = "layer:";
	var row = pre;
	for(var i = 0; i < result.length; i++) {
		
		row = row + addCheck(result[i], result[i]);
		
		//s = s + result[i];
		
	}
	row = row + end;
	return row;
	//alert(s);
	
}

function getLayer(root){
	var l = root.childNodes.length;
	var result = new Array();
	var k = 0;
	for(var i = 0; i < l; i++) {
		var item = root.childNodes.item(i);
		if(item) {
			if('g' == item.tagName) {
				result[k++] = item.getAttribute('id');
			}
		}
	}
	return result;
}

function addCheck(value,title){
    return "<input type='checkbox' checked  value='"+ value +"' onclick='parent.layerControl(this)'> <span  style='font-size: 12'>"+ title +"</span> <br />";
}

/**
*
* 从SVG图形中获取图层信息
*
**/
function getLayerFromSVG(){
    var l = layerRoot.childNodes.length;
    var result = new Array();
    var j = 0,k=0;
    for(var i=0 ; i< l;i++){
        var e = layerRoot.childNodes.item(i);
        if(e){
           if('g' == e.tagName){
           	var isExsit=0;       
           	for(k=0;k<j;k++){
           		if(result[k]==e.getAttribute('id'))
           			isExsit=1;
           	}
           	if(isExsit==0)
           		result[j++] = (e.getAttribute('id'));
           }
         }
    }
    return result;
}

/**
 * 图层的显隐
 * @param t
 */
function layerControl(t){
    var layer = layerRoot.getElementById(t.value);
    if(t.checked){
        layer.setAttribute("visibility","visible");
    }else{
        layer.setAttribute("visibility","hidden");
    }
}