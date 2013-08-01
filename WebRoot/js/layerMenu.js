ie=document.all?1:0
n=document.layers?1:0
lshow=13
var move=10;
menuSpeed=40;
var moveOnScroll=true
var tim;
var ltop;
var left = 'images/left.gif';
var right='images/right.gif';

function initMenu(left_img,right_img){
    left = left_img;
    right = right_img;

}

function makeMenu(obj,nest){
    nest=(!nest) ? '':'document.'+nest+'.'
    this.css=(n) ? eval(nest+'document.'+obj):eval(obj+'.style')
        this.state=1
        this.go=0
        this.width=n?this.css.document.width:eval(obj+'.offsetWidth')
        this.left=b_getleft
    this.obj = obj + "Object";         eval(this.obj + "=this")
}
function b_getleft(){
        var gleft=(n) ? eval(this.css.left):eval(this.css.pixelLeft);
        return gleft;
}
function moveMenu(){
	var tds=document.getElementById('div_tds');
        if(!oMenu.state){
                clearTimeout(tim)
                mIn();
			var texts=tds.childNodes;
			for(var i=0;i<texts.length;i++){
				if(texts[i].nodeValue=='关'){
					texts[i].nodeValue='打';
				}
				if(texts[i].nodeValue=='闭'){
					texts[i].nodeValue='开';
				}
			}
			
			document.getElementById('dir_img').src = right;
			//document.getElementById('div_img_left').style.visibility='hidden';
			//document.getElementById('div_img_right').style.visibility='';

			
        }else{
                clearTimeout(tim)
                mOut();
				
				var texts=tds.childNodes;
				for(var i=0;i<texts.length;i++){
					if(texts[i].nodeValue=='打'){
						texts[i].nodeValue='关';
					}
					if(texts[i].nodeValue=='开'){
						texts[i].nodeValue='闭';
					}
					if(texts[i].tagName=='img'){
						texts[i].src='./images/leftleft.gif';
					}
				}
				
				document.getElementById('dir_img').src = left;
				//document.getElementById('div_img_right').style.visibility='hidden';
				//document.getElementById('div_img_left').style.visibility='';
        }
}
function mIn(){
        if(oMenu.left()>-oMenu.width+lshow){
                oMenu.go=1
                oMenu.css.left=oMenu.left()-move
                tim=setTimeout("mIn()",menuSpeed)
        }else{
                oMenu.go=0
                oMenu.state=1
        }
}
function mOut(){
        if(oMenu.left()<0){
                oMenu.go=1
                oMenu.css.left=oMenu.left()+move
                tim=setTimeout("mOut()",menuSpeed)
        }else{
                oMenu.go=0
                oMenu.state=0
        }
}
function checkScrolled(){
        if(!oMenu.go) oMenu.css.top=eval(scrolled)+ltop
        if(n) setTimeout('checkScrolled()',30)
}
function menuInit(){
        oMenu=new makeMenu('divMenu')
        scrolled=n?"window.pageYOffset":"document.body.scrollTop"
        oMenu.css.left=-oMenu.width+lshow
        ltop=(n)?oMenu.css.top:oMenu.css.pixelTop;
        oMenu.css.visibility='visible'
        if(moveOnScroll) ie?window.onscroll=checkScrolled:checkScrolled();
		moveMenu();
}