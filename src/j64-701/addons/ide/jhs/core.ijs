

NB. JHS - core services
require 'socket'
coclass'jhs'

0 : 0
*** Cache-Control: no-cache
Browser caching can be confusing and is quite different
from a desktop application.

Back/forward, switching tabs, switching browser apps, are
showing cached pages. A get (typed into the URL box or from
favorites) shows a cached page if possible. And exactly when
it shows a cached page and when it gets a fresh page varies
from browser to browser and the phase of the moon. This can
be confusing if you have the expectation of a new page with
current information.

Ajax requests (in particular JIJX) have no-cache as old
pages in this area are more confusing and than useful.

All other pages allow cache as the efficiency of mucking
around pages without dealing with the server is significant.
Sometimes this means that when you want a fresh page with
latest info you are in getting a cached version.

Some browsers have a transmission progress bar indicator.
No flash means you are getting a cached page and a flash
means you getting a new page.

Refresh (F5 on some browsers) gets a fresh page and is a
useful stab poke if confused.

*** login/bind/cookie/security overview

Listening socket can bind localhost or any. What about lan?

Localhost is relatively secure.
Firewalls provide some any protection.

Localhost is relatively secure and gains little from login.

Non-localhost should require a login.

Login is provided by a cookie.
The cookie is set in the response to providing a password.
That cookie is then included in the header of all requests
and is validated by the server.

The cookie is non-persistent and is deleted when browser closes.
New tabs do not need to login, but a new browser does.

*** app overview
URL == APP == LOCALE

Browser request runs first available sentence from:
 post          - jdo
 get URL has . - jev_get_jfilesrc_ URL_jhs_
 get           - jev_get_URL_''

Post can be submit (html for new page) or ajax (for page upates).

The sentence can send a response (closing SKSERVER).

urlresponse_URL_ run if response has not been sent
when new input required. jijx does this as the response
requires J output/prompt that are not available until then.

Use XMLHttpRequest() for AJAX style single page app.
Post request for new data to update page. jijx app does
this for significant benefit (faster and no flicker).

Form has hidden:
 button to absorb enter not in input text (required in FF)
 jdo="" submit sentence

Enter in input text field caught by element keydown event handler.

*** event overview
Html element id has main part and optional sub part mid[*sid].

<... id="mid[*sid]" ... ontype="return jev(e)"

jev(event)
{
 sets evid,evtype,evmid,evsid,evev
 onclick is type click etc
 try eval ev_mid_type()
 returns true or false
}

If ev_mid_type returns value, it is returned to the onevent caller,
otherwise a calculated value is returned.

ev_mid_type can ajax or submit J sentence.
Ajax has explicit nv pairs in post data and result.
Submit has normal form nv pairs in post data and result is new page

*** gotchas

Form elements use name="...". Submit of hidden element requires
name and the element will not be included in post data with just id.

Javascript works with id. In general a form input element should have
the same value for both id and name. The exception is radio where id
is unigue and name is the same across a set of radio buttons. 

***
1. depends on cross platform javascript and styles

2. 127.0.0.1 seems faster than localhost
   wonder if dot ip name is faster than www.jsoftware.com

3. Enter with only text has no button.
   Enter with buttons submits as if first button pressed.

4. DOCTPTE etc. - google main page and jsoftware
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gmail/Jsoftware</title>

5. perhaps should move to DOCTYPE xhtml strict

6. html pattern (modified from google mail, jsoftware)
<DOCTYPE...>
<html>
 <head>
  <meta...>
  <title>...</title>
  [<style type="text/css">...</style>...]
 </head>
 <body>
  ...
 </body>
 [<script>...</script>...]
</html>

9. autocomplete and wrap fail validator - but are necessary
)

