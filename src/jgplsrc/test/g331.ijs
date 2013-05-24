NB. ;.n -----------------------------------------------------------------

'domain error' -: ex ' [;.''2'''
'domain error' -: ex ' [;.4'
'domain error' -: ex ' <;.4x'
'domain error' -: ex '+/;.3.4'
'domain error' -: ex ' <;.3j4'
'domain error' -: ex ' <;.3r4'
'domain error' -: ex ' <;.(<2)'

'rank error'   -: ex '<;.1 2'


NB. f;.0 ----------------------------------------------------------------

a=:0 1 1,:2 2  3
b=:0 1 1,:2 2 _3
w=:i.2 3 5

(a[;.0 w) -: (1{a){.(0{a)}.w
(b[;.0 w) -: |."1 a[;.0 w
([;.0 w)  -: |.|."1|."2 w

w=:a.{~i.2 3 4 5
(a[;.0 w) -: (1{a){.(0{a)}.w
( [;.0 w) -: (i.-$w){,w

a=: 'abcdefghijklmnopqrstuvwxyz'
(|.a) -: [;.0 a
'fghi' -: (,. 5  4) [;.0 a
'ihgf' -: (,. 5 _4) [;.0 a
'stuv' -: (,._5  4) [;.0 a
'vuts' -: (,._5 _4) [;.0 a

f=: 4 : 0
 (x [;.0 y) -: > x <;.0 y
)

(,."1 ] 5 4*"1 ] _1^#:i.4) f"2 1 a
(,."1 ] 5 4*"1 ] _1^#:i.4) f"2 1 x=: ?100$1e6

(2 2$"1 ] 2 3 4 5*"1 ] _1^#:i.16) f"2 x=: a.{~?10 11$#a.
(2 2$"1 ] 2 3 4 5*"1 ] _1^#:i.16) f"2 x=: ?11 10$1e6
(,."1 ] 5 4*"1 ] _1^#:i.4)        f"2 x=: ?11 13$1e6

'' -: (,. 25 0)[;.0 a
'' -: (,. 26 0)[;.0 a
'' -: (,._26 0)[;.0 a
'' -: (,._27 0)[;.0 a
a  -: (i.2 0  )[;.0 a
(,'z' ) -: (,. 25 4) [;.0 a
'yz'    -: (,. 24 4) [;.0 a
'xyz'   -: (,. 23 4) [;.0 a
'wxyz'  -: (,. 22 4) [;.0 a
'vwxy'  -: (,. 21 4) [;.0 a
'abc'   -: (,. _24 7) [;.0 a
'ab'    -: (,. _25 7) [;.0 a
(,'a')  -: (,. _26 7) [;.0 a

(i.2 0 4) -: (1,:2 0 4) [;.0 [ 4 5 6$'a'

(i.-4 5) -: [;.0 i.4 5
(<@(+i.)/"1 m) -: (,."1 m=:|(i.26)+/0 _26) <;.0 i.26
(<@(+i.)/"1 m) -: (,."1 m=: (i.26)+/0 _26) <;.0 i.26

'length error' -: (1,:2 3 4) <;.0 etx i.2 3
'length error' -: (i.3 2)    <;.0 etx i.2 3

'domain error' -: 'abc'   [;.0 etx i.3 4
'domain error' -: (3;4 5) [;.0 etx i.3 4
'domain error' -: 3j4 5j6 [;.0 etx i.3 4

'index error'  -: (,. 26 4) [;.0 etx i.26
'index error'  -: (,._27 4) [;.0 etx i.26


NB. f;.n y ------------------------------------------------------------

t=:'a bc def ghij'
x=:'abcd efg hi j'

(' a';' bc';' def';' ghij')  -: <;. 1 ' ',t
((,'a');'bc';'def';'ghij')   -: <;._1 ' ',t
('a ';'bc ';'def ';'ghij ')  -: <;. 2 t,' '
((,'a');'bc';'def';'ghij')   -: <;._2 t,' '
(' abcd';' efg';' hi';' j')  -: <;. 1 ' ',x
('abcd';'efg';'hi';,'j')     -: <;._1 ' ',x
('abcd ';'efg ';'hi ';,'j ') -: <;. 2 x,' '
('abcd';'efg';'hi';,'j')     -: <;._2 x,' '

(<;.1 ' ',t) -: <;.1x  ' ',t
(<;.1 ' ',t) -: <;.1r1 ' ',t

(4 5$' a    bc   def  ghij') -: ,;. 1 ' ',t
(4 4$'a   bc  def ghij')     -: ,;._1 ' ',t
(4 5$'a    bc   def  ghij ') -: ,;. 2 t,' '
(4 4$'a   bc  def ghij')     -: ,;._2 t,' '
(4 5$' abcd efg  hi   j   ') -: ,;. 1 ' ',x
(4 4$'abcdefg hi  j   ')     -: ,;._1 ' ',x
(4 5$'abcd efg  hi   j    ') -: ,;. 2 x,' '
(4 4$'abcdefg hi  j   ')     -: ,;._2 x,' '

(,.2 3 4 5) -: $;. 1 ' ',t
(,.1 2 3 4) -: $;._1 ' ',t
(,.2 3 4 5) -: $;. 2 t,' '
(,.1 2 3 4) -: $;._2 t,' '
(,.5 4 3 2) -: $;. 1 ' ',x
(,.4 3 2 1) -: $;._1 ' ',x
(,.5 4 3 2) -: $;. 2 x,' '
(,.4 3 2 1) -: $;._2 x,' '

2 3 4 5 -: #;. 1 ' ',t
1 2 3 4 -: #;._1 ' ',t
2 3 4 5 -: #;. 2 t,' '
1 2 3 4 -: #;._2 t,' '
5 4 3 2 -: #;. 1 ' ',x
4 3 2 1 -: #;._1 ' ',x
5 4 3 2 -: #;. 2 x,' '
4 3 2 1 -: #;._2 x,' '

(4 5$' a    bc   def  ghij') -: [;. 1 ' ',t
(4 4$'a   bc  def ghij')     -: [;._1 ' ',t
(4 5$'a    bc   def  ghij ') -: [;. 2 t,' '
(4 4$'a   bc  def ghij')     -: [;._2 t,' '
(4 5$' abcd efg  hi   j   ') -: [;. 1 ' ',x
(4 4$'abcdefg hi  j   ')     -: [;._1 ' ',x
(4 5$'abcd efg  hi   j    ') -: [;. 2 x,' '
(4 4$'abcdefg hi  j   ')     -: [;._2 x,' '

(4 5$' a    bc   def  ghij') -: ];. 1 ' ',t
(4 4$'a   bc  def ghij')     -: ];._1 ' ',t
(4 5$'a    bc   def  ghij ') -: ];. 2 t,' '
(4 4$'a   bc  def ghij')     -: ];._2 t,' '
(4 5$' abcd efg  hi   j   ') -: ];. 1 ' ',x
(4 4$'abcdefg hi  j   ')     -: ];._1 ' ',x
(4 5$'abcd efg  hi   j    ') -: ];. 2 x,' '
(4 4$'abcdefg hi  j   ')     -: ];._2 x,' '

'    ' -: {.;. 1 ' ',t
'abdg' -: {.;._1 ' ',t
'abdg' -: {.;. 2 t,' '
'abdg' -: {.;._2 t,' '
'    ' -: {.;. 1 ' ',x
'aehj' -: {.;._1 ' ',x
'aehj' -: {.;. 2 x,' '
'aehj' -: {.;._2 x,' '

'acfj' -: {:;. 1 ' ',t
'acfj' -: {:;._1 ' ',t
'    ' -: {:;. 2 t,' '
'acfj' -: {:;._2 t,' '
'dgij' -: {:;. 1 ' ',x
'dgij' -: {:;._1 ' ',x
'    ' -: {:;. 2 x,' '
'dgij' -: {:;._2 x,' '

1: #;. 1 x=:1
1: #;._1 x
1: #;. 2 x
1: #;._2 x
1: #;. 1 x=:'a'
1: #;._1 x
1: #;. 2 x
1: #;._2 x
1: <;. 1 x=:1
1: <;._1 x
1: <;. 2 x
1: <;._2 x
1: <;. 1 x=:'a'
1: <;._1 x
1: <;. 2 x
1: <;._2 x


NB. x f;.n y ------------------------------------------------------------

('ab';'cd';'efg')  -: 1 0 1 0 1 0 0 <;. 1 'abcdefg'
(,&.>'b';'d';'fg') -: 1 0 1 0 1 0 0 <;._1 'abcdefg'

('ab';'cd';'efg')  -: 0 0 1 0 1 0 1 0 0 <;. 1 'xyabcdefg'
(,&.>'b';'d';'fg') -: 0 0 1 0 1 0 1 0 0 <;._1 'xyabcdefg'

('ab';'cd';'efg')  -: 0 1 0 1 0 0 1 <;. 2 'abcdefg'
(,&.>'a';'c';'ef') -: 0 1 0 1 0 0 1 <;._2 'abcdefg'

('ab';'cd';'efg')  -: 0 1 0 1 0 0 1 0 0 <;. 2 'abcdefgxy'
(,&.>'a';'c';'ef') -: 0 1 0 1 0 0 1 0 0 <;._2 'abcdefgxy'

5 9 21 -: 1 0 1 0 1 0 0 +/;. 1 [ 2 3 4 5 6 7 8
3 5 15 -: 1 0 1 0 1 0 0 +/;._1 [ 2 3 4 5 6 7 8

5 9 21 -: 0 0 1 0 1 0 1 0 0 +/;. 1 [ 99 98 2 3 4 5 6 7 8
3 5 15 -: 0 0 1 0 1 0 1 0 0 +/;._1 [ 99 98 2 3 4 5 6 7 8

5 9 21 -: 0 1 0 1 0 0 1 +/;. 2 [ 2 3 4 5 6 7 8
2 4 13 -: 0 1 0 1 0 0 1 +/;._2 [ 2 3 4 5 6 7 8

5 9 21 -: 0 1 0 1 0 0 1 0 0 +/;. 2 [ 2 3 4 5 6 7 8 99 98
2 4 13 -: 0 1 0 1 0 0 1 0 0 +/;._2 [ 2 3 4 5 6 7 8 99 98


p=: ?100$2
q=: ?100 7$100

(p {.;.1 q) -: p (3 : '{.y');.1 q
(p {:;.1 q) -: p (3 : '{:y');.1 q

(+/x) -: '' +/;.1 x=: ?100$100


NB. f;.1 and f;._1 ------------------------------------------------------

x=:' Now! is the time, all good men!'
((x e.' ')<;. 1 x) -: <;. 1 x
((x e.' ')<;._1 x) -: <;._1 x
('Now!';'is';'the';'time,';'all';'good';'men!') -: <;._1 x

b=:1 0 0 1 1 0
x=:b <;.1 i.6 2
3=$x
(#;.1 b) -: #&>x

(,:'cdef') -: 0 0 1 0 0 0 [;.1 'abcdef'

(,<,3)      -: <;.1 (3)
(,<,3)      -: 1 <;.1 (3)
(,<'')      -: <;._1 (3)
(,<'')      -: 1 <;._1 (3)
(,<i.1 9 3) -: 1 <;. 1 i.1 9 3
(,<i.0 9 3) -: 1 <;._1 i.1 9 3
(10$<i.1 0) -: <;. 1 i.10 0
(10$<i.0 0) -: <;._1 i.10 0

'' -: '' <;.1 ''
'' -: <;.1 ''
'' -: <;._1 ''
'' -: 0 0 0 <;.1 'abc'

(<@, "0 x) -: 1  <;. 1 x=: 'abcdefg'
(<@}."0 x) -: 1  <;._1 x=: 'abcdefg'
x          -: 1 +/;. 1 x=: 2 3 4 5 6 7 8
(x-x)      -: 1 +/;._1 x=: 2 3 4 5 6 7 8

'length error' -: 1 0 0   <;. 1 etx 'abcde'
'length error' -: 1 0 0   <;. 1 etx 'ab'
'length error' -: (,1)    <;. 1 etx 'abcd'
'length error' -: 1 0 0 1 <;. 1 etx (4)

'domain error' -: 'abc'   <;. 1 etx i.3
'domain error' -: 2 0 0   <;. 1 etx 'abc'
'domain error' -: 3j4 1 1 <;._1 etx i.3


NB. f;.2 and f;._2 ------------------------------------------------------

t=:'Now! is the time, all good men! '
((t e.' ')<;. 2 t) -: <;. 2 t
((t e.' ')<;._2 t) -: <;._2 t
('Now!';'is';'the';'time,';'all';'good';'men!') -: <;._2 t

b=:0 0 1 1 0 1
x=:b <;.2 i.6 3 4
3=$x
(#;.2 b) -: #&>x

'' -: '' <;.2 ''
'' -: <;.2 ''
'' -: <;._2 ''
'' -: 0 0 0 <;.2 'abc'

(,:'abc') -: 0 0 1 0 0 0[;.2 'abcdef'

(,<,3)      -: <;.2 (3)
(,<,3)      -: 1 <;.2 (3)
(,<'')      -: <;._2 (3)
(,<'')      -: 1 <;._2 (3)
(,<i.1 9 3) -: 1 <;. 2 i.1 9 3
(,<i.0 9 3) -: 1 <;._2 i.1 9 3
(10$<i.1 0) -: <;. 2 i.10 0
(10$<i.0 0) -: <;._2 i.10 0

'' -: '' <;.2 ''
'' -: <;.2 ''
'' -: <;._2 ''
'' -: 0 0 0 <;.2 'abc'

(<@, "0 x) -: 1  <;. 2 x=: 'abcdefg'
(<@}."0 x) -: 1  <;._2 x=: 'abcdefg'
x          -: 1 +/;. 2 x=: 2 3 4 5 6 7 8
(x-x)      -: 1 +/;._2 x=: 2 3 4 5 6 7 8

'length error' -: 1 0 0   <;. 2 etx 'abcde'
'length error' -: 1 0 0   <;. 2 etx 'ab'
'length error' -: (,1)    <;. 2 etx 'abcd'
'length error' -: 1 0 0 1 <;. 2 etx (4)

'domain error' -: 'abc'   <;. 2 etx i.3
'domain error' -: 2 0 0   <;. 2 etx 'abc'
'domain error' -: 3j4 1 1 <;._2 etx i.3


NB. f;.n on special fns, n e. _2 _1 1 2 ---------------------------------

test=: 4 : 0
 assert. (#   ;. x y) -: (3 : '#    y');.x y
 assert. ($   ;. x y) -: (3 : '$    y');.x y
 assert. ({.  ;. x y) -: (3 : '{.   y');.x y
 assert. ({:  ;. x y) -: (3 : '{:   y');.x y
 assert. (,   ;. x y) -: (3 : ',    y');.x y
 assert. ([   ;. x y) -: (3 : '[    y');.x y
 assert. (]   ;. x y) -: (3 : ']    y');.x y
 assert. (<   ;. x y) -: (3 : '<    y');.x y
 assert. (<@}.;. x y) -: (3 : '<@}. y');.x y
 assert. (<@}:;. x y) -: (3 : '<@}: y');.x y
 b=. (#y){.(i._2+#y) e. +/\2+?(#y)$10
 assert. (b #   ;. x y) -: b (3 : '#    y');.x y
 assert. (b $   ;. x y) -: b (3 : '$    y');.x y
 assert. (b {.  ;. x y) -: b (3 : '{.   y');.x y
 assert. (b {:  ;. x y) -: b (3 : '{:   y');.x y
 assert. (b ,   ;. x y) -: b (3 : ',    y');.x y
 assert. (b [   ;. x y) -: b (3 : '[    y');.x y
 assert. (b ]   ;. x y) -: b (3 : ']    y');.x y
 assert. (b <   ;. x y) -: b (3 : '<    y');.x y
 assert. (b <@}.;. x y) -: b (3 : '<@}. y');.x y
 assert. (b <@}:;. x y) -: b (3 : '<@}: y');.x y
 1
)

1  test t=: 'a' ( 0,(<&3000 # ]) +/\2+?40$1500)}3000$'xyz'
_1 test t
2  test t=: 'a' (_1,(<&3000 # ]) +/\2+?40$1500)}3000$'xyz'
_2 test t

1  test t=: (2 3$'abcdef') ( 0,(<&998 # ])+/\2+?40$50)}a.{~?1000 2 3$#a.
_1 test t
2  test t=: (2 3$'abcdef') (_1,(<&998 # ])+/\2+?40$50)}a.{~?1000 2 3$#a.
_2 test t

1  test t=: 11 ( 0,(<&3000 # ]) +/\2+?40$1500)}?3000$10
_1 test t
2  test t=: 11 (_1,(<&3000 # ]) +/\2+?40$1500)}?3000$10
_2 test t

1  test t=: (-i.2 3) ( 0,(<&998 # ])+/\2+?40$50)}?1000 2 3$100
_1 test t
2  test t=: (-i.2 3) (_1,(<&998 # ])+/\2+?40$50)}?1000 2 3$100
_2 test t

(<@}.;._1 t) -: (3 : '<}.y') ;._1 t=: ' foo upon  thee'
(<@}:;._1 t) -: (3 : '<}:y') ;._1 t=: 'foo upon  thee '

'a d'    -: {.;._1 ',abc,,d'
 2 1 0 3 -: {.;._2 ] 2 3 4 1 2 4 4 3 4 


NB. f;.3 and f;._3 ------------------------------------------------------

'domain error' -: 'ab'       $;. 3 etx i.3 4
'domain error' -: (1,:3.4 5) $;. 3 etx i.3 4
'domain error' -: (1 2;3 4)  $;. 3 etx i.3 4
'domain error' -: (_1,:2)    <;. 3 etx i.12
'length error' -: (1,:2 3)   <;. 3 etx i.12

'domain error' -: 'ab'       $;._3 etx i.3 4
'domain error' -: (1,:3.4 5) $;._3 etx i.3 4
'domain error' -: (1 2;3 4)  $;._3 etx i.3 4
'domain error' -: (_1,:2)    <;._3 etx i.12
'length error' -: (1,:2 3)   <;._3 etx i.12

size =: #@$ $ <./@$
i1   =: 3 : '{($y)-&.>~i.&.>$y'

f1 =: 3 : 0
 t=.(i1 y){.&.><y
 if. -.0 e.$t do. t=.(($&.>t)<.&.><size y){.&.>t end.
 t
)

*./ (f1 -: <;.3)@i. 5 5  #:i.25
*./ (f1 -: <;.3)@i. 3 3 3#:i.27

i2 =: 3 : '{ (size y) ((<:|)#])&.>($y)-&.>~i.&.>$y'

f2 =: 3 : 0
 t=.(i2 y){.&.><y
 if. -.0 e.$t do. t=.(($&.>t)<.&.><size y){.&.>t end.
 t
)

*./ (f2 -: <;._3)@i. 5 5  #:i.25
*./ (f2 -: <;._3)@i. 3 3 3#:i.27

f3 =: 4 : '((<{:x)=$&.>t)#t=.x<;.3 y'

*./ (,."1[7 8#:   i.28) (f3-:<;._3)"2 i.30
*./ (,."1[7 8#:28+i.28) (f3-:<;._3)"2 i.30

f4 =: 4 : '(x,.0,:(({:$x)-#$y){.$y) <;.3 y'

(i.2 0) (f4-:<;.3) i.4 5
(i.2 0) (f4-:<;.3) i.3 4 5
*./ b=:(,."1 [7 8#:   i.28) (f4-:<;.3)"2 _ i.4 5
*./ b=:(,."1 [7 8#:28+i.28) (f4-:<;.3)"2 _ i.4 5
*./ b=:(,."1 [7 8#:   i.28) (f4-:<;.3)"2 _ i.3 4 5
*./ b=:(,."1 [7 8#:28+i.28) (f4-:<;.3)"2 _ i.3 4 5

f5 =: 4 : '(x,.0,:(({:$x)-#$y){.$y) <;._3 y'

(i.2 0) (f5-:<;._3) i.4 5
(i.2 0) (f5-:<;._3) i.3 4 5
*./ (,."1 [7 8#:   i.28) (f5-:<;._3)"2 _ i.4 5
*./ (,."1 [7 8#:28+i.28) (f5-:<;._3)"2 _ i.4 5
*./ (,."1 [7 8#:   i.28) (f5-:<;._3)"2 _ i.3 4 5
*./ (,."1 [7 8#:28+i.28) (f5-:<;._3)"2 _ i.3 4 5

'a' -: [;. 3 'a'
'a' -: [;._3 'a'
x -: [;. 3 x=:?1000001
x -: [;._3 x=:?1000001

x=: 4 5$0
y=: 0=?91 131$10
(x E. y) -: ($x) x&-:;.3 y

f1=: 4 : '{.&.> {. (1,.x) <;. 3 ,:y'
f2=: 4 : '{.&.> {. (1,.x) <;._3 ,:y'

(x=: ?3 4 2 2$9) (f1 -: <;. 3)"2 i. 11 13
(x=: ?3 4 2 2$9) (f2 -: <;._3)"2 i. 11 13


4!:55 ;:'a b c f f1 f2 f3 f4 f5'
4!:55 ;:'i1 i2 m p q size t test testw w x y'


