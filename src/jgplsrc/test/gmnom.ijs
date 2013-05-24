NB. x p. y multinomials -------------------------------------------------

p1=: 4 : 0 " 1 0
 ((>y)^/e) +/ .* c [ 'c e'=. |:>x
)

pn=: 4 : 0 " 1 0
 t=. >x
 c=. {."1 t
 e=. }."1 t
 ((>y) */ .^|:e) +/ .* c
)

NB. Boolean

(<x=.?5 2$2) (p1 -: p.) y=. ?7$2
(<x=.?5 2$2) (p1 -: p.) y=. _7+?2 3 4$13
(<x=.?5 2$2) (p1 -: p.) y=. o._7+?3 4$13
(<x=.?5 2$2) (p1 -: p.) y=. r._7+?2 1 4$13
(<x=.?5 2$2) (p1 -: p.) y=. _7+?2 1 4$13x
(<x=.?5 2$2) (p1 -: p.) y=. %/y+0=y=._7+?2 3 4$13x

NB. integer

(<x=.?5 2$10 6) (p1 -: p.) y=. ?7$2
(<x=.?5 2$10 6) (p1 -: p.) y=. _7+?2 3 4$13
(<x=.?5 2$10 6) (p1 -: p.) y=. o._7+?3 4$13
(<x=.?5 2$10 6) (p1 -: p.) y=. r._7+?2 1 4$13
(<x=.?5 2$10 6) (p1 -: p.) y=. _7+?2 1 4$13x
(<x=.?5 2$10 6) (p1 -: p.) y=. %/y+0=y=._7+?2 3 4$13x

NB. real

(<x=.-:?5 2$10 6) (p1 -: p.) y=. ?7$2
(<x=.-:?5 2$10 6) (p1 -: p.) y=. _7+?2 3 4$13
(<x=.-:?5 2$10 6) (p1 -: p.) y=. o._7+?3 4$13
(<x=.-:?5 2$10 6) (p1 -: p.) y=. r._7+?2 1 4$13
(<x=.-:?5 2$10 6) (p1 -: p.) y=. _7+?2 1 4$13x
(<x=.-:?5 2$10 6) (p1 -: p.) y=. %/y+0=y=._7+?2 3 4$13x

NB. complex

(<x=.j./?2 5 2$10 6) (p1 -: p.) y=. ?7$2
(<x=.j./?2 5 2$10 6) (p1 -: p.) y=. _7+?2 3 4$13
(<x=.j./?2 5 2$10 6) (p1 -: p.) y=. o._7+?3 4$13
(<x=.j./?2 5 2$10 6) (p1 -: p.) y=. r._7+?2 1 4$13
(<x=.j./?2 5 2$10 6) (p1 -: p.) y=. _7+?2 1 4$13x
(<x=.j./?2 5 2$10 6) (p1 -: p.) y=. %/y+0=y=._7+?2 3 4$13x

NB. extended integer

(<x=.?5 2$10 6x) (p1 -: p.) y=. ?7$2
(<x=.?5 2$10 6x) (p1 -: p.) y=. _7+?2 3 4$13
(<x=.?5 2$10 6x) (p1 -: p.) y=. o._7+?3 4$13
(<x=.?5 2$10 6x) (p1 -: p.) y=. r._7+?2 1 4$13
(<x=.?5 2$10 6x) (p1 -: p.) y=. _7+?2 1 4$13x
(<x=.?5 2$10 6x) (p1 -: p.) y=. %/y+0=y=._7+?2 3 4$13x

NB. rational