PROMPT=: '   '
JZWSPU8=: 226 128 139{a. NB. empty prompt kludge - &#8203; \200B
OKURL=: '' NB. URL allowed without login

NB. J needs input - y is prompt - '' '   ' '      '
input=: 3 : 0
logjhs 'prompt'
logapp 'jhs input prompt: ',":#y
try.
if. _1~:SKSERVER do. try. ".'urlresponse_',URL,'_ y' catch. end. end. NB. jijx
if. _1~:SKSERVER do. jbad'' end.
getdata'' NB. get and parse http request
if. 1=NVDEBUG do. smoutput seebox NV end. NB. HNV,NV
if. (-.OKURL-:URL)*.(0~:#PASS)*.(-.cookie-:gethv'Cookie:')*.-.LHOK*.PEER-:LOCALHOST
                       do. r=. 'jev_get_jlogin_ 0'
elseif. 'post'-:METHOD do. r=. getv'jdo'
elseif. '.'e.URL       do. r=. 'jev_get_jfilesrc_ URL_jhs_'
elseif. 1              do. r=. 'jev_get_',URL,'_'''''
end.
logjhs'sentence'
logapp 'jhs sentence: ',r
if. JZWSPU8-:3{.r do. r=. 3}.r end. NB. empty prompt kludge
r NB. J sentence to run

catch.
 logappx 'input error'
 exit'' NB. 2!:55[11 crashes
end.
)

NB. J has output - x is type, y is string
NB. MTYOFM		1	formatted result array
NB. MTYOER		2	error
NB. MTYOLOG		3	log
NB. MTYOSYS		4	system assertion failure
NB. MTYOEXIT	5	exit - not used
NB. MTYOFILE	6	output 1!:2[2
NB. x is type, y is string
output=: 4 : 0
logapp 'output type : ',":x
if. 5=x do. jhrajax 'Your J HTTP Server has exited.<br/><div id="prompt" class="log">&nbsp;&nbsp;&nbsp;</div>'[PROMPT_jhs_=:'   ' end.
try.
 s=. y NB. output string
 type=. x NB. MTYO type
 class=. >type{'';'fm';'er';'log';'sys';'';'file'
 if. (3~:type)+.-.'jev_'-:4{.dlb s do. NB. jev_... lines not logged
  if. 3=type do. s=. PROMPT,dlb s end.
  t=. jhtmlfroma s
  if. '<br>'-:_4{.t do. t=. _4}.t end.
  LOGN=: LOGN,'<div class="',class,'">',t,'</div>'
 end.
 if. (3=type)*.(0~:#s-.' ')*.(-.s-:>{.INPUT)*.(-.'jev_'-:4{.s)*.0=+/'</script'E.tolower s do.  
  INPUT=: INPUT,~<s -. LF NB. labs (0!:noun) has LF???
  INPUT=: (PC_RECALL_LIMIT<.#INPUT){.INPUT
 end.

catch.
 logappx'output'
 exit''
end.
)

NB. event handler called by js event
jev=: 3 : 0
try.
 ".t=. 'ev_',(getv'jmid'),'_',(getv'jtype'),' 0'
catch.
 smoutput LF,'*** event handler error',LF,t,LF,(13!:12''),seebox NV
end.
)

NB. get/post data - headers end with LF,LF
NB. post has Content-Length: bytes after the header
NB. listen and read until a complete request is ready
NB. headers have CRLF but we do toJ in srecv
NB.  the toJ in srecv in toJ might be a mistake
getdata=: 3 : 0
while. 1 do.
 logapp 'getdata loop'
 SKSERVER_jhs_=: 0 pick sdcheck_jsocket_ sdaccept_jsocket_ SKLISTEN
 try.
  PEER=: >2{sdgetpeername_jsocket_ SKSERVER
  t=. LF,LF
  h=. ''
  while. 1 do.
   h=. h,srecv''
   i=. (t E. h)i.1
   if. i<#h do. break. end.
  end.
  d=. (i+2)}.h
  h=. (>:i){.h
  parseheader h
  if. 'POST '-:5{.h do.
   len=.".gethv'Content-Length:'
   d=. (len<.#d){.d
   while. len~:#d do.
    d=. d,srecv''
   end.
   METHOD=: 'post'
   seturl'POST'
   parse d
   if. 30000<#d do. PD__=: d end.
  else.
   METHOD=: 'get'
   seturl'GET'
   t=. (t i.' '){.t=. gethv 'GET'
   parse (>:t i.'?')}.t
  end.
  return.

 catch.
  t=. 13!:12''
  if. -.'|recv timeout:'-:14{.t do. NB. recv timeout expected
   smoutput '*** getdata error: ',t
  end.
  logapp 'getdata error: ',t
 end.
end.
)

seturl=: 3 : 0
URL=: jurldecode}.(<./t i.' ?'){.t=. gethv y
)

serror=: 4 : 0
if. y do.
 sdclose_jsocket_ SKSERVER
 logapp x
 x 13!:8[3 
end.
)

NB. return SKSERVER data (toJ)
NB. serror on 
NB.  timeout, socket error, or no data (disconnect)
NB. PC_RECVSLOW 1 gets small chunks with time delay 
srecv=: 3 : 0
z=. sdselect_jsocket_ SKSERVER;'';'';PC_RECVTIMEOUT

if. -.SKSERVER e.>1{z do.
 'recv timeout' serror 1  NB.0;'';'';'' is a timeout
end.

'recv not ready' serror SKSERVER~:>1{z
if. PC_RECVSLOW do.
 6!:3[1
 bs=. 100 NB. 100 byte chunks with 1 second delay
else.
 bs=. PC_RECVBUFSIZE
end.
'c r'=. sdrecv_jsocket_ SKSERVER,bs,0
('recv error: ',":c) serror 0~:c
'recv no data' serror 0=#r
toJ r
)

secs=: 3 : 0
":60#.4 5{6!:0''
)

NB. return count of bytes sent to SKSERVER
NB. serror on
NB.  timeout, socket error, no data sent (disconnect)
NB. PC_SENDSLOW 1 simulates slow connection
ssend=: 3 : 0
z=. sdselect_jsocket_ '';SKSERVER;'';PC_SENDTIMEOUT
'send not ready' serror SKSERVER~:>2{z
if. PC_SENDSLOW do.
 6!:3[0.2
 y=. (100<.#y){.y NB. 100 byte chunks with delay
end.
'c r'=. y sdsend_jsocket_ SKSERVER,0
('send error: ',":c) serror 0~:c
'send no data' serror 0=r
r NB. bytes sent
)

putdata=: 3 : 0
logapp'putdata'
try. 
 while. #y do. y=. (ssend y)}.y end. 
catch.
 logapp 'putdata error: ',13!:12''
end.
)

NB. set HNV from request headers
parseheader=: 3 : 0
a=. <;._2 y
i=. (y i.' '),>:}.>a i. each ':'
HNV=: (i{.each a),.dlb each i}.each a
)

NB. global NV set from get/post data
NB. name/values delimited by & but no trailing &
NB. namevalue is name[=[value]]
NB. name0value[&name1value1[&name2...]]
parse=: 3 : 0
try.
 d=. <;._2 y,'&'#~0~:#y
 d=. ;d,each('='e.each d){'=&';'&'
 d=. <;._2 d rplc '&';'='
 NV=: jurldecodeplus each (2,~(2%~#d))$d
catch.
 smoutput '*** parse failed: ',y
 NV=: 0 2$''
end.
)

gethv=: 3 : 0
i=. (toupper&.>0{"1 HNV)i.<toupper y
>1{i{HNV,0;0
)

NB. get value for name y - '' for no value 
getv=: 3 : 0
i=. (0{"1 NV)i.<,y
>1{i{NV,0;''
)

NB. get values for names
getvs=: 3 : 0
((0{"1 NV)i.;:y){(1{"1 NV),<''
)

NB. ~name from full name
jshortname=: 3 : 0
p=. <jpath y
'a b'=.<"1 |:UserFolders_j_,SystemFolders_j_
c=. #each b
f=. p=(jpath each b,each'/'),each (>:each c)}.each p
if.-.+./f do. >p return. end.
d=. >#each f#b
m=. >./d
f=. >{.(d=m)#f#a
'~',f,m}.>p
)

NB. new ijs temp filename
jnew=: 3 : 0
d=. 1!:0 jpath '~temp\*.ijs'
a=. 0, {.@:(0&".)@> _4 }. each {."1 d
a=. ": {. (i. >: #a) -. a
f=. <jpath'~temp\',a,'.ijs'
'' 1!:2 f
>f
)

logclear=: 3 : ''''' 1!:2 logappfile'

NB. log timestamp
lts=: 3 : 0
20{.4 3 3 3 3 3":<.6!:0''
)

logjhs=: 3 : 0
if. #USERNAME do. ((lts''),y,LF)1!:3 logjhsfile end.
)

logapp=: 3 : 0
if. -.PC_LOG do. return. end.
((lts''),(>coname''),' : ',y,LF)1!:3 logappfile
)

