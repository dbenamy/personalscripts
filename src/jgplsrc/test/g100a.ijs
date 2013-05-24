NB. B + B ---------------------------------------------------------------

x=. ?100$2
y=. ?100$2
(x+y) -: (#.x,.y){0 1 1 2
(x+y) -: (z+x)+z+y   [ z=.{.0 4.5
(x+y) -: (z*x)+z*y   [ z=.{.1 4j5
(z+y) -: (($y)$z)+y  [ z=.?2
(x+z) -: x+($x)$z    [ z=.?2

(x+y) -: (40$"0 x)+y [ x=. ?10$2    [ y=. ?10 40$2
(x+y) -: x+40$"0 y   [ x=. ?10 40$2 [ y=. ?10$2

0 1 1 2 -: 0 0 1 1 + 0 1 0 1

'domain error' -: 1 0 1 + etx 'abc'
'domain error' -: 1 0 1 + etx <123


NB. B + I ---------------------------------------------------------------

x=. ?100$2
y=. _1e5+?100$2e5
(x+y) -: (z+x)+z+y   [ z=.{.0 4.5
(x+y) -: (z*x)+z*y   [ z=.{.1 4j5
(z+y) -: (($y)$z)+y  [ z=.?2
(x+z) -: x+($x)$z    [ z=._1e5+?2e5

(x+y) -: (40$"0 x)+y [ x=. ?10$2    [ y=. _1e5+?10 40$2e5
(x+y) -: x+40$"0 y   [ x=. ?10 40$2 [ y=. _1e5+?10$2e5

_4 _3 _2 _1 1 2 3 4 -: 0 0 0 0 1 1 1 1 + _4 _3 _2 _1 0 1 2 3
((2^31),_2147483647) -: 1 + 2147483647 _2147483648


NB. B + D ---------------------------------------------------------------

x=. ?100$2
y=. o._1e5+?100$2e5
(x+y) -: (z+x)+z+y   [ z=.{.0 4.5
(x+y) -: (z*x)+z*y   [ z=.{.1 4j5
(z+y) -: (($y)$z)+y  [ z=.?2
(x+z) -: x+($x)$z    [ z=.o._1e5+?2e5

(x+y) -: (40$"0 x)+y [ x=. ?10$2    [ y=. o._1e5+?10 40$2e5
(x+y) -: x+40$"0 y   [ x=. ?10 40$2 [ y=. o._1e5+?10$2e5

2.5 1.5 1.5 0.5 _0.5 -: 0 0 1 1 1 + 2.5 1.5 0.5 _0.5 _1.5


NB. I + B ---------------------------------------------------------------

x=. _1e5+?100$2e5
y=. ?100$2
(x+y) -: (z+x)+z+y   [ z=.{.0 4.5
(x+y) -: (z*x)+z*y   [ z=.{.1 4j5
(z+y) -: (($y)$z)+y  [ z=._1e5+?2e5
(x+z) -: x+($x)$z    [ z=.?2

(x+y) -: (40$"0 x)+y [ x=. _1e5+?10$2e5    [ y=. ?10 40$2
(x+y) -: x+40$"0 y   [ x=. _1e5+?10 40$2e5 [ y=. ?10$2

6 5 9 -: 6 4 9 + 0 1 0
((2^31),_2147483647) -: 2147483647 _2147483648 + 1

'domain error' -: 1 2 3 + etx 'abc'
'domain error' -: 1 2 3 + etx <123


NB. I + I ---------------------------------------------------------------

x=. _1e5+?100$2e5
y=. _1e5+?100$2e5
(x+y) -: (z+x)+z+y   [ z=.{.0 4.5
(x+y) -: (z*x)+z*y   [ z=.{.1 4j5
(z+y) -: (($y)$z)+y  [ z=.?2e6
(x+z) -: x+($x)$z    [ z=._1e5+?2e5

(x+y) -: (40$"0 x)+y [ x=. _1e5+?10$2e5    [ y=. _1e5+?10 40$2e5
(x+y) -: x+40$"0 y   [ x=. _1e5+?10 40$2e5 [ y=. _1e5+?10$2e5

3 4 5 6 -: 3+i.4
3 2e9 -: 1 5e8+2 15e8
4e9 -: 2e9+2e9


NB. I + D ---------------------------------------------------------------

x=. _1e5+?100$2e5
y=. o._1e5+?100$2e5
(x+y) -: (z+x)+z+y   [ z=.{.0 4.5
(x+y) -: (z*x)+z*y   [ z=.{.1 4j5
(z+y) -: (($y)$z)+y  [ z=.?2e6
(x+z) -: x+($x)$z    [ z=.o._1e5+?2e5

(x+y) -: (40$"0 x)+y [ x=. _1e5+?10$2e5    [ y=. o._1e5+?10 40$2e5
(x+y) -: x+40$"0 y   [ x=. _1e5+?10 40$2e5 [ y=. o._1e5+?10$2e5

3.5 4.5 5.5 6.5 -: (i.4)+3.5


NB. D + B ---------------------------------------------------------------

x=. o._1e5+?100$2e5
y=. ?100$2
(x+y) -: (z+x)+z+y   [ z=.{.0 4.5
(x+y) -: (z*x)+z*y   [ z=.{.1 4j5
(z+y) -: (($y)$z)+y  [ z=.o._1e5+?2e5
(x+z) -: x+($x)$z    [ z=.?2

(x+y) -: (40$"0 x)+y [ x=. o._1e5+?10$2e5    [ y=. ?10 40$2
(x+y) -: x+40$"0 y   [ x=. o._1e5+?10 40$2e5 [ y=. ?10$2

1.25 -: 0.25 + 1

'domain error' -: 1.2 2 3 + etx 'abc'
'domain error' -: 1.2 2 3 + etx <123


NB. D + I ---------------------------------------------------------------

x=. o._1e5+?100$2e5
y=. _1e5+?100$2e5
(x+y) -: (z+x)+z+y   [ z=.{.0 4.5
(x+y) -: (z*x)+z*y   [ z=.{.1 4j5
(z+y) -: (($y)$z)+y  [ z=.o._1e5+?2e5
(x+z) -: x+($x)$z    [ z=._1e5+?2e5

(x+y) -: (40$"0 x)+y [ x=. o._1e5+?10$2e5    [ y=. _1e5+?10 40$2e5
(x+y) -: x+40$"0 y   [ x=. o._1e5+?10 40$2e5 [ y=. _1e5+?10$2e5

5.1415926 -: 3.1415926 + 2


NB. D + D ---------------------------------------------------------------

x=. o._1e5+?100$2e5
y=. o._1e5+?100$2e5
(x+y) -: (z+x)+z+y   [ z=.{.0 4.5
(x+y) -: (z*x)+z*y   [ z=.{.1 4j5
(z+y) -: (($y)$z)+y  [ z=.o._1e5+?2e5
(x+z) -: x+($x)$z    [ z=.o._1e5+?2e5

(x+y) -: (40$"0 x)+y [ x=. o._1e5+?10$2e5    [ y=. o._1e5+?10 40$2e5
(x+y) -: x+40$"0 y   [ x=. o._1e5+?10 40$2e5 [ y=. o._1e5+?10$2e5

10.5 _10.5 -: 9.1 _10 + 1.4 _0.5

4!:55 ;:'x y z'


