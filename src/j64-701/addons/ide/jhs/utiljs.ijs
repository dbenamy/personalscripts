NB. core javascript utilities for all pages
coclass'jhs'
NB. JS could be src= and with cache would load faster
NB. JS is small and doing it inline (not src=) is easier

JSCORE=: 0 : 0
// framework user variables and utilities
var JASEP= '\1'; // delimit substrings in ajax response
var jform;       // page form
var jevev;       // event handler event object
var jevtarget=null;   // event handler target object
var jisIE=-1!=navigator.userAgent.search(/MSIE/);

function jbyid(id){return document.getElementById(id);}
function jsubmit(s){jform.jdo.value=jevsentence;jform.submit();}

// convert to event for mid [sid=""] [type="click"]
function jscdo(mid,sid,type) // click handler for mid [sid] type
{
 jevtarget=null; 
 jform.jtype.value= type?type:"click";
 if('undefined'==typeof sid)
 {
  jform.jid.value= mid;
  jform.jmid.value=mid;
  jform.jsid.value="";
 }
 else
 {
  jform.jid.value= mid+'*'+sid;
  jform.jmid.value=mid;
  jform.jsid.value=sid;
 }
 jevdo();
}

// set caret in element id - collapse 0 start, 1 end
function jsetcaret(id,collapse)
{
 var p= jbyid(id);
 if(null==p)return;
 if (window.getSelection)
  window.getSelection().collapse(p,collapse);
 else
 {
  var tst= document.selection.createRange();
  tst.moveToElementText(p);
  tst.collapse(!collapse);
  tst.select();
 }
}

function jsetcaretn(node)
{
 if (window.getSelection)
 {
  var sel,rng;
  node.scrollIntoView(false);
  sel=window.getSelection();
  sel.removeAllRanges();
  rng=document.createRange();
  rng.selectNode(node);
  sel.addRange(rng);
 }
 else
 {
  var tst= document.selection.createRange();
  tst.moveToElementText(node);
  tst.select();
 }
}

function jcollapseselection(d)
{
 try
 {
  if (window.getSelection)
  {
   var sel,rng;
   sel=window.getSelection();
   rng=sel.getRangeAt(0);
   sel.removeAllRanges();
   rng.collapse(d);
   sel.addRange(rng);
  }
  else
  {
   var tst;
   tst=document.selection.createRange();
   tst.collapse(d);
   tst.select();
  }
 }catch(e){;}
}

// replace selection with val - collapse -1 none, 0 end, 1 start
function jreplace(id,collapse,val)
{
  try // mark caret location with ZWSP
  {
   if(window.getSelection)
   {
    var sel,rng;
    sel=window.getSelection();
    rng=sel.getRangeAt(0);
    if(collapse!=-1)rng.collapse(collapse);
    sel.removeAllRanges();
    sel.addRange(rng);
    document.execCommand("insertHTML",false,val);
   }
   else
   {
    var rng;
    rng= document.selection.createRange();
    if(collapse!=-1)rng.collapse(collapse);
    rng.pasteHTML(val);
   }
   return 1;
  }catch(e){return 0;}
}

function jtfromhhit(t)
{
 switch(t[1])
 {
 case "n":  return " ";
 case "l":  return "<";
 case "g":  return ">";
 case "a":  return "&";
 }
}

function jtfromh(d)
{
 d= d.replace(/\r|\n/g,"");          // IE requires
 d= d.replace(/<br><div>/g,"<div>"); // chrome - kludge (not i)
 d= d.replace(/<p>&nbsp;<\/p>|<div><br><\/div>|<br[^>]*>|<\/p>|<div>/gi,"\n");
 d= d.replace(/<\/?[^>]+(>|$)/g,""); // remove all remaining tags
 d= d.replace(/&nbsp;|&lt;|&gt;|&amp;/g,jtfromhhit);
 if('\n'!=d[d.length-1]){d=d+"\n";}
 return d
}

var JREGHFROMT=RegExp("[ \n<>&]","g");

function jhfromthit(t)
{
 switch(t[0])
 {
 case " ":  return "&nbsp;";
 case "\n": return "<br>";  
 case "<":  return "&lt;";
 case ">":  return "&gt;";
 case "&":  return "&amp;";
 }
}

