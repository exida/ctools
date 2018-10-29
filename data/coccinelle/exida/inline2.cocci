virtual patch
virtual report
virtual context
virtual org

@r1a@
function f;
position p;
expression e1,e2,e3,e4;
identifier d1,d2,d3,d4;
type t1,t2,t3,t4;
@@
inline f@p(...){
<+...
(
e1;
|
t1 d1=e1;
)
(
e2;
|
t2 d2=e2;
)
(
e3;
|
t3 d3=e3;
)
(
e4;
|
t4 d4=e4;
| return e4;
)
...+>
}


@script:python depends on report@
p << r1a.p;
@@
coccilib.report.print_report(p[0],"Inline function with more than 3 expressions")
