var DOC; //SVG图形的Document元素
var layerRoot; //图层的根元素
var cFrame;      //frame元素
var isShow;       //现在的显示状态
var vs;           //存储图层编码与名称的对应对信息

var pre = '<div style="border:2px #9fb5d2 solid ; overflow:scroll; position:absolute; width:150px; height:180px; left: 0px; top: 0px">';
var end = '</div>';
/**
 *
 * 初始化图层，读取SVG文件中的图层信息
 * 在Iframe中动态的绘制图层信息
 *
 **/
function initLayer(doc,lROOT,frame,maps){

    DOC = doc;
    layerRoot = lROOT;
    cFrame = frame;
    vs = maps;
    var inner = pre;
    var ls = getLayerFromSVG();
    for(var i = 0;i < ls.length; i++){
        key = ls[i];
        value = vs.get(key);
        if(value && value != ''){
            inner = inner + addCheck(key,value);
        }else{
            inner = inner + addCheck(key,key);
        }
    }
    
    cFrame.contentWindow.document.body.innerHTML = inner + end;
    isShow  = true;
}


/**
 *
 * 控制图层控制器的显示
 *
 **/
function changeShow(){
    if(isShow){
        cFrame.style.visibility = 'hidden';
    }else{
        cFrame.style.visibility = 'visible';
    }
    isShow = !isShow;
}

 
/**
 *
 * 动态添加checkbox元素
 *
 **/
function addCheck(value,title){
    return '<input type="checkbox" checked  value="'+ value +'" onclick="parent.layerControl(this)"> <span  style="font-size: 12">'+ title +'</span> <br />'
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
 *
 * 处理图层隐藏或显示事件
 *
 **/
function layerControl(t){
    var layer = DOC.getElementById(t.value);
    if(t.checked){
        layer.setAttribute("visibility","visible");
    }else{
        layer.setAttribute("visibility","hidden");
    }
}