function jhfromt(d){return d.replace(JREGHFROMT,jhfromthit);}

//* jshow(id)
function jshow(id){jbyid(id).style.display="block";jresize();}

//* jhide(id)
function jhide(id){jbyid(id).style.display="none";jresize();}

//* jdlgshow(id,focus) - id to show and id to focus
function jdlgshow(id,focus)
{
 if(jbyid(id).style.display=="block")
  jhide(id);
 else
 {
  jshow(id);
  jbyid(focus).focus();
 }
}

var jdwn;     // dom walk nodes
var jdwi;     // dom walk indents
var jdwr;     // dom walk recursion level

function jdominit(node)
{
 jdwn=[];
 jdwi=[];
 jdwr=0;
 jdomwalk(node);
}

function jdomwalk(node)
{
 var c,n,i;
 ++jdwr;
 c=node.childNodes;
 for(i=0;i<c.length;++i)
 {
  n=c[i];
  jdwi.push(jdwr);
  jdwn.push(n);
  jdomwalk(n);
 }
 --jdwr;
}

function jdomshow(node)
{
 var i,j,t="";
 jdominit(node);
 for(i=0;i<jdwn.length;++i)
 {
  for(j=0;j<jdwi[i];++j)t+="| ";
  name=jdwn[i].nodeName;
  if(name=="#text")
   t+=name+" "+jdwn[i].nodeValue;
  else
   t+=name;
  t+="\n";
 }
 return t;
}

// framework internals
window.onresize=jresize;

var jevsentence; // J sentence to run
var JEV;         // js handler to call

function jresize()
{
 // IE resize multiple frames sometimes gets id as null
 if(jbyid("jresizea")==null||jbyid("jresizeb")==null)return;
 var a= jgpwindowh(); // window height
 a-= jgpbodymh();     // body margin h (top+bottom)
 a-= jgpdivh("jresizea"); // header height
 a-= 6               // fudge extra
 a=  a<0?0:a;        // negative causes problems
 jbyid("jresizeb").style.height= a+"px";
}

function jevload()
{
 jform= document.j;
 jevsentence= "jev_"+jform.jlocale.value+"_ 0"; 
 jscdo("body","","load");
 return false
}

function jevunload(){jscdo("body","","unload");return false;}
function jevfocus()
{
 // return false; // IE onfocus before onload
 if(jform=="")return false;
 jscdo("body","","focus");
 return false;
}

// event handler onclick etc - id is mid[*sid]
function jev(event){
 jmenuhide(event);
 jevev= window.event||event;
 jevtarget=(typeof jevev.target=='undefined')?jevev.srcElement:jevev.target;
 var type=jevev.type;
 jform.jtype.value= type;
 var id=jevtarget.id;
 var i= id.indexOf('*');
 jform.jid.value  = id;
 jform.jmid.value = (-1==i)?id:id.substring(0,i);
 jform.jsid.value = (-1==i)?"":id.substring(++i,id.length);
 if(type=='keydown'&&27==jevev.keyCode)return false; // IE ignore esc
 if(type=='keydown'&&13==jevev.keyCode&&!jevev.ctrlKey&&!jevev.shiftKey)
  {jform.jtype.value="enter";return jevdo();} 
 return jevdo();
}

function jevdo()
{
 JEV= "ev_"+jform.jmid.value+"_"+jform.jtype.value;
 //try{eval(JEV)}
 //catch(ex)
 if('undefined'==eval("typeof "+JEV))
 {
  // undef returns true or does jsubmit for buttons 
  if(null==jevtarget)return true;
  var c=jevtarget.getAttribute("class");
  if(c=="jhb"||c=="jhab"||c=="jhmab")jsubmit();
  return true;
 }
 try{var r= eval(JEV+"();")}
 catch(ex){alert(JEV+" failed: "+ex);return false;}
 if('undefined'!=typeof r) return r;
 return false;
}

// ajax
var rq,rqstate=0;

// xmlhttprequest not supported in kongueror 3.2.1 (c) 2003
function newrq()
{
 try{return new XMLHttpRequest();} catch(e){}
 try{return new ActiveXObject("Msxml2.XMLHTTP.6.0");} catch(e){}
 try{return new ActiveXObject("Msxml2.XMLHTTP.3.0");} catch(e){}
 try{return new ActiveXObject("Msxml2.XMLHTTP");} catch(e){}
 alert("XMLHttpRequest not supported.");
}

