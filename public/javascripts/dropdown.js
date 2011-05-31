var $j = jQuery.noConflict();
var timeout    = 500;
var closetimer = 0;
var ddmenuitem = 0;

function jsddm_open(){  
  jsddm_canceltimer();
  jsddm_close();
  ddmenuitem = $j(this).find('ul').css('visibility', 'visible');
}

function jsddm_close(){  
  if(ddmenuitem) ddmenuitem.css('visibility', 'hidden');
}

function jsddm_timer(){
  closetimer = window.setTimeout(jsddm_close, timeout);
}

function jsddm_canceltimer(){
  if(closetimer){  
	window.clearTimeout(closetimer);
    closetimer = null;
  }
}

$j().ready(function(){  
   $j('#jsddm > li').bind('mouseover', jsddm_open)
   $j('#jsddm > li').bind('mouseout',  jsddm_timer)
});

document.onclick = jsddm_close;