(<x=.1r2 0+"1?5 2$10 6x) (p1 -: p.) y=. ?7$2
(<x=.1r2 0+"1?5 2$10 6x) (p1 -: p.) y=. _7+?2 3 4$13
(<x=.1r2 0+"1?5 2$10 6x) (p1 -: p.) y=. o._7+?3 4$13
(<x=.1r2 0+"1?5 2$10 6x) (p1 -: p.) y=. r._7+?2 1 4$13
(<x=.1r2 0+"1?5 2$10 6x) (p1 -: p.) y=. _7+?2 1 4$13x
(<x=.1r2 0+"1?5 2$10 6x) (p1 -: p.) y=. %/y+0=y=._7+?2 3 4$13x

NB. Boolean

(<x=.?5 4$2) (pn -: p.) y=. <"1 ?7 3$2
(<x=.?5 4$2) (pn -: p.) y=. <"1 ] _7+?2 3 3$13
(<x=.?5 4$2) (pn -: p.) y=. <"1 o._7+?3 3$13
(<x=.?5 4$2) (pn -: p.) y=. <"1 r._7+?2 1 3$13
(<x=.?5 4$2) (pn -: p.) y=. <"1 _7+?2 1 3$13x
(<x=.?5 4$2) (pn -: p.) y=. <"1 %/y+0=y=._7+?2 3 3$13x

NB. integer

(<x=.?5 4$20 4 4 4) (pn -: p.) y=. <"1 ?7 3$2
(<x=.?5 4$20 4 4 4) (pn -: p.) y=. <"1 ] _7+?2 3 3$13
(<x=.?5 4$20 4 4 4) (pn -: p.) y=. <"1 o._7+?3 3$13
(<x=.?5 4$20 4 4 4) (pn -: p.) y=. <"1 r._7+?2 1 3$13
(<x=.?5 4$20 4 4 4) (pn -: p.) y=. <"1 _7+?2 1 3$13x
(<x=.?5 4$20 4 4 4) (pn -: p.) y=. <"1 %/y+0=y=._7+?2 3 3$13x

NB. real

(<x=.-:?5 4$20 4 4 4) (pn -: p.) y=. <"1 ?7 3$2
(<x=.-:?5 4$20 4 4 4) (pn -: p.) y=. <"1 ] _7+?2 3 3$13
(<x=.-:?5 4$20 4 4 4) (pn -: p.) y=. <"1 o._7+?3 3$13
(<x=.-:?5 4$20 4 4 4) (pn -: p.) y=. <"1 r._7+?2 1 3$13
(<x=.-:?5 4$20 4 4 4) (pn -: p.) y=. <"1 _7+?2 1 3$13x
(<x=.-:?5 4$20 4 4 4) (pn -: p.) y=. <"1 %/y+0=y=._7+?2 3 3$13x

NB. complex

(<x=.j./?2 5 4$20 4 4 4) (pn -: p.) y=. <"1 ?7 3$2
(<x=.j./?2 5 4$20 4 4 4) (pn -: p.) y=. <"1 ] _7+?2 3 3$13
(<x=.j./?2 5 4$20 4 4 4) (pn -: p.) y=. <"1 o._7+?3 3$13
(<x=.j./?2 5 4$20 4 4 4) (pn -: p.) y=. <"1 r._7+?2 1 3$13
(<x=.j./?2 5 4$20 4 4 4) (pn -: p.) y=. <"1 _7+?2 1 3$13x
(<x=.j./?2 5 4$20 4 4 4) (pn -: p.) y=. <"1 %/y+0=y=._7+?2 3 3$13x

NB. extended integer

(<x=.?5 4$20 4 4 4x) (pn -: p.) y=. <"1 ?7 3$2
(<x=.?5 4$20 4 4 4x) (pn -: p.) y=. <"1 ] _7+?2 3 3$13
(<x=.?5 4$20 4 4 4x) (pn -: p.) y=. <"1 o._7+?3 3$13
(<x=.?5 4$20 4 4 4x) (pn -: p.) y=. <"1 r._7+?2 1 3$13
(<x=.?5 4$20 4 4 4x) (pn -: p.) y=. <"1 _7+?2 1 3$13x
(<x=.?5 4$20 4 4 4x) (pn -: p.) y=. <"1 %/y+0=y=._7+?2 3 3$13x

NB. rational

(<x=.1r2 0 0 0+"1?5 4$20 4 4 4) (pn -: p.) y=. <"1 ?7 3$2
(<x=.1r2 0 0 0+"1?5 4$20 4 4 4) (pn -: p.) y=. <"1 ] _7+?2 3 3$13
(<x=.1r2 0 0 0+"1?5 4$20 4 4 4) (pn -: p.) y=. <"1 o._7+?3 3$13
(<x=.1r2 0 0 0+"1?5 4$20 4 4 4) (pn -: p.) y=. <"1 r._7+?2 1 3$13
(<x=.1r2 0 0 0+"1?5 4$20 4 4 4) (pn -: p.) y=. <"1 _7+?2 1 3$13x
(<x=.1r2 0 0 0+"1?5 4$20 4 4 4) (pn -: p.) y=. <"1 %/y+0=y=._7+?2 3 3$13x

'domain error' -: (<2 3$'abc') p. etx 3    
'domain error' -: (<2 3$<3   ) p. etx 3    
'domain error' -: (<i.3 2)     p. etx 'ab' 
'domain error' -: ('a';_3 7)   p. etx 4 5  
'domain error' -: (3;'abc')    p. etx 4 5  
'domain error' -: (3;<<1 2 3)  p. etx 4 5  
'domain error' -: ((<3);2 3)   p. etx 4 5  

'length error' -: (<i.4 3)     p. etx <3 4 5   
'length error' -: (<i.4 3)     p. etx <,3 
'length error' -: (<i.4 3)     p. etx 3 4;5 6;,7

'rank error'   -: (3 4;1 2 3)  p. etx 4 5     
'rank error'   -: (3;i.2 3)    p. etx 4 5     


NB. x p.!.s y -----------------------------------------------------------


4!:55 ;:'x y p1 pn'