NB. force log of this and following messages
logappx=: 3 : 0
PC_LOG=: 1
logapp y,' error : ',13!:12''
)

logstdout=: 3 : 'i.0 0[(y,LF) 1!:2[4'

NB. z local utilities

dbon_z_=: 3 : 0
13!:15 'smoutput dbes dbestack_z_=:13!:18'''''
9!:27 '13!:0[1'
9!:29 [1
i.0 0
)

dboff_z_=: 3 : 0
13!:15 ''
9!:27 '13!:0[0'
9!:29 [1
i.0 0
)

dbcutback_z_=: 13!:19
dbstep_z_=:    13!:20
dbstepin_z_=:  13!:21
dbstepout_z_=: 13!:22

NB. display numbered explicit defn
dbsd_z_=: 3 : 0
if. -.1 2 3 e.~nc<y do. 'not an explicit definition' return. end.
raw=. 5!:5<y
t=.<;.2 LF,~raw
if. 1=#t do. '0 ',raw return. end.
i=.t i.<':',LF
if. ('3'={.raw)*.i~:#t do.
 j=. (_1,i.<:i),_1,(i.<:<:(#t)-i),_1
else.
 j=. _1,(i._2+#t),_1
end.
n=. ":each<"0 j
n=. a: ((n=<'_1')#i.#n)} n
n=. <"1 ' ',.~' ',.~>n
;n,each t
)

NB. debug stop manager
NB. dbsm'name'     - display numbered explicit defn
NB. dbsm'~...'     - remove stops starting with ...
NB. dbsm'name n:n' - add stops 
NB. dbsm''         - display stops
dbsm_z_=: 3 : 0
if. ('~'~:{.y)*.1=#;:y do. dbsd y return. end.
if.'~'={.y do.
 s=. deb each<;._2 (dbsq''),';'
 a=. }.y
 s=. (-.(<a)=(#a){.each s)#s
else.
 s=. deb each<;._2 (dbsq''),y,';'
end.
s=. ~./:~(s~:a:)#s
dbss ;s,each<' ; '
dbsq''
)

NB. show execution stack as set by last supension
dbes_z_=: 3 : 0
len=. >./dbestack i."1 ' '
t=. |."2[dbestack
r=. ''
while. #t do.
 d=. }.dtb{.t
 d=. (len>.#d){.d
 t=. }.t
 if. ' '~:1{d do.
  n=. dltb}.{.t
  if. 2~:#t do. n=. n rplc '    ';'' end.
  r=. r,<d,n
  t=. }.t
 else.
  r=. r,<d rplc '    ';''
 end.
end.
'_',(>coname''),'_',LF,;|.r,each LF
)

open_z_=: 3 : 0
t=. ('jijs?mid=open&path=',jpath y)jhref_jhs_ y
jhtml'<div contenteditable="false">',t,'</div>'
)

jlogoff_z_=: 3 : 'htmlresponse_jhs_ hajaxlogoff_jhs_'

jlog_z_=: 3 : 0
if. y-:0 do.
 LOGFULL_jhs_=: LOGFULL_jhs_,LOG_jhs_
 LOG_jhs_=:''
elseif. y-:_ do.
 LOG_jhs_=: LOGFULL_jhs_,LOG_jhs_
 LOGFULL_jhs_=: ''
end.
i.0 0
)

NB. one very long line as LF is <br>
jhtml_z_=: 3 : 0
a=. 9!:36''
9!:37[ 4$0,1000+#y NB. allow lots of html formatted output
smoutput jmarka_jhs_,y,jmarkz_jhs_
9!:37 a
i.0 0
)

jbd__=: 3 : '9!:7[y{Boxes_j_' NB. select boxdraw (PC_BOXDRAW)

NB. toggle jfe behavior
jfe=: 3 : 0
15!:16 y
i.0 0
)

console_welcome=: 0 : 0

J HTTP Server - init OK

Requires a modern browser (later than 2005) with Javascript.

A : separates ip address from port. Numeric form ip can be faster than name.
<REMOTE>
Start a web browser on this machine and enter URL:
   http://<LOCAL>:<PORT>/jijx
)

remoteaccess=: 0 : 0

Access from another machine:
   http://<IPAD>:<PORT>/jijx
)

console_failed=: 0 : 0

J HTTP Server - init failed 

Port <PORT> already in use by JHS or another service.

If JHS is serving the port, close this task and use the running server.

If JHS server is not working, close it, close this task, and restart.

See file: <CFGFILE>
for information on using another PORT.
)

NB. html config parameters
config=: 3 : 0
PC_FONTFAMILY=:   '"courier new","courier","monospace"'
PC_FONTSIZE=:     '11px'
PC_FONT_COLOR=:   'black'
PC_FM_COLOR=:     'black'  NB. formatted output
PC_ER_COLOR=:     'red'    NB. error
PC_LOG_COLOR=:    'blue'   NB. log user input
PC_SYS_COLOR=:    'purple' NB. system error
PC_FILE_COLOR=:   'green'  NB. 1!:! file output
PC_BOXDRAW=:      0        NB. 0 utf8, 1 +-, 2 oem
PC_RECALL_LIMIT=: 25       NB. limit ijx recall lines
PC_LOG_LIMIT=:    20000    NB. limit ijx log size in bytes
PC_RECVSLOW=:     0        NB. 1 simulates slow recv connection
PC_RECVBUFSIZE=:  10000    NB. size of recv buffer
PC_RECVTIMEOUT=:  5000     NB. seconds for recv timeout
PC_SENDSLOW=:     0        NB. 1 simulates slow send connection
PC_SENDTIMEOUT=:  5000     NB. seconds for send timeout
PC_NOJUMPS=:      0        NB. 1 to avoid jijx jumps
PC_LOG=:          0        NB. 1 to log events
)

NB. fix userfolders for username y
NB. adjust SystemFolders for multi-users in single account
fixuf=: 3 : 0
USERNAME=: y
if. 0=#y do. return. end.
t=. SystemFolders_j_
a=. 'break';'config';'temp';'user'
i=. ({."1 t)i.a
p=. <'~user/jhs/',y
n=. a,.jpath each p,each '/break';'/config';'/temp';''
SystemFolders_j_=: n i} t
(":2!:6'') 1!:2 <jpath'~user/.jhspid'
1!:44 jpath'~user' NB. cd
)

NB. similar to startup_console in boot.ijs
startupjhs=: 3 : 0
f=. jpath '~config/startup_jhs.ijs'
if. 1!:4 :: 0: <f do.
  try.
    load__ f
  catch.
    smoutput 'An error occurred when loading startup script: ',f
  end.
end.
)

dobind=: 3 : 0
sdcleanup_jsocket_''
SKLISTEN=: 0 pick sdcheck_jsocket_ sdsocket_jsocket_''
if. UNAME-:'Linux'  do. 'libc.so.6  fcntl i i i i' cd SKLISTEN,F_SETFD_jsocket_,FD_CLOEXEC_jsocket_ end.
if. UNAME-:'Darwin' do. 'libc.dylib fcntl i i i i' cd SKLISTEN,F_SETFD_jsocket_,FD_CLOEXEC_jsocket_ end.
if. -.UNAME-:'Win'  do. sdsetsockopt_jsocket_ SKLISTEN;SOL_SOCKET_jsocket_;SO_REUSEADDR_jsocket_;2-1 end.
sdbind_jsocket_ SKLISTEN;AF_INET_jsocket_;y;PORT
)

nextport=: 3 : 0
while. 
 PORT=: >:PORT
 r=.dobind y
 sdclose_jsocket_ SKLISTEN
 sdcleanup_jsocket_''
 erase'SKLISTEN_jhs_'
 10048=r
do. end.
)

lcfg=: 3 : 0
try. load jpath y catch. ('load failed: ',y) assert 0 end.
)

NB. config_file jhscfg username
NB. USERNAME not '' adjusts SystemFolders and does cd ~temp
NB. load config files to set PORT LHOK BIND PASS USER
NB. configuration loads
NB.   ~addons/ide/jhs/config/jhs_default.ijs
NB.  then loads first file (if any) that exists from
NB.   config_file (error if not '' and does not exist)
NB.   ~config/jhs.ijs
NB.   ~addons/ide/jhs/config/jhs.ijs
NB. config sets PORT BIND LHOK PASS USER
NB. USER used in jlogin - JUM forces USER=:USERNAME
jhscfg=: 4 : 0
fixuf y
lcfg jpath'~addons/ide/jhs/config/jhs_default.ijs'
if.     -.''-:t=. jpath x                                do. lcfg t
elseif. fexist t=. jpath'~config/jhs.ijs'                do. lcfg t
elseif. fexist t=. jpath'~addons/ide/jhs/config/jhs.ijs' do. lcfg t
end.
'PORT invalid' assert (PORT>49151)*.PORT<2^16
'BIND invalid' assert +./(<BIND)='any';'localhost'
'LHOK invalid' assert +./LHOK=0 1
'PASS invalid' assert 2=3!:0 PASS
if. _1=nc<'USER' do. USER=: '' end. NB. not in JUM config
'USER invalid' assert 2=3!:0 USER
PASS=: ,PASS
USER=: ,USER
if. #USERNAME do. USER=:USERNAME end.
BIND=: >(BIND-:'any'){'127.0.0.1';''
)

NB. [config_file] init USERNAME
NB. SO_REUSEADDR allows server to kill/exit and restart immediately
NB. FD_CLOEXEC prevents inheritance by new tasks (JUM startask)
init=: 3 : 0
''init y
:
'already initialized' assert _1=nc<'SKLISTEN'
IFJHS_z_=: 1
x jhscfg y
PATH=: jpath'~addons/ide/jhs/'
IP=: >2{sdgethostbyname_jsocket_ >1{sdgethostname_jsocket_''
LOCALHOST=: >2{sdgethostbyname_jsocket_'localhost'
logappfile=: <jpath'~user/.applog.txt' NB. username
logjhsfile=: <jpath'~user/.jhslog.txt' NB. username
logjhs'start'
config''
SETCOOKIE=: 0
NVDEBUG=: 0 NB. 1 shows NV on each input
INPUT=: '' NB. <'   '
NB. leading &nbsp; for Chrome delete all
LOG=: jmarka,'<div>&nbsp;<font style="font-size:20px; color:red;" >J Http Server</font></div>',jmarkz
LOGN=: ''
LOGFULL=: ''
PDFOUTPUT=: 'output pdf "',(jpath'~temp\pdf\plot.pdf'),'" 480 360;'  
DATAS=: ''
PS=: '/'
cfgfile=. jpath'~addons/ide/jhs/config/jhs_default.ijs'
r=. dobind BIND
if. r=10048 do.
 smoutput console_failed hrplc 'PORT CFGFILE';(":PORT);cfgfile
 'JHS init failed'assert 0
end.
sdcheck_jsocket_ r
sdcheck_jsocket_ sdlisten_jsocket_ SKLISTEN,1
SKSERVER_jhs_=: _1
boxdraw_j_ PC_BOXDRAW
remote=. >(BIND-:''){'';remoteaccess hrplc 'IPAD PORT';IP;":PORT
smoutput console_welcome hrplc 'PORT LOCAL REMOTE';(":PORT);LOCALHOST;remote
startupjhs''
if. 0~:#PASS do.
 cookie=: 'jcookie=',0j4":{:6!:0''
else.
 cookie=: ''
end.
input_jfe_=: input_jhs_  NB. only use jfe locale to redirect input/output
output_jfe_=: output_jhs_
jfe 1
)

NB. load rest of JHS core
load__'~addons/ide/jhs/utilh.ijs'
load__'~addons/ide/jhs/utiljs.ijs'
load__'~addons/ide/jhs/jgcp.ijs'

stub=: 3 : 0
'jev_get y[load''~addons/ide/jhs/',y,'.ijs'''
)