// ajax request to J
//  ev_mid_type() -> jdoaajax(ids,data)
//   -> ev_mid_type=:  (getv...)
//    -> jhrajax (JASEP delimited responses)
//      -> jdor -> ajax(ts) or ev_mid_type_ajax(ts)
//         ts is array of JASEP delimited responses
// ids is array of form element names (values)
// data is JASEP delimited data to send 
// sentence (usually elided to use jevsentence)
// asynch is true for asynch and false for synch (elided is true)
function jdoajax(ids,data,sentence,async)
{
 if(0!=rqstate){alert("busy - wait for previous request to finish");return;}
 async=async||true;
 sentence=sentence||jevsentence;
 data=data||"";
 ids=ids||[];
 rq= newrq();
 rq.onreadystatechange= jdor;
 rq.open("POST",jform.jlocale.value,async); // true for async call
 jform.jdo.value= ('undefined'==typeof sentence)?jevsentence:sentence;
 rq.send(jpostargs(ids)+"&jdata="+jencode(data));
 if(!async)jdor();
}

// return post args from standard form ids and extra form ids
function jpostargs(ids)
{
 var d,t="",s="",a=["jdo","jtype","jmid","jsid"].concat(ids);
 for(var i=0;i<a.length;++i)
 {
  d= eval("jform."+a[i]+".value");
  t+= s+a[i]+"="+jencode(d);
  s= "&";
 }
 return t;
}

function jencode(d){return(encodeURIComponent(d)).replace("/%20/g","+");}

// recv ajax response from J -> ev_mid_type_ajax(ts)
// call ajax(ts) or ev_mid_type_ajax(ts)
// ts is ajax response split on JASEP
function jdor()
{
 var d,f;
 rqstate= rq.readyState;
 if(rqstate==4)
 {
  if(200!=rq.status)
  {
   if(403==rq.status)
    location="jlogin";
   else
   {
    var t="ajax request failed\n"
    t+=   "response code "+rq.status+"\n";
    t+=   "application did not produce result\n"
    t+=   "try browsing to url again\n"
    t+=   "additional info in jijx"
    alert(t);
   }
  }
  else
  {
   d=rq.responseText.split(JASEP);
   f="ev_"+jform.jmid.value+"_"+jform.jtype.value+"_ajax";
   if("function"==eval("typeof "+f))
    f+="(d)";
   else
    f="ajax(d)";
   try{eval(f)}catch(e){alert(f+" failed");}
  }
  rqstate= 0;
  busy= 0;
 }
}

// app keyboard shortcuts

document.onkeyup= keyup; // bad things happen if this is keydown
document.onkeypress= keypress;

var jsc= 0;

function jscset(){jsc=1;}

// page redefines to avoid std shortcuts
// '2' shortcut implemented as ev_2_shortcut for each page
function jdostdsc(c)
{
 switch(c)
 {
  case '1': jactivatemenu('1'); break;
  case 'j': location="jijx";  break;
  case 'f': location="jfile"; break;
  case 'h': location="jhelp"; break;
  case 'J': location="jijs"; break;
  case 'F': location="jfif"; break;
 }
}

// IE/FF see esc etc but Chrome/Safari do not
function keypress(ev)
{
 var e=window.event||ev;
 var c=e.charCode||e.keyCode;
 var s= String.fromCharCode(c);
 if(!jsc)return true;
 jsc=0;
 try{eval("ev_"+s+"_shortcut()");}
 catch(e){jdostdsc(s);}
 return false;
}

function keyup(ev)
{
 var e=window.event||ev;
 var c=e.keyCode;
 if(e.ctrlKey)
 {
  if(c==190){jscset();return false;}
  if(c==38&&e.shiftKey&&'function'==typeof uarrow){uarrow();return false;}
  if(c==40&&e.shiftKey&&'function'==typeof darrow){darrow();return false;}
 }
 if(c==27&&!e.shiftKey&&!e.altKey)
 {
  jsc=!jsc;return !jsc;
 }
 return true;
}

// return menu group node n
function jfindmenu(n)
{
 var nodes= document.getElementsByTagName("a");
 var i,node,cnt=0,last,len= nodes.length;
 for(i=0;i<len;++i)
 {
  node= nodes[i];
  if("jhmg"!=node.getAttribute("class")) continue;
  if(n==++cnt) return node;
  last= node;
 }
 return last;
}

// tar is current node
// c is 37 38 39 40 - left up right down
// navigate to node based on c and focus
function jmenunav(tar,c)
{
 var i,n,nn,nc,node,cnt=0,last,len,cl,m=[];
 var nodes=document.getElementsByTagName("a");
 len=nodes.length
 for(i=0;i<len;++i)
 {
  node=nodes[i];
  cl=node.getAttribute("class");
  if("jhmg"==cl||"jhml"==cl||"jhmab"==cl)
  {
   m[m.length]=node;
   if(tar==node)n=i;
  }
 }
 len=m.length;
 nn=m[n];                        // nn node
 nc= m[n].getAttribute("class"); // nc class
 if(c==39) // right
 {
  for(i=n+1;i<len;++i)
   if(jmenunavfocushmg(m,i))return;
  jmenunavfocushmg(m,0); 
 }
 else if(c==37) // left
 {
  for(n;n>=0;--n) // back n up to current group
   if(1==jmenunavinfo(m,n))break;
  for(i=n-1;i>=0;--i)
   if(jmenunavfocushmg(m,i))return;
  for(i=len-1;i>=0;--i) // focus last hmg
   if(jmenunavfocushmg(m,i))return;
 }
 else if(c==38) // up
 {
  if("jhmg"==nc) return;
  if(jmenunavfocus(m,n-1))return;
  else
  {
   for(i=n;i<len;++i) // forward to hmg then back one
    if(2!=jmenunavinfo(m,i))break;
   jmenunavfocus(m,i-1);
   return;
  }
 }
 else if(c==40) // dn
 {
  if("jhmg"==nc)
  {
   jmenuhide();
   nn.focus();
   jmenushow(nn);
  }
  if(jmenunavfocus(m,n+1))return;
  else
  {
   for(i=n;i>=0;--i) // back up to hmg then forward 1
    if(1==jmenunavinfo(m,i))break;
   jmenunavfocus(m,i+1);
   return;
  }
 }
}

// focus,show if hmg - return 1 if focus is done
function jmenunavfocushmg(m,n)
{
 if(1!=jmenunavinfo(m,n))return 0;
 m[n].focus();jmenushow(m[n]);
 return 1;
}

// focus if hml/jmab - return 1 if focus is done
function jmenunavfocus(m,n)
{
  if(2!=jmenunavinfo(m,n))return 0;
  m[n].focus();
  return 1;
}

// return m[n] info - 0 none, 1 hmg, 2 hml or hmab
function jmenunavinfo(m,n)
{
 if(n==m.length)return 0;
 return ("jhmg"==m[n].getAttribute("class"))?1:2
}

// activate menu group n
function jactivatemenu(n)
{
 jmenuhide();
 var node= jfindmenu(n);
 if('undefined'==typeof node) return;
 node.focus(); 
}

var menublock= null; // menu ul element with display:block
var menulast= null;  // menu ul element just hidden 

function jmenuclick(ev)
{
 jmenuhide(ev);
 var e=window.event||ev;
 var tar=(typeof e.target=='undefined')?e.srcElement:e.target;
 var id=tar.id;
 var idul= id+"_ul";
 jbyid(id).focus(); // required on mac
 if(jbyid(idul).style.display=="block")
 {
  menublock= null;
  jbyid(idul).style.display= "none";
 }
 else
 {
  if(menulast!=jbyid(idul))
  {
   menublock= jbyid(idul);
   menublock.style.display= "block";
  }
 }
}

function jmenushow(node)
{
 jmenuhide();
 var id=node.id;
 var idul= id+"_ul";
 menublock= jbyid(idul);
 menublock.style.display= "block";
}

function jmenuhide()
{
 if(tmenuid!=0) clearTimeout(tmenuid);
 tmenuid= 0;
 menulast= menublock;
 if(menublock!=null) menublock.style.display= "none";
 menublock= null;
 return true;
}