NB. app stubs to load app file
jev_get_jijx_=:    3 : (stub'jijx')
jev_get_jfile_=:   3 : (stub'jfile')
jev_get_jijs_=:    3 : (stub'jijs')
jev_get_jfif_=:    3 : (stub'jfif')
jev_get_jal_=:     3 : (stub'jal')
jev_get_jhelp_=:   3 : (stub'jhelp')
jev_get_jdemo_=:   3 : (stub'jdemo')
jev_get_jlogin_=:  3 : (stub'jlogin')
jev_get_jijxh_=:   3 : (stub'jijxh')
jev_get_jijxm_=:   3 : (stub'jijxm')
jev_get_jfilesrc_=:3 : (stub'jfilesrc')

NB. simple wget with sockets - used to get google charts png

NB. jwget 'host';'file'
NB. jwget 'chart.apis.google.com';'chart?&cht=p3....'
NB. simplistic - needs work to be robust and general
NB.! JHS get/put and jwget should probably share code
wget=: 3 : 0
'host file'=. y
ip=. >2{sdgethostbyname_jsocket_ host
try.
 sk=. >0{sdcheck_jsocket_ sdsocket_jsocket_''
 sdcheck_jsocket_ sdconnect_jsocket_ sk;AF_INET_jsocket_;ip;80
 t=. gettemplate rplc 'FILE';file
 while. #t do. t=.(>sdcheck_jsocket_ t sdsend_jsocket_ sk,0)}.t end.
 h=. d=. ''
 cl=. 0
 while. (0=#h)+.cl>#d do. NB. read until we have header and all data
  z=. sdselect_jsocket_ sk;'';'';5000
  assert sk e.>1{z NB. timeout
  'c r'=. sdrecv_jsocket_ sk,10000,0
  assert 0=c
  assert 0~:#r
  d=. d,r
  if. 0=#h do. NB. get headers
   i=. (d E.~ CRLF,CRLF)i.1 NB. headers CRLF delimited with CRLF at end
   if. i<#d do. NB. have headers
    i=. 4+i
    h=. i{.d NB. headers
    d=. i}.d
    i=. ('Content-Length:'E. h)i.1
    assert i<#h
    t=. (15+i)}.h
    t=. (t i.CR){.t
    cl=. _1".W__=:t
    assert _1~:cl
   end.
  end.
 end.
catch.
 sdclose_jsocket_ sk
 smoutput 13!:12''
 'get error' assert 0
end.
sdclose_jsocket_ sk
h;d
)

jwget_z_=: wget_jhs_

NB. jwget template
gettemplate=: toCRLF 0 : 0
GET /FILE HTTP/1.1 
Host: 127.0.0.1
Accept: image/gif,image/png,*/*  
Accept-Language: en-ca
UA-CPU: x86
Accept-Encoding: gzip, deflate
User-Agent: Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729)
Connection: Keep-Alive

)