// browser differences
//  safari/chrome onblur on mousedown and onfocus on mouseup
//  onblur will hide the menu 250 after mousedown (no clear)
//  so menu item click needs to be quick

var tmenuid= 0;

function jmenublur(ev)
{
 if(tmenuid!=0) clearTimeout(tmenuid);
 tmenuid= setTimeout(jmenuhide,500)
 return true;
}

function jmenufocus(ev)
{
 if(tmenuid!=0) clearTimeout(tmenuid);
 tmenuid= 0;
 return true;
}

function jmenukeydown(ev)
{
 var e=window.event||ev;
 var c=e.keyCode;
 return(c>36&&c<41)?false:true;
}

function jmenukeypress(ev)
{
 var e=window.event||ev;
 var c=e.keyCode;
 return(c>36&&c<41)?false:true;
}

function jmenukeyup(ev)
{
 var e=window.event||ev;
 var c=e.keyCode;
 if(c<37||c>40)return false;
 var tar=(typeof e.target=='undefined')?e.srcElement:e.target;
 jmenunav(tar,c);
 return true;
}


// get pixel... - sizing/resizing

// window.onresize= resize; // required for resize
// and resize should be called in ev_body_load

// the ...h functions need simple changes to
// become the corresponding set of w functions

// body{background:aqua} can be useful in
// finding out why calculations turn out wrong

// IF and FF both have bugs with <h1>...</h1>
// vs these calculations and <hx> should not
// be used where resizing will be used

// get pixel window height
function jgpwindowh()
{
 if(window.innerHeight)
  return window.innerHeight; // not IE
 else
  return document.documentElement.clientHeight;
}

// get pixel body margin height (top+bottom)
function jgpbodymh()
{
 var h;
 if(window.getComputedStyle)
 {
  h=  parseInt(window.getComputedStyle(document.body,null).marginTop);
  h+= parseInt(window.getComputedStyle(document.body,null).marginBottom);
 }
 else
 {
  h=  parseInt(document.body.currentStyle.marginTop);
  h+= parseInt(document.body.currentStyle.marginBottom);
 }
 return h;
}

// get pixel div height - IE/FF bugs vs <h1>
function jgpdivh(id){return jbyid(id).offsetHeight;}

/*
function jgpdivh(id)
{
 var e=jbyid(id);
 if(e==null)return 50;
 //alert(e+" "+id);
 // alert(e.offsetHeight);
 //return jbyid(id).offsetHeight;
 var v=e.offsetHeight;
 //alert(id+" "+v);
 return v;
}
*/

// get pixel end

// debug

// numbers from unicode
function debcodes(t)
{
 r= "";
 for(var i=0;i<t.length;++i)
  r= r+" "+t.charCodeAt(i);
 return r;
}
)

docjs=: 3 : 0
docjsn
)

docjsn=: 0 : 0

see ~addons/ide/jhs/utiljs.ijs for complete information

html element ids are mid[*sid] (main id and optional sub id)

functions defined by you:

ev_body_load()   - page load (open)
ev_body_unload() - page unload (close)
ev_body_focus()  - page focus
  
ev_mid_event() - event handler - click, change, keydown, ...

js event handler:
  jevev is event object
  event ignored if not defined
  jsubmit() runs J ev_mid_event and response is new page
  jdoajax([...],"...") runs J ev_mid_event
    ajax(ts) (if defined) is run with J ajax response
    ev_mid_event_ajax(ts) is run if ajax() not defined
  returns true (to continue processing) or false
)

0 : 0
/* contenteditable to/from text
IE:
 <BR>             <-> N (\n)
 </P>              -> N
 <P>&nbsp;</P      -> N (can not tell emtpy from 1 blank)
 can have \r\n !

Chrome:
 <br>            <-> N
 <div>            -> N
 <div><br></div>  -> N
 saw nested divs, but do not know how to get them
 starting div so break on div rather than /div
 
FF:
 <br>            <-> N
 has (and needs) <br> at end

Portable rules (all case insensitive):
 remove \r \n
 <p>&nbsp;</p>    -> N
 <div><br></div>  -> N
 <br>            <-> N
 </p>             -> N
 </div>           -> N
 always have <br> at end (read/write)
 &lt;...         <-> < > & space
*/
)
